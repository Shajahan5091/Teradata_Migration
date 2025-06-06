/* <sc-view> AdventureWorksDW.vw_SalesQuotaByEmployee </sc-view> */
CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_SalesQuotaByEmployee
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
AS
SELECT
	e.EmployeeKey,
	e.FirstName || ' ' || e.LastName AS EmployeeName,
	fq.CalendarYear,
	fq.CalendarQuarter,
	fq.SalesAmountQuota
FROM
	ADVENTUREWORKSDW.SNOWCONVERT.FactSalesQuota fq
JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimEmployee e ON fq.EmployeeKey = e.EmployeeKey;

		--