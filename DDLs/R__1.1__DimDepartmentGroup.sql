/* <sc-table> AdventureWorksDW.DimDepartmentGroup </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimDepartmentGroup
(
     DepartmentGroupKey INTEGER NOT NULL,
     ParentDepartmentGroupKey INTEGER,
     DepartmentGroupName VARCHAR(50),
PRIMARY KEY ( DepartmentGroupKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--