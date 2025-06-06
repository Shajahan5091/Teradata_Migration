/* <sc-table> AdventureWorksDW.DimGeography </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimGeography
(
     GeographyKey INTEGER NOT NULL,
     City VARCHAR(30),
     StateProvinceCode VARCHAR(3),
     StateProvinceName VARCHAR(50),
     CountryRegionCode VARCHAR(3),
     EnglishCountryRegionName VARCHAR(50),
     SpanishCountryRegionName VARCHAR(50),
     FrenchCountryRegionName VARCHAR(50),
     PostalCode VARCHAR(15),
     SalesTerritoryKey INTEGER,
     IpAddressLocator VARCHAR(15),
PRIMARY KEY ( GeographyKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
;

--