--
/* <sc-view> AdventureWorksDW.vw_FinancialRecords </sc-view> */
REPLACE VIEW AdventureWorksDW.vw_FinancialRecords AS
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
	AdventureWorksDW.FactFinance f
LEFT JOIN
	AdventureWorksDW.DimDepartmentGroup d ON f.DepartmentGroupKey = d.DepartmentGroupKey
LEFT JOIN 
	AdventureWorksDW.DimScenario s ON f.ScenarioKey = s.ScenarioKey;

--
/* <sc-view> AdventureWorksDW.vw_sample </sc-view> */
REPLACE VIEW AdventureWorksDW.vw_sample AS 
 SELECT 
 	EmployeeKey,
 	FirstName || ' ' || LastName as EmployeeName
 FROM AdventureWorksDW.DimEmployee
 UNION ALL
 SELECT
 	EmployeeKey,
 	EmployeeName
 FROM AdventureWorksDW.vw_EmployeeTerritory;

--
/* <sc-view> AdventureWorksDW.vw_EmployeeTerritory </sc-view> */
REPLACE VIEW AdventureWorksDW.vw_EmployeeTerritory AS
SELECT
	e.EmployeeKey,
	e.FirstName || ' ' || e.LastName AS EmployeeName,
	e."Title",
	e.Gender,
	t.SalesTerritoryRegion,
	t.SalesTerritoryCountry,
	t.SalesTerritoryGroup
FROM
	AdventureWorksDW.DimEmployee e
LEFT JOIN
	AdventureWorksDW.DimSalesTerritory t ON e.SalesTerritoryKey = t.SalesTerritoryKey;

--
/* <sc-view> AdventureWorksDW.vw_ResellerWithGeography </sc-view> */
REPLACE VIEW AdventureWorksDW.vw_ResellerWithGeography AS
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
	AdventureWorksDW.DimReseller r
LEFT JOIN
	AdventureWorksDW.DimGeography g ON r.GeographyKey = g.GeographyKey;

--
/* <sc-view> AdventureWorksDW.vw_ProductWithCategory </sc-view> */
REPLACE VIEW AdventureWorksDW.vw_ProductWithCategory AS
SELECT
	p.ProductKey,
	p.EnglishProductName,
	p.StandardCost,
	p.ListPrice,
	sc.EnglishProductSubcategoryName,
	c.EnglishProductCategoryName
FROM
	AdventureWorksDW.DimProduct P
LEFT JOIN
	AdventureWorksDW.DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
LEFT JOIN 
	AdventureWorksDW.DimProductCategory c ON sc.ProductCategoryKey = c.ProductCategoryKey;

