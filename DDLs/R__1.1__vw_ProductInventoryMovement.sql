/* <sc-view> AdventureWorksDW.vw_ProductInventoryMovement </sc-view> */
CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_ProductInventoryMovement
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
AS
SELECT
	pi.ProductKey,
	p.EnglishProductName,
	SUM(pi.UnitsIn) AS TotalUnitsIn,
	SUM(pi.UnitsOut) AS TotalUnitsOut,
	SUM(pi.UnitsBalance) AS CurrentBalance
FROM
	ADVENTUREWORKSDW.SNOWCONVERT.FactProductInventory pi
LEFT JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimProduct p
	ON pi.ProductKey = p.ProductKey
!!!RESOLVE EWI!!! /*** SSC-EWI-TD0007 - GROUP BY IS NOT EQUIVALENT IN TERADATA MODE ***/!!!
GROUP BY
	pi.ProductKey,
	p.EnglishProductName;

--