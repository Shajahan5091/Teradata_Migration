--
/* <sc-view> AdventureWorksDW.vw_FinancialRecords </sc-view> */
CREATE VIEW IF NOT EXISTS AdventureWorksDW.Snowconvert.vw_FinancialRecords
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 19,  "patch": "5.0" }, "attributes": {  "component": "teradata",  "convertedOn": "10/24/2025",  "domain": "no-domain-provided",  "migrationid": "2BSaAeKI/n289lxq+lu46Q==" }}'
AS
SELECT
	f.FinanceKey,
	f.DateKey,
	f.OrganizationKey,
	f.DepartmentGroupKey,
	f.ScenarioKey,
	d.DepartmentGroupName,
	s.ScenarioName
FROM
	AdventureWorksDW.Snowconvert.FactFinance f
LEFT JOIN
		AdventureWorksDW.Snowconvert.DimDepartmentGroup d ON f.DepartmentGroupKey = d.DepartmentGroupKey
LEFT JOIN
		AdventureWorksDW.Snowconvert.DimScenario s ON f.ScenarioKey = s.ScenarioKey;

--
		/* <sc-view> AdventureWorksDW.vw_ProductWithCategory </sc-view> */
		CREATE VIEW IF NOT EXISTS AdventureWorksDW.Snowconvert.vw_ProductWithCategory
		COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 19,  "patch": "5.0" }, "attributes": {  "component": "teradata",  "convertedOn": "10/24/2025",  "domain": "no-domain-provided",  "migrationid": "2BSaAeKI/n289lxq+lu46Q==" }}'
		AS
		SELECT
	p.ProductKey,
	p.EnglishProductName,
	p.StandardCost,
	p.ListPrice,
	sc.EnglishProductSubcategoryName,
	c.EnglishProductCategoryName
FROM
	AdventureWorksDW.Snowconvert.DimProduct p
LEFT JOIN
		AdventureWorksDW.Snowconvert.DimProductSubcategory sc
ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
LEFT JOIN
		AdventureWorksDW.Snowconvert.DimProductCategory c
ON sc.ProductCategoryKey = c.ProductCategoryKey;

--
		/* <sc-view> AdventureWorksDW.vw_EmployeeTerritory </sc-view> */
		CREATE VIEW IF NOT EXISTS AdventureWorksDW.Snowconvert.vw_EmployeeTerritory
		COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 19,  "patch": "5.0" }, "attributes": {  "component": "teradata",  "convertedOn": "10/24/2025",  "domain": "no-domain-provided",  "migrationid": "2BSaAeKI/n289lxq+lu46Q==" }}'
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
	AdventureWorksDW.Snowconvert.DimEmployee e
LEFT JOIN
		AdventureWorksDW.Snowconvert.DimSalesTerritory t
ON e.SalesTerritoryKey = t.SalesTerritoryKey;

--
		/* <sc-view> AdventureWorksDW.vw_ResellerWithGeography </sc-view> */
		CREATE VIEW IF NOT EXISTS AdventureWorksDW.Snowconvert.vw_ResellerWithGeography
		COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 19,  "patch": "5.0" }, "attributes": {  "component": "teradata",  "convertedOn": "10/24/2025",  "domain": "no-domain-provided",  "migrationid": "2BSaAeKI/n289lxq+lu46Q==" }}'
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
	AdventureWorksDW.Snowconvert.DimReseller r
LEFT JOIN
		AdventureWorksDW.Snowconvert.DimGeography g
ON r.GeographyKey = g.GeographyKey;