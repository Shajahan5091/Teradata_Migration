/* <sc-table> AdventureWorksDW.FactSurveyResponse </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactSurveyResponse
(
     SurveyResponseKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     CustomerKey INTEGER NOT NULL,
     ProductCategoryKey INTEGER NOT NULL,
     EnglishProductCategoryName VARCHAR(50) NOT NULL,
     ProductSubcategoryKey INTEGER NOT NULL,
     EnglishProductSubcategoryName VARCHAR(50) NOT NULL,
     "Date" DATE,
PRIMARY KEY ( SurveyResponseKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
;

--