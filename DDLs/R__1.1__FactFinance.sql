/* <sc-table> AdventureWorksDW.FactFinance </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactFinance
(
     FinanceKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     OrganizationKey INTEGER NOT NULL,
     DepartmentGroupKey INTEGER NOT NULL,
     ScenarioKey INTEGER NOT NULL,
     AccountKey INTEGER NOT NULL,
     Amount NUMBER(38, 18) NOT NULL,
     "Date" DATE,
PRIMARY KEY ( FinanceKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--