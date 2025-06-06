/* <sc-table> AdventureWorksDW.DimReseller </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimReseller
(
     ResellerKey INTEGER NOT NULL,
     GeographyKey INTEGER,
     ResellerAlternateKey VARCHAR(15),
     Phone VARCHAR(25),
     BusinessType VARCHAR(20) NOT NULL,
     ResellerName VARCHAR(50) NOT NULL,
     NumberEmployees INTEGER,
     OrderFrequency CHAR(1),
     OrderMonth BYTEINT,
     FirstOrderYear INTEGER,
     LastOrderYear INTEGER,
     ProductLine VARCHAR(50),
     AddressLine1 VARCHAR(60),
     AddressLine2 VARCHAR(60),
     AnnualSales NUMBER(18,4),
     BankName VARCHAR(50),
     MinPaymentType BYTEINT,
     MinPaymentAmount NUMBER(18,4),
     AnnualRevenue NUMBER(18,4),
     YearOpened INTEGER,
PRIMARY KEY ( ResellerKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
;

--