--
/* <sc-view> AdventureWorksDW.vw_ProductInventoryMovement </sc-view> */
CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_ProductInventoryMovement
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/09/2025",  "domain": "no-domain-provided" }}'
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
/* <sc-view> AdventureWorksDW.vw_SalesQuotaByEmployee </sc-view> */
CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_SalesQuotaByEmployee
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/09/2025",  "domain": "no-domain-provided" }}'
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
		/* <sc-view> AdventureWorksDW.vw_FinancialSummaryByScenario </sc-view> */
		CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_FinancialSummaryByScenario
		COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/09/2025",  "domain": "no-domain-provided" }}'
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
		/* <sc-view> AdventureWorksDW.vw_ResellerSalesSummary </sc-view> */
		CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_ResellerSalesSummary
		COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/09/2025",  "domain": "no-domain-provided" }}'
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
		/* <sc-view> AdventureWorksDW.vw_SalesReasonBreakdown </sc-view> */
		CREATE OR REPLACE VIEW ADVENTUREWORKSDW.SNOWCONVERT.vw_SalesReasonBreakdown
		COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/09/2025",  "domain": "no-domain-provided" }}'
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