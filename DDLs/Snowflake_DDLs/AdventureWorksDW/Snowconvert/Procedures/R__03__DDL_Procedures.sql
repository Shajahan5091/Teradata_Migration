--
/* <sc-procedure> AdventureWorksDW.sp_GetEmployeeQuotaSummary </sc-procedure> */
CREATE PROCEDURE IF NOT EXISTS AdventureWorksDW.Snowconvert.sp_GetEmployeeQuotaSummary ()
RETURNS TABLE (
)
LANGUAGE SQL
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 19,  "patch": "5.0" }, "attributes": {  "component": "teradata",  "convertedOn": "10/23/2025",  "domain": "no-domain-provided",  "migrationid": "eBCaAXbd632fFQPnLZhKSQ==" }}'
EXECUTE AS CALLER
AS
$$
	BEGIN
		LET result_cursor CURSOR
		FOR
			SELECT
				e.EmployeeKey,
				e.FirstName || ' ' || e.LastName AS EmployeeName,
				q.CalendarYear,
				q.CalendarQuarter,
				q.SalesAmountQuota
			FROM
				AdventureWorksDW.Snowconvert.FactSalesQuota q
			JOIN
					AdventureWorksDW.Snowconvert.DimEmployee e ON q.EmployeeKey = e.EmployeeKey
			ORDER BY
				q.CalendarYear,
				q.CalendarQuarter,
				EmployeeName;
		OPEN result_cursor;
		RETURN TABLE(resultset_from_cursor(result_cursor));
	END;
$$;

--
/* <sc-procedure> AdventureWorksDW.sp_GetResellerSalesByRegion </sc-procedure> */
CREATE PROCEDURE IF NOT EXISTS AdventureWorksDW.Snowconvert.sp_GetResellerSalesByRegion ()
RETURNS TABLE (
)
LANGUAGE SQL
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 19,  "patch": "5.0" }, "attributes": {  "component": "teradata",  "convertedOn": "10/23/2025",  "domain": "no-domain-provided",  "migrationid": "eBCaAXbd632fFQPnLZhKSQ==" }}'
EXECUTE AS CALLER
AS
$$
	BEGIN
		LET result_cursor CURSOR
		FOR
			SELECT
				geo.EnglishCountryRegionName AS Country,
				geo.StateProvinceName,
				SUM(s.SalesAmount) AS TotalSales
			FROM
				AdventureWorksDW.Snowconvert.FactResellerSales s
			JOIN
					AdventureWorksDW.Snowconvert.DimReseller r ON s.ResellerKey = r.ResellerKey
			JOIN
					AdventureWorksDW.Snowconvert.DimGeography geo ON r.GeographyKey = geo.GeographyKey
			GROUP BY
				geo.EnglishCountryRegionName,
				geo.StateProvinceName
			ORDER BY
				TotalSales DESC NULLS LAST;
		OPEN result_cursor;
		RETURN TABLE(resultset_from_cursor(result_cursor));
	END;
$$;