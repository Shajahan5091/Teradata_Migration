/* <sc-table> AdventureWorksDW.DimProductSubcategory </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE AdventureWorksDW.DimProductSubcategory
(
     ProductSubcategoryKey INTEGER NOT NULL,
     ProductSubcategoryAlternateKey INTEGER,
     EnglishProductSubcategoryName VARCHAR(50) NOT NULL,
     SpanishProductSubcategoryName VARCHAR(50) NOT NULL,
     FrenchProductSubcategoryName VARCHAR(50) NOT NULL,
     ProductCategoryKey INTEGER,
PRIMARY KEY ( ProductSubcategoryKey ),
CONSTRAINT FK_DimProductSubcategory_DimProductCategory FOREIGN KEY ( ProductCategoryKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimProductCategory ( ProductCategoryKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--