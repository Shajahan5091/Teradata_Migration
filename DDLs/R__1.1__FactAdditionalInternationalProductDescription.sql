/* <sc-table> AdventureWorksDW.FactAdditionalInternationalProductDescription </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactAdditionalInternationalProductDescription
(
     ProductKey INTEGER NOT NULL,
     CultureName VARCHAR(50) NOT NULL,
     ProductDescription VARCHAR(32000) NOT NULL
)
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--