/* <sc-table> AdventureWorksDW.DimAccount </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimAccount
(
     AccountKey INTEGER NOT NULL,
     ParentAccountKey INTEGER,
     AccountCodeAlternateKey INTEGER,
     ParentAccountCodeAlternateKey INTEGER,
     AccountDescription VARCHAR(50) NOT NULL,
     AccountType VARCHAR(50),
     Operator VARCHAR(50),
     CustomMembers VARCHAR(300),
     ValueType VARCHAR(50),
     CustomMemberOptions VARCHAR(200),
PRIMARY KEY ( AccountKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--