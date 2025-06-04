/* <sc-table> AdventureWorksDW.FactInternetSalesReason </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactInternetSalesReason
(
     SalesOrderNumber VARCHAR(20) NOT NULL,
     SalesOrderLineNumber SMALLINT NOT NULL,
     SalesReasonKey INTEGER NOT NULL,
CONSTRAINT FK_FactInternetSalesReason_FactInternetSales FOREIGN KEY ( SalesOrderNumber ,
SalesOrderLineNumber ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.FactInternetSales ( SalesOrderNumber ,
SalesOrderLineNumber ),
CONSTRAINT FK_FactInternetSalesReason_DimSalesReason FOREIGN KEY ( SalesReasonKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimSalesReason ( SalesReasonKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--