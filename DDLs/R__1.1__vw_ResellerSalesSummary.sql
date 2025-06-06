/* <sc-view> AdventureWorksDW.vw_ResellerSalesSummary </sc-view> */
CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_ResellerSalesSummary
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
AS
SELECT
	r.ResellerKey,
	r.ResellerName,
	SUM(frs.SalesAmount) AS TotalSales
FROM
	ADVENTUREWORKSDW.SNOWCONVERT.FactResellerSales frs
JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimReseller r ON frs.ResellerKey = r.ResellerKey
!!!RESOLVE EWI!!! /*** SSC-EWI-TD0007 - GROUP BY IS NOT EQUIVALENT IN TERADATA MODE ***/!!!
GROUP BY
	r.ResellerKey,
	r.ResellerName;

--