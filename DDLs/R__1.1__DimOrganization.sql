/* <sc-table> AdventureWorksDW.DimOrganization </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimOrganization
(
     OrganizationKey INTEGER NOT NULL,
     ParentOrganizationKey INTEGER,
     PercentageOfOwnership VARCHAR(16),
     OrganizationName VARCHAR(50),
     CurrencyKey INTEGER,
PRIMARY KEY ( OrganizationKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
;

--