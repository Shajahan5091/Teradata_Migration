--
/* <sc-function> AdventureWorksDW.ufn_CalculateDiscountedAmount </sc-function> */
CREATE FUNCTION IF NOT EXISTS AdventureWorksDW.Snowconvert.ufn_CalculateDiscountedAmount (AMOUNT DECIMAL(18,2), DISCOUNT_PERCENT DECIMAL(5,2)
)
RETURNS DECIMAL(18,2)
LANGUAGE SQL
IMMUTABLE
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/08/2025",  "domain": "no-domain-provided" }}'
AS
$$
	amount * (1 - (discount_percent / 100))
$$;

--
/* <sc-function> AdventureWorksDW.ufn_QuarterName </sc-function> */
CREATE FUNCTION IF NOT EXISTS AdventureWorksDW.Snowconvert.ufn_QuarterName (QUARTER_NUM BYTEINT
)
RETURNS VARCHAR(10)
LANGUAGE SQL
IMMUTABLE
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/08/2025",  "domain": "no-domain-provided" }}'
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