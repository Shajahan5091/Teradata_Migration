/* <sc-table> AdventureWorksDW.DimSalesReason </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimSalesReason
(
     SalesReasonKey INTEGER NOT NULL,
     SalesReasonAlternateKey INTEGER NOT NULL,
     SalesReasonName VARCHAR(50) NOT NULL,
     SalesReasonReasonType VARCHAR(50) NOT NULL,
PRIMARY KEY ( SalesReasonKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--