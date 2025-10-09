--
/* <sc-procedure> AdventureWorksDW.sp_GetEmployeeQuotaSummary </sc-procedure> */
REPLACE PROCEDURE AdventureWorksDW.sp_GetEmployeeQuotaSummary()
DYNAMIC RESULT SETS 1
BEGIN
		DECLARE result_cursor CURSOR WITH RETURN ONLY FOR
			SELECT 
				e.EmployeeKey,
				e.FirstName || ' ' || e.LastName AS EmployeeName,
				q.CalendarYear,
				q.CalendarQuarter,
				q.SalesAmountQuota
			FROM AdventureWorksDW.FactSalesQuota q
			JOIN AdventureWorksDW.DimEmployee e ON q.EmployeeKey = e.EmployeeKey
			ORDER BY
				q.CalendarYear,
				q.CalendarQuarter,
				EmployeeName;
				
				OPEN result_cursor;
END;

--
/* <sc-procedure> AdventureWorksDW.sp_GetResellerSalesByRegion </sc-procedure> */
REPLACE PROCEDURE AdventureWorksDW.sp_GetResellerSalesByRegion()
DYNAMIC RESULT SETS 1
BEGIN
		DECLARE result_cursor CURSOR WITH RETURN ONLY FOR
			SELECT
				geo.EnglishCountryRegionName AS Country,
				geo.StateProvinceName,
				SUM(s.SalesAmount) AS TotalSales
			FROM AdventureWorksDW.FactResellerSales s
			JOIN AdventureWorksDW.DimReseller r ON s.ResellerKey = r.ResellerKey
			JOIN AdventureWorksDW.DimGeography geo ON r.GeographyKey = geo.GeographyKey
			GROUP BY
				geo.EnglishCountryRegionName,
				geo.StateProvinceName
			ORDER BY
				TotalSales DESC;
				
			OPEN result_cursor;
				
END;

