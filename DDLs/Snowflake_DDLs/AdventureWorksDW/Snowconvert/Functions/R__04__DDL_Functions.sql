--
/* <sc-function> AdventureWorksDW.ufn_CalculateDiscountedAmount </sc-function> */
CREATE FUNCTION IF NOT EXISTS AdventureWorksDW.Snowconvert.ufn_CalculateDiscountedAmount (AMOUNT DECIMAL(18, 2), DISCOUNT_PERCENT DECIMAL(5, 2))
RETURNS DECIMAL(18, 2)
LANGUAGE SQL
IMMUTABLE
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 19,  "patch": "5.0" }, "attributes": {  "component": "teradata",  "convertedOn": "10/24/2025",  "domain": "no-domain-provided",  "migrationid": "2BSaAeKI/n289lxq+lu46Q==" }}'
AS
$$
amount * (1 - (discount_percent / 100))
$$;