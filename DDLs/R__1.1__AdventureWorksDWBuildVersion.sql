/* <sc-table> AdventureWorksDW.AdventureWorksDWBuildVersion </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE AdventureWorksDW.AdventureWorksDWBuildVersion
(
     DBVersion VARCHAR(50),
     VersionDate TIMESTAMP(0))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--