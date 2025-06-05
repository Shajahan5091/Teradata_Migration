/* <sc-table> AdventureWorksDW.DimEmployee </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimEmployee
(
     EmployeeKey INTEGER NOT NULL,
     ParentEmployeeKey INTEGER,
     EmployeeNationalIDAlternateKey VARCHAR(15),
     ParentEmployeeNationalIDAltKey VARCHAR(15),
     SalesTerritoryKey INTEGER,
     FirstName VARCHAR(50) NOT NULL,
     LastName VARCHAR(50) NOT NULL,
     MiddleName VARCHAR(50),
     "Title" VARCHAR(50),
     HireDate DATE,
     BirthDate DATE,
     LoginID VARCHAR(256),
     EmailAddress VARCHAR(50),
     Phone VARCHAR(25),
     MaritalStatus CHAR(1),
     EmergencyContactName VARCHAR(50),
     EmergencyContactPhone VARCHAR(25),
     Gender CHAR(1),
     PayFrequency BYTEINT,
     BaseRate NUMBER(18,4),
     VacationHours SMALLINT,
     SickLeaveHours SMALLINT,
     DepartmentName VARCHAR(50),
     StartDate DATE,
     EndDate DATE,
     Status VARCHAR(50),
     EmployeePhoto BINARY /*** SSC-FDM-TD0001 - COLUMN CONVERTED FROM BLOB DATA TYPE ***/,
PRIMARY KEY ( EmployeeKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--