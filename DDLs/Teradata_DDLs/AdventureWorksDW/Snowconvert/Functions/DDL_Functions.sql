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

