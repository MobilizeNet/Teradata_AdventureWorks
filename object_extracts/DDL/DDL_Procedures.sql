--

/* <sc-procedure> AdventureWorksDW.get_account </sc-procedure> */

CREATE PROCEDURE AdventureWorksDW.get_account(in account_key integer)
DYNAMIC RESULT SETS 1
begin
DECLARE cur1 CURSOR WITH RETURN ONLY FOR
select * from AdventureWorksDW.DimAccount
where accountKey = account_key;
OPEN cur1;

end;

--

/* <sc-procedure> AdventureWorksDW.get_customer </sc-procedure> */

CREATE PROCEDURE AdventureWorksDW.get_customer(in customer_key integer)
DYNAMIC RESULT SETS 1
begin
DECLARE cur CURSOR WITH RETURN ONLY FOR
select * from AdventureWorksDW.DimCustomer
where CustomerKey = customer_key;
OPEN cur;

end;

--

/* <sc-procedure> AdventureWorksDW.get_SomeCustomer </sc-procedure> */

CREATE PROCEDURE AdventureWorksDW.get_SomeCustomer()
DYNAMIC RESULT SETS 1
begin
DECLARE cur CURSOR WITH RETURN ONLY FOR
SELECT 
  CustomerKey, 
  GeographyKey, 
  CustomerAlternateKey, 
  "Title", 
  FirstName, 
  MiddleName, 
  LastName, 
  NameStyle, 
  BirthDate, 
  MaritalStatus, 
  Suffix, 
  Gender, 
  EmailAddress, 
  YearlyIncome, 
  TotalChildren, 
  NumberChildrenAtHome, 
  EnglishEducation, 
  SpanishEducation, 
  FrenchEducation, 
  EnglishOccupation, 
  SpanishOccupation, 
  FrenchOccupation, 
  HouseOwnerFlag, 
  NumberCarsOwned, 
  AddressLine1, 
  AddressLine2, 
  Phone, 
  DateFirstPurchase, 
  CommuteDistance 
FROM 
  AdventureWorksDW.DimCustomer 
WHERE 
  CustomerKey = 11014 
UNION 
SELECT 
  CustomerKey, 
  GeographyKey, 
  CustomerAlternateKey, 
  "Title", 
  FirstName, 
  MiddleName, 
  LastName, 
  NameStyle, 
  BirthDate, 
  MaritalStatus, 
  Suffix, 
  Gender, 
  EmailAddress, 
  YearlyIncome, 
  TotalChildren, 
  NumberChildrenAtHome, 
  EnglishEducation, 
  SpanishEducation, 
  FrenchEducation, 
  EnglishOccupation, 
  SpanishOccupation, 
  FrenchOccupation, 
  HouseOwnerFlag, 
  NumberCarsOwned, 
  AddressLine1, 
  AddressLine2, 
  Phone, 
  DateFirstPurchase, 
  CommuteDistance 
FROM 
  AdventureWorksDW.DimCustomer 
WHERE 
  CustomerKey = 11017 
UNION 
SELECT 
  CustomerKey, 
  GeographyKey, 
  CustomerAlternateKey, 
  "Title", 
  FirstName, 
  MiddleName, 
  LastName, 
  NameStyle, 
  BirthDate, 
  MaritalStatus, 
  Suffix, 
  Gender, 
  EmailAddress, 
  YearlyIncome, 
  TotalChildren, 
  NumberChildrenAtHome, 
  EnglishEducation, 
  SpanishEducation, 
  FrenchEducation, 
  EnglishOccupation, 
  SpanishOccupation, 
  FrenchOccupation, 
  HouseOwnerFlag, 
  NumberCarsOwned, 
  AddressLine1, 
  AddressLine2, 
  Phone, 
  DateFirstPurchase, 
  CommuteDistance 
FROM 
  AdventureWorksDW.DimCustomer 
WHERE 
  CustomerKey = 11027 
UNION 
SELECT 
  CustomerKey, 
  GeographyKey, 
  CustomerAlternateKey, 
  "Title", 
  FirstName, 
  MiddleName, 
  LastName, 
  NameStyle, 
  BirthDate, 
  MaritalStatus, 
  Suffix, 
  Gender, 
  EmailAddress, 
  YearlyIncome, 
  TotalChildren, 
  NumberChildrenAtHome, 
  EnglishEducation, 
  SpanishEducation, 
  FrenchEducation, 
  EnglishOccupation, 
  SpanishOccupation, 
  FrenchOccupation, 
  HouseOwnerFlag, 
  NumberCarsOwned, 
  AddressLine1, 
  AddressLine2, 
  Phone, 
  DateFirstPurchase, 
  CommuteDistance 
FROM 
  AdventureWorksDW.DimCustomer 
WHERE 
  CustomerKey = 11028 
UNION 
SELECT 
  CustomerKey, 
  GeographyKey, 
  CustomerAlternateKey, 
  "Title", 
  FirstName, 
  MiddleName, 
  LastName, 
  NameStyle, 
  BirthDate, 
  MaritalStatus, 
  Suffix, 
  Gender, 
  EmailAddress, 
  YearlyIncome, 
  TotalChildren, 
  NumberChildrenAtHome, 
  EnglishEducation, 
  SpanishEducation, 
  FrenchEducation, 
  EnglishOccupation, 
  SpanishOccupation, 
  FrenchOccupation, 
  HouseOwnerFlag, 
  NumberCarsOwned, 
  AddressLine1, 
  AddressLine2, 
  Phone, 
  DateFirstPurchase, 
  CommuteDistance 
FROM 
  AdventureWorksDW.DimCustomer 
WHERE 
  CustomerKey = 11030 
UNION 
SELECT 
  CustomerKey, 
  GeographyKey, 
  CustomerAlternateKey, 
  "Title", 
  FirstName, 
  MiddleName, 
  LastName, 
  NameStyle, 
  BirthDate, 
  MaritalStatus, 
  Suffix, 
  Gender, 
  EmailAddress, 
  YearlyIncome, 
  TotalChildren, 
  NumberChildrenAtHome, 
  EnglishEducation, 
  SpanishEducation, 
  FrenchEducation, 
  EnglishOccupation, 
  SpanishOccupation, 
  FrenchOccupation, 
  HouseOwnerFlag, 
  NumberCarsOwned, 
  AddressLine1, 
  AddressLine2, 
  Phone, 
  DateFirstPurchase, 
  CommuteDistance 
FROM 
  AdventureWorksDW.DimCustomer 
WHERE 
  CustomerKey = 11031 
UNION 
SELECT 
  CustomerKey, 
  GeographyKey, 
  CustomerAlternateKey, 
  "Title", 
  FirstName, 
  MiddleName, 
  LastName, 
  NameStyle, 
  BirthDate, 
  MaritalStatus, 
  Suffix, 
  Gender, 
  EmailAddress, 
  YearlyIncome, 
  TotalChildren, 
  NumberChildrenAtHome, 
  EnglishEducation, 
  SpanishEducation, 
  FrenchEducation, 
  EnglishOccupation, 
  SpanishOccupation, 
  FrenchOccupation, 
  HouseOwnerFlag, 
  NumberCarsOwned, 
  AddressLine1, 
  AddressLine2, 
  Phone, 
  DateFirstPurchase, 
  CommuteDistance 
FROM 
  AdventureWorksDW.DimCustomer 
WHERE 
  CustomerKey = 11032 ;
OPEN cur;
end;

