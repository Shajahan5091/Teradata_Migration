/* <sc-function> AdventureWorksDW.ufn_QuarterName </sc-function> */
CREATE OR REPLACE FUNCTION AdventureWorksDW.ufn_QuarterName (QUARTER_NUM BYTEINT
)
RETURNS VARCHAR(10)
LANGUAGE SQL
IMMUTABLE
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
AS
$$
	CASE
		quarter_num
		WHEN 1
			THEN 'Q1'
		WHEN 2
			THEN 'Q2'
		WHEN 3
			THEN 'Q3'
		WHEN 4
			THEN 'Q4'
			ELSE 'Invalid'
	END
$$;