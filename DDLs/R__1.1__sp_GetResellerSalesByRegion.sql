/* <sc-procedure> AdventureWorksDW.sp_GetResellerSalesByRegion </sc-procedure> */
CREATE OR REPLACE PROCEDURE ADVENTUREWORKSDW.SNOWCONVERT.sp_GetResellerSalesByRegion ()
RETURNS TABLE (
)
LANGUAGE SQL
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
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
				ADVENTUREWORKSDW.SNOWCONVERT.FactResellerSales s
			JOIN
					ADVENTUREWORKSDW.SNOWCONVERT.DimReseller r
				ON s.ResellerKey = r.ResellerKey
			JOIN
					ADVENTUREWORKSDW.SNOWCONVERT.DimGeography geo ON r.GeographyKey = geo.GeographyKey
			GROUP BY
				geo.EnglishCountryRegionName,
				geo.StateProvinceName
			ORDER BY
				TotalSales DESC NULLS LAST;
		OPEN result_cursor;
		RETURN TABLE(resultset_from_cursor(result_cursor));
	END;
$$;