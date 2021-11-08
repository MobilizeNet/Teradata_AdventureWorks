--

/* <sc-joinindex> AdventureWorksDW.account_idx </sc-joinindex> */

CREATE JOIN INDEX AdventureWorksDW.account_idx ,FALLBACK ,CHECKSUM = DEFAULT, MAP = TD_MAP1 AS 
SELECT (AdventureWorksDW.DimAccount.AccountKey ),(AdventureWorksDW.DimAccount.ParentAccountKey )
 FROM AdventureWorksDW.DimAccount 
ORDER BY AdventureWorksDW.DimAccount.AccountKey ASC 
PRIMARY INDEX ( AccountKey )

;

--

/* <sc-joinindex> AdventureWorksDW.customer_idx </sc-joinindex> */

CREATE JOIN INDEX AdventureWorksDW.customer_idx ,FALLBACK ,CHECKSUM = DEFAULT, MAP = TD_MAP1 AS 
SELECT (AdventureWorksDW.DimCustomer.CustomerKey ),(AdventureWorksDW.DimCustomer.GeographyKey )
 FROM AdventureWorksDW.DimCustomer 
ORDER BY AdventureWorksDW.DimCustomer.CustomerKey ASC 
PRIMARY INDEX ( CustomerKey )

;

