/* <sc-view> AdventureWorksDW.vw_FinancialSummaryByScenario </sc-view> */
CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_FinancialSummaryByScenario
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
AS
SELECT
	s.ScenarioName,
	d.DepartmentGroupName,
	SUM(f.Amount) AS TotalAmount
FROM
	ADVENTUREWORKSDW.SNOWCONVERT.FactFinance f
JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimScenario s ON f.ScenarioKey = s.ScenarioKey
JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimDepartmentGroup d ON f.DepartmentGroupKey = d.DepartmentGroupKey
!!!RESOLVE EWI!!! /*** SSC-EWI-TD0007 - GROUP BY IS NOT EQUIVALENT IN TERADATA MODE ***/!!!
GROUP BY
	s.ScenarioName,
	d.DepartmentGroupName;

--