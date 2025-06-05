/* <sc-table> AdventureWorksDW.DimProductCategory </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimProductCategory
(
     ProductCategoryKey INTEGER NOT NULL,
     ProductCategoryAlternateKey INTEGER,
     EnglishProductCategoryName VARCHAR(50) NOT NULL,
     SpanishProductCategoryName VARCHAR(50) NOT NULL,
     FrenchProductCategoryName VARCHAR(50) NOT NULL,
PRIMARY KEY ( ProductCategoryKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--