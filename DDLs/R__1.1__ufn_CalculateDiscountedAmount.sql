/* <sc-function> AdventureWorksDW.ufn_CalculateDiscountedAmount </sc-function> */
CREATE OR REPLACE FUNCTION AdventureWorksDW.ufn_CalculateDiscountedAmount (AMOUNT DECIMAL(18,2), DISCOUNT_PERCENT DECIMAL(5,2)
)
RETURNS DECIMAL(18,2)
LANGUAGE SQL
IMMUTABLE
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
AS
$$
amount * (1 - (discount_percent / 100))
$$;

--