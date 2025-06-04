/* <sc-table> AdventureWorksDW.FactSalesQuota </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactSalesQuota
(
     SalesQuotaKey INTEGER NOT NULL,
     EmployeeKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     CalendarYear SMALLINT NOT NULL,
     CalendarQuarter BYTEINT NOT NULL,
     SalesAmountQuota NUMBER(18,4) NOT NULL,
     "Date" DATE,
PRIMARY KEY ( SalesQuotaKey ),
CONSTRAINT FK_FactSalesQuota_DimEmployee FOREIGN KEY ( EmployeeKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimEmployee ( EmployeeKey ),
CONSTRAINT FK_FactSalesQuota_DimDate FOREIGN KEY ( DateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--