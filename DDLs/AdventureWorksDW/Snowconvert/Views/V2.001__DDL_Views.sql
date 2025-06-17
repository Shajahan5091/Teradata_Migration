--
/* <sc-view> AdventureWorksDW.vw_FinancialRecords </sc-view> */
CREATE OR REPLACE VIEW AdventureWorksDW.SNOWCONVERT.vw_FinancialRecords
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/17/2025",  "domain": "no-domain-provided" }}'
AS
SELECT
	f.FinanceKey,
	f.DateKey,
	f.OrganizationKey,
	f.DepartmentGroupKey,
	f.ScenarioKey,
	f.Amount,
	d.DepartmentGroupName,
	s.ScenarioName
FROM
	ADVENTUREWORKSDW.SNOWCONVERT.FactFinance f
LEFT JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimDepartmentGroup d ON f.DepartmentGroupKey = d.DepartmentGroupKey
LEFT JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimScenario s ON f.ScenarioKey = s.ScenarioKey;

--
		/* <sc-view> AdventureWorksDW.vw_ResellerWithGeography </sc-view> */
		CREATE OR REPLACE VIEW AdventureWorksDW.SNOWCONVERT.vw_ResellerWithGeography
		COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/17/2025",  "domain": "no-domain-provided" }}'
		AS
		SELECT
	r.ResellerKey,
	r.ResellerName,
	r.BusinessType,
	r.AnnualSales,
	r.NumberEmployees,
	g.City,
	g.StateProvinceName,
	g.EnglishCountryRegionName
FROM
	ADVENTUREWORKSDW.SNOWCONVERT.DimReseller r
LEFT JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimGeography g ON r.GeographyKey = g.GeographyKey;

--
		/* <sc-view> AdventureWorksDW.vw_EmployeeTerritory </sc-view> */
		CREATE OR REPLACE VIEW AdventureWorksDW.SNOWCONVERT.vw_EmployeeTerritory
		COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/17/2025",  "domain": "no-domain-provided" }}'
		AS
		SELECT
	e.EmployeeKey,
	e.FirstName || ' ' || e.LastName AS EmployeeName,
	e."Title",
	e.Gender,
	t.SalesTerritoryRegion,
	t.SalesTerritoryCountry,
	t.SalesTerritoryGroup
FROM
	ADVENTUREWORKSDW.SNOWCONVERT.DimEmployee e
LEFT JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimSalesTerritory t ON e.SalesTerritoryKey = t.SalesTerritoryKey;

--
		/* <sc-view> AdventureWorksDW.vw_ProductWithCategory </sc-view> */
		CREATE OR REPLACE VIEW AdventureWorksDW.SNOWCONVERT.vw_ProductWithCategory
		COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/17/2025",  "domain": "no-domain-provided" }}'
		AS
		SELECT
	p.ProductKey,
	p.EnglishProductName,
	p.StandardCost,
	p.ListPrice,
	sc.EnglishProductSubcategoryName,
	c.EnglishProductCategoryName
FROM
	ADVENTUREWORKSDW.SNOWCONVERT.DimProduct P
LEFT JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
LEFT JOIN
		ADVENTUREWORKSDW.SNOWCONVERT.DimProductCategory c ON sc.ProductCategoryKey = c.ProductCategoryKey;