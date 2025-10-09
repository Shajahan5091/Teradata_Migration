--
/* <sc-function> AdventureWorksDW.ufn_CalculateDiscountedAmount </sc-function> */
CREATE FUNCTION AdventureWorksDW.ufn_CalculateDiscountedAmount(amount DECIMAL(18,2), discount_percent DECIMAL(5,2))
RETURNS DECIMAL(18,2)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER 
COLLATION INVOKER
INLINE TYPE 1
RETURN amount * (1 - (discount_percent / 100));

--
/* <sc-function> AdventureWorksDW.ufn_CQuarterName </sc-function> */
CREATE FUNCTION AdventureWorksDW.ufn_CQuarterName(quarter_num BYTEINT)
RETURNS DECIMAL(18,2)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER 
COLLATION INVOKER
INLINE TYPE 1
RETURN 
	CASE quarter_num
		WHEN 1 THEN 'Q1'
		WHEN 2 THEN 'Q2'
		WHEN 3 THEN 'Q3'
		WHEN 4 THEN 'Q4'
		ELSE 'Invalid'
	END;

