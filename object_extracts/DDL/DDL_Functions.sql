--

/* <sc-function> AdventureWorksDW.age_udf <sc-function> */

CREATE FUNCTION AdventureWorksDW.age_udf (bith_date DATE)
RETURNS VARCHAR(100)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN EXTRACT (YEAR FROM CURRENT_DATE) - EXTRACT (YEAR FROM bith_date );

--

/* <sc-function> AdventureWorksDW.fullname_udf <sc-function> */

CREATE FUNCTION AdventureWorksDW.fullname_udf (account_key INT, account_desc VARCHAR(50))
RETURNS VARCHAR(100)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COLLATION INVOKER
INLINE TYPE 1
RETURN CONCAT(CAST(account_key AS varchar(50)) ,'-' , account_desc);