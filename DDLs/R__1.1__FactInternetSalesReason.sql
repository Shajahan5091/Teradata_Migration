/* <sc-table> AdventureWorksDW.FactInternetSalesReason </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactInternetSalesReason
(
     SalesOrderNumber VARCHAR(20) NOT NULL,
     SalesOrderLineNumber SMALLINT NOT NULL,
     SalesReasonKey INTEGER NOT NULL
)
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
;

--