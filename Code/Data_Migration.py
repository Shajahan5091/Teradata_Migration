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

database_list_csv = "/root/Downloads/Database_list.csv"

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
    
def run_tpt_exports():
    import subprocess
    import teradatasql

    print("\n--- Starting TPT export automation ---")

    # Your function to get databases (adjust as needed)
    database_schema_list = read_database_schema_list()

    TERADATA_HOST = '127.0.0.1'
    TERADATA_USER = 'dbc'
    TERADATA_PASSWORD = 'dbc'

    GCS_ACCESS_ID = 'teradatamigration@teradatamigration-468015.iam.gserviceaccount.com'
    GCS_ACCESS_KEY = '-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDHFlXFXBaTeght\n8dKEsVZjlgixigqCT4SAPNLs10xGDKsFcrJArnLCCmQgcQVdKpzp2wzyVYRv1eCm\nI3GkhMxRZcTwbpuVMQ+vOTV4Z7KYhTF0hz6KkE5NE/GlnesLKZeHKUyootr53ybA\naT3WgrqFcnblCEbtm93yVrDwIdVHWVAJ/SD4omd01W9kQ7PiAZUjVr5QXSwmx6kh\njCcSx/E647XGH0CLm7Y9WQczsvLW4JM/Wrb2bpdToy2bFh7/oEuu1Hqeq515roh9\n5Z+/DDHNqYKKNCh/AG2NZnRbZOkJqCocbCC5NBN7Fa1GILk2OXQtj/1r0zEL5c8k\n1lzbTpjjAgMBAAECggEAOCFydk4D6XmfFcx348SSDErZUaEPXHUp8PP1LiR3k0pw\nD32qhzUIEvBWEZV8AywICKEjcdGtoNBm4cCdglqUtqBgWb99qx8lgmw5SKTIBFuN\nOYMGHZAZG38zgtPW2JNV7xw0Sll8LrX9WYNylV/PUd+XaPSf9s8a0QAjK9kGJnKn\nGanjkKWaeIIKPuWSVPylHwMrOyrWWtnhLo3+egDuhWV+UyDXhS00cXCmx3pFkbed\nU8HnP+p98KzAm0E96LU4fm7t55ESLaF4nRqoubKosEV3BylT9aL2IkN44iPLQMlS\nakVC3fIv3t31FVXXGUN7kKz03JdnEt6uizKOZo8uKQKBgQDnGmFUjyW3M7MLsN9l\npRrOI/krkTqrKcdfj/ekKBjxlggB/Icf3Ma27Gx6koFwdMb2sQpwGXNekQYoFWsM\nqNbZ7OxoIRrAQKZGyXLxb3QPbCJQSuM9PW6DtoHW/tedy9NiHsPvMgup5P5rTeIq\n+nenrQj8MbV3+STKYHsHB8RA2QKBgQDciPywJeNAzIFjNbRh7nhsWd4ERGxAhthY\nBuYw915rXdbAy5uYoTBfz9+LLhhJRHSUsC9ivALA9NdDRbsgf8uDSdYAQ8OzVlb7\nh6NcmRL/zrxN2Bf+zHUXiTcafRSNQgyEDZgpZHN8ksn0xjWO0iC0sMo02VLW615V\nN0ewHaCSGwKBgQCcRX5jS5jZVSBRW3z0oryJgFHRYBcn/sxOlm+ClYqocidgEH7e\n0M+eiiigicj1XkHcNsM0IkGdRLvBBxqoKNN/8XG6yAfq0MyfOUF8eT0l4J0jZkBa\n/NtqPVN3KkRq85Uw2FTtvg2dCLfxn2y8WznmLF/TCVoIknSKVMtcaagPoQKBgGvB\na2ZOPOnugtIM7aRkNucKShbfr90fhhoM1PDcDYB8i3AMjGxZZh+KnHmO/kLedfAo\n3h5qKxZJC91M9w/8IV5291+NvNOlvj6Mmd+m08e2JgALND5FfHkRjKEeuKoEucTU\nN6MR9/PIbXFyX7z3Iw/mygZkobttqdwNdLOy5kA9AoGAc3h6hfvf8Odq7hmIVlf4\n+S3nWkL6LnDLZiI7wmoG57LcHMU5+01DiPO25+/stEB8FBA3YjPYG03THnI+X3xP\n4Mm+L0bDApzm8hcuM/NyzeS3pMQTVKm2B9PPkFbDu5AdRQDg/MyWzDTpNibWMGIN\njo0w3xS+6ftbwaGJvXJ3Eow=\n-----END PRIVATE KEY-----\n'
    GCS_ACCESS_KEY = GCS_ACCESS_KEY.replace('\n','\\n')
    GCS_BUCKET = 'teradata_to_snowflake'

    def get_tables(con, database):
        cursor = con.cursor()
        cursor.execute("""
            SELECT TableName FROM DBC.TablesV WHERE DatabaseName = ? AND TableKind = 'T';
        """, (database,))
        return [row[0] for row in cursor.fetchall()]

    def get_columns(con, database, table):
        cursor = con.cursor()
        cursor.execute("""
            SELECT ColumnName, ColumnType, ColumnLength, DecimalTotalDigits, DecimalFractionalDigits FROM DBC.ColumnsV WHERE DatabaseName = ? AND TableName = ? ORDER BY ColumnId;
        """, (database, table))
        return cursor.fetchall()

    def map_teradata_to_tpt_type(col_type, col_length, decimal_total_digits, decimal_fractional_digits):
        # Remove extra spaces from the col_type
        col_type = col_type.strip()
        if (decimal_total_digits == -128 and decimal_fractional_digits == -128):
            type_map = {
                'I': 'INTEGER', 'I1': 'BYTEINT', 'I2': 'SMALLINT', 'I8': 'INTEGER', 'N': 'NUMBER',
                'CF': f'VARCHAR({col_length})', 'CV': f'VARCHAR({col_length})',
                'DA': 'ANSIDATE', 'TS': 'TIMESTAMP'
            }
        else:
            type_map = {
                'I': 'INTEGER', 'I1': 'BYTEINT', 'I2': 'SMALLINT', 'I8': 'INTEGER', 'N': f'NUMBER({decimal_total_digits},{decimal_fractional_digits})',
                'CF': f'CHAR({col_length})', 'CV': f'VARCHAR({col_length})',
                'DA': 'ANSIDATE', 'TS': 'TIMESTAMP'
            }
        return type_map.get(col_type, f'VARCHAR({max(col_length,100)})')
    
    # def map_teradata_to_tpt_type(col_type, col_length, col_format=None):
    #     # Mapping: for dynamic width types, use lambda functions
    #     type_map = {
    #         'I': lambda l, f: 'INTEGER',
    #         'I1': lambda l, f: 'INTEGER',
    #         'I2': lambda l, f: 'INTEGER',
    #         'I8': lambda l, f: 'INTEGER',
    #         'CF': lambda l, f: f'VARCHAR({l})',
    #         'CV': lambda l, f: f'VARCHAR({l})',
    #         'DA': lambda l, f: 'DATE',
    #         'TS': lambda l, f: 'TIMESTAMP'
    #     }
    #     mapping = type_map.get(col_type)
    #     if mapping:
    #         return mapping(col_length, col_format)

    def generate_schema_block(columns):
        lines = []
        print("columns:",columns)
        for col_name, col_type, col_length, decimal_total_digits, decimal_fractional_digits in columns:
            tpt_type = map_teradata_to_tpt_type(col_type, col_length, decimal_total_digits, decimal_fractional_digits)
            print("tpt_type:", tpt_type)
            lines.append(f"    {col_name} {tpt_type},")
        if lines:
            lines[-1] = lines[-1].rstrip(',')
        print("lines:",lines)
        return "DEFINE SCHEMA Employee_Schema\n(\n" + "\n".join(lines) + "\n);"

    def generate_tpt_script(database, table, schema_block):
        bucket_prefix = f'{database.lower()}/'
        object_name = f'{table.lower()}.csv'
        tpt_job = f"""\
DEFINE JOB EXPORT_{table.upper()}
DESCRIPTION 'Export data from Teradata table {database}.{table}'
(
    DEFINE OPERATOR Consumer_Opp
    DESCRIPTION 'Consumer Operator'
    TYPE DATACONNECTOR CONSUMER
    SCHEMA *
    ATTRIBUTES
    (
      VARCHAR Format = 'DELIMITED',
      VARCHAR OpenMode = 'Write',
      AccessModuleName = 'libgcsaxsmod.so',
      AccessModuleInitStr = 'AccessID={GCS_ACCESS_ID} AccessKey="{GCS_ACCESS_KEY}" Bucket={GCS_BUCKET} Prefix="{bucket_prefix}" Object={object_name}'
    );
    
    {schema_block}

    DEFINE OPERATOR Producer_Export
    TYPE EXPORT
    SCHEMA Employee_Schema
    ATTRIBUTES
    (
       VARCHAR UserName='{TERADATA_USER}',
       VARCHAR UserPAssword='{TERADATA_PASSWORD}',
       VARCHAR SelectStmt = 'SELECT * FROM {database}.{table};',
       VARCHAR Tdpid='{TERADATA_HOST}',
       INTEGER MaxSessions=6,
       INTEGER minsessions=2,
       VARCHAR DateForm='ANSIDATE'
    );
    
    APPLY 
    TO OPERATOR( Consumer_Opp )
    SELECT * FROM OPERATOR( Producer_Export ); 
);
"""
        return tpt_job

    def write_tpt_script_file(database, table, tpt_script):
        filename = f'export_{database.lower()}_{table.lower()}.tpt'
        with open(filename, 'w') as f:
            f.write(tpt_script)
        return filename

    def run_tpt_script(script_file):
        print(f"Running TPT script: {script_file}")
        result = subprocess.run(['tbuild', '-f', script_file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if result.returncode != 0:
            print(f"Error running TPT script {script_file}:\n{result.stderr}")
            return False
        print(f"TPT script {script_file} ran successfully.")
        return True

    with teradatasql.connect(host=TERADATA_HOST, user=TERADATA_USER, password=TERADATA_PASSWORD) as td_con:
        for db_info in database_schema_list:
            database = db_info['database']
            database = database.lower()
            schema = db_info['schema']
            schema = schema.lower()
            print(f"Processing database: {database}")
            try:
                # tables = get_tables(con, database)
                tables = ['dimcurrency','dimdate','dimdepartmentgroup','dimemployee','dimgeography','dimorganization','dimproductcategory',
                        'dimproductsubcategory','dimpromotion','dimsalesreason','dimscenario','factadditionalinternationalproductdescription',
                        'factinternetsales','factinternetsalesreason','factproductinventory','factresellersales','newfactcurrencyrate','sample_table']
            except Exception as e:
                print(f"Error fetching tables for database {database}: {e}")
                continue
            for table in tables:
                print(f" Exporting table: {table}")
                try:
                    columns = get_columns(td_con, database, table)
                    if not columns:
                        print(f"No columns found for {database}.{table}, skipping")
                        continue
                except Exception as e:
                    print(f"Error fetching columns for table {table} in {database}: {e}")
                    continue
                schema_block = generate_schema_block(columns)
                tpt_script = generate_tpt_script(database, table, schema_block)
                script_file = write_tpt_script_file(database, table, tpt_script)
                success = run_tpt_script(script_file)
                if not success:
                    print(f"Failed to export {database}.{table}")
                else:
                    print(f"Successfully exported {database}.{table} to GCS.")

            load_tables_to_snowflake(tables, database, schema)
            create_audit_table()

def load_tables_to_snowflake(tables, database, schema):
    """
    Loads CSV files from a Snowflake external stage into corresponding tables.
    Args:
        conn: Active Snowflake connection object
        stage_name (str): External stage name (e.g., @my_stage)
        tables_to_load (list): List of table names to load (must match file names)
    """
    #snowflake credentials
    conn = snowflake.connector.connect(
        user='SVA_ELAIT',
        password='Abcd@123456789',
        account='A9752755683171-ELAIT_PARTNER',
        warehouse='COMPUTE_WH',
        database={database},
        schema={schema},
        role='SYSADMIN'
    )
    
    # External stage name (already created in Snowflake)
    stage_name = "teradata_stage"

    try:
        cursor = conn.cursor()
 
        for table in tables:
            file_name = f"{table}.csv"
            use_database_query = f"""
            USE DATABASE {database};
            """
            use_schema_query = f"""
            USE SCHEMA {schema};
            """
            copy_sql = f"""
            COPY INTO {table}
            FROM @{stage_name}/{database}/{file_name}
            FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 0 FIELD_DELIMITER = '|')
            ON_ERROR = 'CONTINUE';
            """
            print(f"\nRunning COPY INTO for table: {table}")
            try:
                cursor.execute(use_database_query)
                cursor.execute(use_schema_query)
                cursor.execute(copy_sql)
                print(f"✅ Loaded: {table} from {file_name}")
            except Exception as e:
                print(f"❌ Failed for {table}: {e}")
 
    except Exception as e:
        print(f"Execution failed: {e}")
    finally:
        try:
            cursor.close()
        except:
            pass
            
            
def create_audit_table():
	
	#Tables list
	tables = ['dimcurrency','dimdate','dimdepartmentgroup','dimemployee','dimgeography','dimorganization','dimproductcategory',
			'dimproductsubcategory','dimpromotion','dimsalesreason','dimscenario','factadditionalinternationalproductdescription',
			'factinternetsales','factinternetsalesreason','factproductinventory','factresellersales','newfactcurrencyrate','sample_table']

	# Teradata Credentials
	TERADATA_HOST = '127.0.0.1'
	TERADATA_USER = 'dbc'
	TERADATA_PASSWORD = 'dbc'

	# teradata connection profile
	teradata_connection = teradatasql.connect(
		host = TERADATA_HOST,
		user = TERADATA_USER,
		password = TERADATA_PASSWORD
	)
 
	teradata_cursor = teradata_connection.cursor()

	snowflake_connection = snowflake.connector.connect(
		user = 'SVA_ELAIT',
		password = 'Abcd@123456789',
		account = 'A9752755683171-ELAIT_PARTNER',
		warehouse = 'COMPUTE_WH',
		database = 'Adventureworksdw',
		schema = 'snowconvert',
		role = 'SYSADMIN'
	)

	snowflake_cursor = snowflake_connection.cursor()
	
	create_audit = f""" CREATE OR REPLACE TABLE ADVENTUREWORKSDW.PUBLIC.AUDIT_LOG(
		ID NUMBER(38,0),
		DATABASE_NAME VARCHAR,
		SCHEMA_NAME VARCHAR,
		TABLE_NAME VARCHAR,
		TD_ROW_COUNT NUMBER(38,0),
		SF_ROW_COUNT NUMBER(38,0)
		)"""
		
	snowflake_cursor.execute(create_audit)

	i = 1
	
	for table in tables:
		
		teradata_query = f"""SELECT COUNT(*) FROM AdventureWorksDW.{table}"""
		snowflake_query = f"""SELECT COUNT(*) FROM ADVENTUREWORKSDW.SNOWCONVERT.{table}"""
		
		sf_result = snowflake_cursor.execute(snowflake_query)
		for sf_row in sf_result:
			snowflake_count = sf_row[0]
			
		td_result = teradata_cursor.execute(teradata_query)
		for td_row in td_result:
			teradata_count = td_row[0]
		
		print("Snowflake_count: ", snowflake_count)
		print("Teradata_count: ", teradata_count)
		
		insert_query = f""" INSERT INTO ADVENTUREWORKSDW.PUBLIC.AUDIT_LOG(ID,DATABASE_NAME,SCHEMA_NAME,TABLE_NAME,TD_ROW_COUNT,SF_ROW_COUNT) 
		VALUES({i},'ADVENTUREWORKSDW','SNOWCONVERT','{table}',{teradata_count},{snowflake_count}) """
		
		snowflake_cursor.execute(insert_query)
		
		i += 1
		
	print("The audit table is created successfully")
	return True



if __name__ == "__main__":
    try:
        run_tpt_exports()
        print("\n✅ TPT export automation completed successfully!")
    except Exception as e:
        print(f"\n❌ Pipeline failed: {str(e)}")
        raise
