/* <sc-table> AdventureWorksDW.DimSalesTerritory </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimSalesTerritory
(
     SalesTerritoryKey INTEGER NOT NULL,
     SalesTerritoryAlternateKey INTEGER,
     SalesTerritoryRegion VARCHAR(50) NOT NULL,
     SalesTerritoryCountry VARCHAR(50) NOT NULL,
     SalesTerritoryGroup VARCHAR(50),
     SalesTerritoryImage BINARY /*** SSC-FDM-TD0001 - COLUMN CONVERTED FROM BLOB DATA TYPE ***/,
PRIMARY KEY ( SalesTerritoryKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
;

--