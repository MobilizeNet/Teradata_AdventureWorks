--

/* <sc-macro> AdventureWorksDW.new_account </sc-macro> */

CREATE MACRO AdventureWorksDW.new_account(
AccountKey INTEGER,
ParentAccountKeyname INTEGER
) AS
(INSERT INTO AdventureWorksDW.DimAccount (AccountKey, ParentAccountKey)
VALUES (:AccountKey, :ParentAccountKey);
);

--

/* <sc-macro> AdventureWorksDW.update_customer_fullname </sc-macro> */

CREATE MACRO AdventureWorksDW.update_customer_fullname(
customer_key INTEGER,
pFirstName VARCHAR(50),
pMiddleName VARCHAR(50),
pLastName VARCHAR(50)
) AS
(update DimCustomer set FirstName = :pFirstName, MiddleName = :pMiddleName, LastName = :pLastName
 where CustomerKey = :customer_key;
);

