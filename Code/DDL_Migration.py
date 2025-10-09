import subprocess
import shutil
import os
import glob
import csv
import tempfile
import re
import json
import teradatasql
import time
from github import Github
import snowflake.connector

# hello
# --- Paths ---
bteq_scripts_dir = "/root/Desktop/Extraction_Scripts_Updated"
ddls_dir = "/root/Desktop/DDLs"
snowconvert_input_dir = "/root/Desktop/Snowconvert_input"
snowconvert_output_dir = "/root/Desktop/Snowconvert_output"
repo_dir = "/root/Desktop/Teradata_To_Snowflake"
repo_name = 'Teradata_Migration'
final_output_dir = os.path.join(repo_dir, "DDLs")
teradata_ddls_dir = os.path.join(final_output_dir, "Teradata_DDLs")
snowflake_ddls_dir = os.path.join(final_output_dir, "Snowflake_DDLs")
renaming_file = "/root/Downloads/object_map.json"
database_list_csv = "/root/Downloads/Database_list.csv"
workflow_name = 'snowflake-devops-demo'
teradata_host = '127.0.0.1'
teradata_user = 'dbc'
teradata_password = 'dbc'
bucket_name = 'teradata_snowflake'
bucket_dir = 'sample'

# Schema change deployment order - tables first, then views, procedures, functions
DEPLOYMENT_ORDER = {
    'Tables': 1,
    'Views': 2,
    'Procedures': 3,
    'Functions': 4
}

def create_required_directories():
    """ 
    Creating all the required directories 
    """

    print("\n--- Creating required directories ---")
    required_dirs = [
        ddls_dir,
        snowconvert_input_dir,
        snowconvert_output_dir
    ]
    
    for directory in required_dirs:
        try:
            if os.path.exists(directory):
                shutil.rmtree(directory)
            os.makedirs(directory, exist_ok=True)
            print(f"✅ Created/verified directory: {directory}")
        except Exception as e:
            print(f"❌ Failed to create directory {directory}: {e}")
            raise RuntimeError(f"Failed to create required directory: {directory}")
    
    print("All required directories created successfully")

def read_database_schema_list():
    """ 
    Reading the CSV file 
    """

    print("\n--- Reading database and schema list from CSV ---")
    database_schema_list = []
    try:
        with open(database_list_csv, 'r', encoding='utf-8-sig') as file:
            reader = csv.DictReader(file)
            current_database = None
            row_num = 0

            print(f"CSV Headers: {reader.fieldnames}")

            for row in reader:
                row_num += 1
                print(f"Processing row {row_num}: {row}")

                db_name_raw = row.get('DatabaseName') or row.get('\ufeffDatabaseName')
                schema_name_raw = row.get('SchemaName')

                db_name = db_name_raw.strip() if db_name_raw is not None else ''
                schema_name = schema_name_raw.strip() if schema_name_raw is not None else ''

                print(f"  Raw values - DB: '{db_name_raw}', Schema: '{schema_name_raw}'")
                print(f"  Processed values - DB: '{db_name}', Schema: '{schema_name}'")

                if db_name:
                    current_database = db_name
                    print(f"  Updated current_database to: {current_database}")
                else:
                    print(f"  Forward filling database name: {current_database}")

                if not schema_name:
                    schema_name = 'Snowconvert'
                    print(f"  Using default schema: {schema_name}")

                if current_database:
                    database_schema_list.append({
                        'database': current_database,
                        'schema': schema_name
                    })
                    print(f"  Added: {current_database}.{schema_name}")
                else:
                    print(f"  Warning: Skipping row {row_num} - no database name available (first row must have database name)")

        print(f"\nFound {len(database_schema_list)} database/schema combinations:")
        for item in database_schema_list:
            print(f"  - {item['database']}.{item['schema']}")

        if not database_schema_list:
            raise RuntimeError("No valid database/schema combinations found in CSV")

        return database_schema_list

    except Exception as e:
        print(f"Error reading CSV file: {e}")
        print(f"CSV file path: {database_list_csv}")
        raise

def generate_object_json(output_file="/root/Downloads/object_map.json"):
    """ 
    Create the JSON file for the renaming of the objects 
    """

    print("\n--- Generating object list JSON from Teradata ---")
    database_schema_list = read_database_schema_list()
    
    connection = teradatasql.connect(
        host = teradata_host,
        user = teradata_user,
        password = teradata_password
    )

    object_map = {
        "Tables": {},
        "Views": {},
        "Procedures": {},
        "Functions": {}
    }

    queries = {
        "Tables": "SELECT DatabaseName, TableName FROM DBC.TablesV WHERE TableKind = 'T' AND DatabaseName = ?",
        "Views": "SELECT DatabaseName, TableName FROM DBC.TablesV WHERE TableKind = 'V' AND DatabaseName = ?",
        "Procedures": "SELECT DatabaseName, TableName FROM DBC.TablesV WHERE TableKind = 'P' AND DatabaseName = ?",
        "Functions": "SELECT DatabaseName, TableName FROM DBC.TablesV WHERE TableKind = 'F' AND DatabaseName = ?"
    }

    try:
        cursor = connection.cursor()
        for entry in database_schema_list:
            db = entry['database']
            schema = entry['schema']
            print(f"\nProcessing {db}.{schema}...")

            for obj_type, sql in queries.items():
                cursor.execute(sql, (db,))
                rows = cursor.fetchall()
                for row in rows:
                    obj_name = row[1]
                    full_name_old = f"{db}.{obj_name}"
                    full_name_new = f"{db}.{schema}.{obj_name}"
                    object_map[obj_type][full_name_old] = full_name_new
                print(f"  - Found {len(rows)} {obj_type.lower()}")

    finally:
        connection.close()

    with open(output_file, 'w') as json_file:
        json.dump(object_map, json_file, indent=4)
        print(f"\n✅ Object mapping JSON saved to {output_file}")

def replace_placeholders_in_btq_files(database_name, schema_name):
    """
    Replace the placeholder in the btq files with the database and schema names from the csv file
    """

    temp_dir = tempfile.mkdtemp(prefix="btq_temp_")
    btq_files = glob.glob(os.path.join(bteq_scripts_dir, "*.btq"))
    modified_files = []

    for btq_file in btq_files:
        with open(btq_file, 'r') as file:
            content = file.read()
        content = content.replace('{{DATABASE_NAME}}', database_name)
        content = content.replace('{{SCHEMA_NAME}}', schema_name)
        temp_file = os.path.join(temp_dir, os.path.basename(btq_file))
        with open(temp_file, 'w') as file:
            file.write(content)
        modified_files.append(temp_file)

    return temp_dir, modified_files

def run_bteq_scripts_for_database_schema(database_name, schema_name):
    """
    Run the bteq scripts which will extract the object DDLs from Teradata
    """
    
    print(f"\n--- Running BTEQ scripts for {database_name}.{schema_name} ---")
    db_schema_dir = os.path.join(ddls_dir, database_name, schema_name)
    os.makedirs(db_schema_dir, exist_ok=True)
    os.makedirs(os.path.join(ddls_dir, "temp"), exist_ok=True)
    temp_dir, modified_btq_files = replace_placeholders_in_btq_files(database_name, schema_name)

    try:
        for btq_file in modified_btq_files:
            print(f"\n--- Running BTEQ script: {os.path.basename(btq_file)} ---")
            result = subprocess.run(['bteq'], input=open(btq_file, 'rb').read(), 
                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            print("--- BTEQ STDOUT ---")
            print(result.stdout.decode())
            print("--- BTEQ STDERR ---")
            print(result.stderr.decode())

            if result.returncode != 0:
                raise RuntimeError(f"BTEQ script failed: {btq_file}")

        print(f"All BTEQ scripts completed successfully for {database_name}.{schema_name}")

    finally:
        shutil.rmtree(temp_dir)

def run_all_bteq_scripts():
    print("\n--- Running BTEQ scripts for all database/schema combinations ---")
    database_schema_list = read_database_schema_list()
    for item in database_schema_list:
        run_bteq_scripts_for_database_schema(item['database'], item['schema'])
    print("All BTEQ scripts completed for all database/schema combinations")

def copy_ddls_to_snowconvert_input():
    """
    Copying the Teradata_DDLs folder to the Snowconvert_input directory 
    """

    print("\n--- Copying DDLs folder to SnowConvert input (excluding all temp folders) ---")
    for root, dirs, files in os.walk(ddls_dir):
        dirs[:] = [d for d in dirs if d.lower() != 'temp']
        rel_path = os.path.relpath(root, ddls_dir)
        dest_path = os.path.join(snowconvert_input_dir, rel_path)
        os.makedirs(dest_path, exist_ok=True)
        for file in files:
            src_file = os.path.join(root, file)
            dest_file = os.path.join(dest_path, file)
            shutil.copy2(src_file, dest_file)
            print(f"Copied file: {src_file} -> {dest_file}")
    print(f"✅ Completed copying DDLs to {snowconvert_input_dir}, excluding all temp folders.")

def run_snowconvert():
    """
    Run Snowconvert CLI to convert the DDLs into Snowflake's syntax
    """

    print("\n--- Running SnowConvert ---")
    result = subprocess.run([
        "snowct", "teradata",
        "-i", snowconvert_input_dir,
        "-o", snowconvert_output_dir,
        "--renamingFile", renaming_file
    ], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    print("--- SnowConvert STDOUT ---")
    print(result.stdout.decode())
    print("--- SnowConvert STDERR ---")
    print(result.stderr.decode())
    if result.returncode != 0:
        raise RuntimeError("SnowConvert failed")
    print("SnowConvert completed successfully")

def modify_ddl_statements(file_path):
    """
    Modify DDL statements in a SQL file to change "CREATE OR REPLACE" to "CREATE ... IF NOT EXISTS"
    
    Handles:
    - CREATE OR REPLACE TABLE -> CREATE TABLE IF NOT EXISTS
    - CREATE OR REPLACE VIEW -> CREATE VIEW IF NOT EXISTS  
    - CREATE OR REPLACE PROCEDURE -> CREATE PROCEDURE IF NOT EXISTS
    - CREATE OR REPLACE FUNCTION -> CREATE FUNCTION IF NOT EXISTS
    """

    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
        
        original_content = content
        
        # Define patterns for different object types
        patterns = [
            # TABLE: CREATE OR REPLACE TABLE -> CREATE TABLE IF NOT EXISTS
            (
                r'CREATE\s+OR\s+REPLACE\s+TABLE\s+',
                'CREATE TABLE IF NOT EXISTS ',
                'TABLE'
            ),
            # VIEW: CREATE OR REPLACE VIEW -> CREATE VIEW IF NOT EXISTS
            (
                r'CREATE\s+OR\s+REPLACE\s+VIEW\s+',
                'CREATE VIEW IF NOT EXISTS ',
                'VIEW'
            ),
            # PROCEDURE: CREATE OR REPLACE PROCEDURE -> CREATE PROCEDURE IF NOT EXISTS
            (
                r'CREATE\s+OR\s+REPLACE\s+PROCEDURE\s+',
                'CREATE PROCEDURE IF NOT EXISTS ',
                'PROCEDURE'
            ),
            # FUNCTION: CREATE OR REPLACE FUNCTION -> CREATE FUNCTION IF NOT EXISTS
            (
                r'CREATE\s+OR\s+REPLACE\s+FUNCTION\s+',
                'CREATE FUNCTION IF NOT EXISTS ',
                'FUNCTION'
            )
        ]
        
        modifications_made = []
        
        for pattern, replacement, object_type in patterns:
            matches = re.findall(pattern, content, re.IGNORECASE)
            if matches:
                content = re.sub(pattern, replacement, content, flags=re.IGNORECASE)
                modifications_made.append(f"{object_type}: {len(matches)} replacements")
        
        if modifications_made:
            with open(file_path, 'w', encoding='utf-8') as file:
                file.write(content)
            return modifications_made
        
        return []
        
    except Exception as e:
        print(f"Error modifying DDL file {file_path}: {e}")
        return []

def modify_all_ddl_files():
    """
    Handles the function call for all the sql files
    """

    print("\n--- Modifying DDL statements: CREATE OR REPLACE -> CREATE ... IF NOT EXISTS ---")
    
    converted_dir = os.path.join(snowconvert_output_dir, "Output/SnowConvert")
    if not os.path.exists(converted_dir):
        print(f"Warning: SnowConvert output directory not found: {converted_dir}")
        return
    
    total_files_processed = 0
    total_modifications = 0
    
    for root, dirs, files in os.walk(converted_dir):
        for file in files:
            if file.lower().endswith('.sql'):
                file_path = os.path.join(root, file)
                rel_path = os.path.relpath(file_path, converted_dir)
                
                modifications = modify_ddl_statements(file_path)
                total_files_processed += 1
                
                if modifications:
                    total_modifications += len(modifications)
                    print(f"  ✅ Modified {rel_path}:")
                    for mod in modifications:
                        print(f"    - {mod}")
                else:
                    print(f"  ℹ️  No changes needed for {rel_path}")
    
    print(f"\n--- DDL Modification Summary ---")
    print(f"Total files processed: {total_files_processed}")
    print(f"Total modifications made: {total_modifications}")
    print("All DDL files have been processed for CREATE OR REPLACE -> CREATE ... IF NOT EXISTS conversion")

def get_schema_change_prefix(folder_name, file_index):
    """ 
    Defining prefix for the sql files for ordered deployement 
    """

    order_prefix = {
        'Tables': '01',
        'Views': '02', 
        'Procedures': '03',
        'Functions': '04'
    }
    
    prefix = order_prefix.get(folder_name, '99_Unknown')
    return f"R__{prefix}__"

def copy_teradata_ddls_to_final():
    """
    Copy original Teradata DDLs to the Teradata_DDLs directory in final output
    """
    
    print("\n--- Copying original Teradata DDLs to final directory ---")
    
    # Remove existing Teradata_DDLs directory if it exists
    if os.path.exists(teradata_ddls_dir):
        shutil.rmtree(teradata_ddls_dir)
    os.makedirs(teradata_ddls_dir, exist_ok=True)
    
    # Copy from ddls_dir to teradata_ddls_dir, excluding temp folders
    for root, dirs, files in os.walk(ddls_dir):
        # Skip temp directories
        dirs[:] = [d for d in dirs if d.lower() != 'temp']
        
        rel_path = os.path.relpath(root, ddls_dir)
        dest_path = os.path.join(teradata_ddls_dir, rel_path)
        
        if rel_path != '.':  # Skip the root directory itself
            os.makedirs(dest_path, exist_ok=True)
        
        for file in files:
            src_file = os.path.join(root, file)
            if rel_path == '.':
                dest_file = os.path.join(teradata_ddls_dir, file)
            else:
                dest_file = os.path.join(dest_path, file)
            
            shutil.copy2(src_file, dest_file)
            print(f"Copied Teradata DDL: {src_file} -> {dest_file}")
    
    print(f"✅ Completed copying original Teradata DDLs to {teradata_ddls_dir}")

def copy_and_rename_snowflake_outputs():
    """
    Copy and rename converted Snowflake files to the Snowflake_DDLs directory
    """

    print("\n--- Copying and renaming converted Snowflake files ---")
    
    # Remove existing Snowflake_DDLs directory if it exists
    if os.path.exists(snowflake_ddls_dir):
        shutil.rmtree(snowflake_ddls_dir)
    os.makedirs(snowflake_ddls_dir, exist_ok=True)
    
    converted_dir = os.path.join(snowconvert_output_dir, "Output/SnowConvert")
    if not os.path.exists(converted_dir):
        print(f"Warning: SnowConvert output directory not found: {converted_dir}")
        return
    
    for database_name in os.listdir(converted_dir):
        database_path = os.path.join(converted_dir, database_name)
        if not os.path.isdir(database_path):
            continue
        
        print(f"\nProcessing Database: {database_name}")
        final_database_dir = os.path.join(snowflake_ddls_dir, database_name)
        os.makedirs(final_database_dir, exist_ok=True)
        
        for schema_name in os.listdir(database_path):
            schema_path = os.path.join(database_path, schema_name)
            if not os.path.isdir(schema_path):
                continue
            
            print(f"  Processing Schema: {schema_name}")
            final_schema_dir = os.path.join(final_database_dir, schema_name)
            os.makedirs(final_schema_dir, exist_ok=True)
            
            for object_type in os.listdir(schema_path):
                object_type_path = os.path.join(schema_path, object_type)
                if not os.path.isdir(object_type_path):
                    continue
                
                print(f"    Processing {object_type} folder...")
                final_object_type_dir = os.path.join(final_schema_dir, object_type)
                os.makedirs(final_object_type_dir, exist_ok=True)
                
                sql_files = glob.glob(os.path.join(object_type_path, "**/*.sql"), recursive=True)
                sql_files.sort()
                
                for index, file in enumerate(sql_files, start=1):
                    base_name = os.path.basename(file)
                    prefix = get_schema_change_prefix(object_type, index)
                    renamed_file = f"{prefix}{base_name}"
                    dest_path = os.path.join(final_object_type_dir, renamed_file)
                    
                    print(f"      Copying {os.path.basename(file)} -> {renamed_file}")
                    shutil.copy(file, dest_path)
    
    print(f"✅ Completed copying converted Snowflake DDLs to {snowflake_ddls_dir}")

def git_commit_and_push():
    """ 
    The folders will then be pushed into the repo and a MR will be created 
    """

    print("\n--- Git Operations ---")
    os.chdir(repo_dir)
    subprocess.run(["git", "checkout", "dev"], check=True)
    subprocess.run(["git", "pull"], check=True)
    subprocess.run(["git", "add", "DDLs/"], check=True)
    status_result = subprocess.run(["git", "status", "--porcelain"], stdout=subprocess.PIPE, universal_newlines=True)
    if not status_result.stdout.strip():
        print("No changes to commit.")
        return
    subprocess.run(["git", "commit", "-m", "Add original Teradata DDLs and converted Snowflake DDLs with CREATE IF NOT EXISTS and schema change prefixes"], check=True)
    subprocess.run(["git", "push", "origin", "dev"], check=True)
    print("Creating Pull Request...")
    subprocess.run([
        "gh", "pr", "create",
        "--base", "main",
        "--head", "dev",
        "--title", "Teradata to Snowflake DDL Migration - Original and Converted Files",
        "--body", "Auto-generated migration output with the following structure:\n\n**Directory Structure:**\n- DDLs/Teradata_DDLs/: Original Teradata DDL files\n- DDLs/Snowflake_DDLs/: Converted Snowflake DDL files\n\n**Snowflake DDL Modifications:**\n- Changed CREATE OR REPLACE to CREATE ... IF NOT EXISTS for all objects\n- Ensures safe deployment without overwriting existing objects\n\n**Deployment Ordering (Snowflake files only):**\n- R__01__: Tables\n- R__02__: Views\n- R__03__: Procedures\n- R__04__: Functions\n\n**Scope:**\nProcessed multiple databases and schemas from Database_list.csv"
    ], check=True)
    print("Pull request created successfully")


def validate_directories():
    print("--- Validating prerequisites ---")
    if not os.path.exists(bteq_scripts_dir):
        raise RuntimeError(f"BTEQ scripts directory not found: {bteq_scripts_dir}")
    if not glob.glob(os.path.join(bteq_scripts_dir, "*.btq")):
        raise RuntimeError(f"No .btq files found in: {bteq_scripts_dir}")
    if not os.path.exists(database_list_csv):
        raise RuntimeError(f"Database list CSV not found: {database_list_csv}")
    if not os.path.exists(renaming_file):
        print(f"Warning: Renaming file not found: {renaming_file}")
    for tool in ['bteq', 'snowct', 'git', 'gh']:
        if not shutil.which(tool):
            raise RuntimeError(f"Required tool not found: {tool}. Please install it first.")
    print("All prerequisites validated successfully")

if __name__ == "__main__":
    try:
        validate_directories()
        create_required_directories()
        generate_object_json()
        run_all_bteq_scripts()
        copy_ddls_to_snowconvert_input()
        run_snowconvert()
        modify_all_ddl_files()
        copy_teradata_ddls_to_final()
        copy_and_rename_snowflake_outputs()
        # git_commit_and_push()
        print("\n✅ All steps completed successfully!")
        print(f"📁 Original Teradata DDLs: {teradata_ddls_dir}")
        print(f"📁 Converted Snowflake DDLs: {snowflake_ddls_dir}")
         # -------------- TPT Automation Starts -------------
        # run_tpt_exports()        # Only after previous stages succeed

        #print("\n✅ TPT export automation completed successfully!")
    except Exception as e:
        print(f"\n❌ Pipeline failed: {str(e)}")
        raise
