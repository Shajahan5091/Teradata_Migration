/* <sc-procedure> AdventureWorksDW.sp_GetEmployeeQuotaSummary </sc-procedure> */
CREATE OR REPLACE PROCEDURE ADVENTUREWORKSDW.SNOWCONVERT.sp_GetEmployeeQuotaSummary ()
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
				e.EmployeeKey,
				e.FirstName || ' ' || e.LastName AS EmployeeName,
				q.CalendarYear,
				q.CalendarQuarter,
				q.SalesAmountQuota
			FROM
				ADVENTUREWORKSDW.SNOWCONVERT.FactSalesQuota q
			JOIN
					ADVENTUREWORKSDW.SNOWCONVERT.DimEmployee e ON q.EmployeeKey = e.EmployeeKey
			ORDER BY
				q.CalendarYear,
				q.CalendarQuarter,
				EmployeeName;
		OPEN result_cursor;
		RETURN TABLE(resultset_from_cursor(result_cursor));
	END;
$$;

--