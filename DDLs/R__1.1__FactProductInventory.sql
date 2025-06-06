/* <sc-table> AdventureWorksDW.FactProductInventory </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactProductInventory
(
     ProductKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     MovementDate DATE NOT NULL,
     UnitCost NUMBER(18,4) NOT NULL,
     UnitsIn INTEGER NOT NULL,
     UnitsOut INTEGER NOT NULL,
     UnitsBalance INTEGER NOT NULL,
PRIMARY KEY ( ProductKey ,DateKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
;

--