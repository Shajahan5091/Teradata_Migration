--
/* <sc-function> AdventureWorksDW.ufn_CalculateDiscountedAmount </sc-function> */
CREATE FUNCTION IF NOT EXISTS AdventureWorksDW.Snowconvert.ufn_CalculateDiscountedAmount (AMOUNT DECIMAL(18, 2), DISCOUNT_PERCENT DECIMAL(5, 2))
RETURNS DECIMAL(18, 2)
LANGUAGE SQL
IMMUTABLE
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 19,  "patch": "5.0" }, "attributes": {  "component": "teradata",  "convertedOn": "10/15/2025",  "domain": "no-domain-provided",  "migrationid": "suaZAUKCO3esn7EgFOdnyA==" }}'
AS
$$
	amount * (1 - (discount_percent / 100))
$$;

--
/* <sc-function> AdventureWorksDW.ufn_CQuarterName </sc-function> */
CREATE FUNCTION IF NOT EXISTS AdventureWorksDW.Snowconvert.ufn_CQuarterName (QUARTER_NUM BYTEINT)
RETURNS DECIMAL(18, 2)
LANGUAGE SQL
IMMUTABLE
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 19,  "patch": "5.0" }, "attributes": {  "component": "teradata",  "convertedOn": "10/15/2025",  "domain": "no-domain-provided",  "migrationid": "suaZAUKCO3esn7EgFOdnyA==" }}'
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