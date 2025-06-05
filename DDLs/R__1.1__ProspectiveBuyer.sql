/* <sc-table> AdventureWorksDW.ProspectiveBuyer </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.ProspectiveBuyer
(
     ProspectiveBuyerKey INTEGER NOT NULL,
     ProspectAlternateKey VARCHAR(15),
     FirstName VARCHAR(50),
     MiddleName VARCHAR(50),
     LastName VARCHAR(50),
     BirthDate DATE,
     MaritalStatus CHAR(1),
     Gender CHAR(1),
     EmailAddress VARCHAR(50),
     YearlyIncome NUMBER(18,4),
     TotalChildren BYTEINT,
     NumberChildrenAtHome BYTEINT,
     Education VARCHAR(40),
     Occupation VARCHAR(100),
     HouseOwnerFlag CHAR(1),
     NumberCarsOwned BYTEINT,
     AddressLine1 VARCHAR(120),
     AddressLine2 VARCHAR(120),
     City VARCHAR(30),
     StateProvinceCode VARCHAR(3),
     PostalCode VARCHAR(15),
     Phone VARCHAR(20),
     Salutation VARCHAR(8),
     Unknown INTEGER,
PRIMARY KEY ( ProspectiveBuyerKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--