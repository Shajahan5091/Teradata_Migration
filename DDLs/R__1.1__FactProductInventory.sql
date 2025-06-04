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
PRIMARY KEY ( ProductKey ,DateKey ),
CONSTRAINT FK_FactProductInventory_DimDate FOREIGN KEY ( DateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ),
CONSTRAINT FK_FactProductInventory_DimProduct FOREIGN KEY ( ProductKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimProduct ( ProductKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--