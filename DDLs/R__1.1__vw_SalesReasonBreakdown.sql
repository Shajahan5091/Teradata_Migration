/* <sc-view> AdventureWorksDW.vw_SalesReasonBreakdown </sc-view> */
CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_SalesReasonBreakdown
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
AS
SELECT
	sr.SalesReasonKey,
	sr.SalesReasonName,
	sr.SalesReasonReasonType,
	COUNT(fisr.SalesOrderNumber) AS UsageCount
FROM
	ADVENTUREWORKSDW.SNOWCONVERT.DimSalesReason sr
LEFT JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.FactInternetSalesReason fisr
	ON sr.SalesReasonKey = fisr.SalesReasonKey
!!!RESOLVE EWI!!! /*** SSC-EWI-TD0007 - GROUP BY IS NOT EQUIVALENT IN TERADATA MODE ***/!!!
GROUP BY
	sr.SalesReasonKey,
	sr.SalesReasonName,
	sr.SalesReasonReasonType;