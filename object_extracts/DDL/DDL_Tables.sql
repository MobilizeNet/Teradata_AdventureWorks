--

/* <sc-table> AdventureWorksDW.AdventureWorksDWBuildVersion </sc-table> */

CREATE SET TABLE AdventureWorksDW.AdventureWorksDWBuildVersion ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      DBVersion VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      VersionDate TIMESTAMP(0))
PRIMARY INDEX ( DBVersion );

--

/* <sc-table> AdventureWorksDW.DimAccount </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimAccount ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      AccountKey INTEGER NOT NULL,
      ParentAccountKey INTEGER,
      AccountCodeAlternateKey INTEGER,
      ParentAccountCodeAlternateKey INTEGER,
      AccountDescription VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      AccountType VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      Operator VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      CustomMembers VARCHAR(300) CHARACTER SET LATIN NOT CASESPECIFIC,
      ValueType VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      CustomMemberOptions VARCHAR(200) CHARACTER SET LATIN NOT CASESPECIFIC, 
PRIMARY KEY ( AccountKey ), 
CONSTRAINT FK_DimAccount_DimAccount FOREIGN KEY ( ParentAccountKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimAccount ( AccountKey ))
UNIQUE INDEX ident ( AccountKey ,ParentAccountKey );

--

/* <sc-table> AdventureWorksDW.DimCurrency </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimCurrency ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      CurrencyKey INTEGER NOT NULL,
      CurrencyAlternateKey CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      CurrencyName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL, 
PRIMARY KEY ( CurrencyKey ))
;

--

/* <sc-table> AdventureWorksDW.DimCustomer </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimCustomer ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      CustomerKey INTEGER NOT NULL,
      GeographyKey INTEGER,
      CustomerAlternateKey VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      "Title" VARCHAR(8) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS ,
      FirstName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      MiddleName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      LastName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      NameStyle BYTEINT COMPRESS 0 ,
      BirthDate DATE FORMAT 'yyyy-mm-dd',
      MaritalStatus CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('M','S'),
      Suffix VARCHAR(10) CHARACTER SET UNICODE NOT CASESPECIFIC,
      Gender CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      EmailAddress VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS USING TD_SYSFNLIB.TRANSUNICODETOUTF8 DECOMPRESS USING TD_SYSFNLIB.TRANSUTF8TOUNICODE ,
      YearlyIncome NUMBER(18,4) COMPRESS (10000 ,20000 ,30000 ,40000 ,50000 ,60000 ,70000 ,80000 ,90000 ,100000 ,110000 ,120000 ,130000 ,140000 ,150000 ),
      TotalChildren BYTEINT COMPRESS (0 ,1 ,2 ),
      NumberChildrenAtHome BYTEINT COMPRESS (0 ,1 ,2 ),
      EnglishEducation VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Bachelors','Partial College','High School','Graduate Degree','Partial High School'),
      SpanishEducation VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Licenciatura','Estudios universitarios (en curso)','Educación secundaria','Estudios de postgrado','Educación secundaria (en curso)'),
      FrenchEducation VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Bac + 4','Baccalauréat','Bac + 2','Bac + 3','Niveau bac'),
      EnglishOccupation VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Professional','Skilled Manual','Management','Clerical','Manual'),
      SpanishOccupation VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Profesional','Obrero especializado','Gestión','Administrativo','Obrero'),
      FrenchOccupation VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('Cadre','Technicien','Direction','Employé','Ouvrier'),
      HouseOwnerFlag CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0','1'),
      NumberCarsOwned BYTEINT COMPRESS (0 ,1 ,2 ),
      AddressLine1 VARCHAR(120) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS USING TD_SYSFNLIB.TRANSUNICODETOUTF8 DECOMPRESS USING TD_SYSFNLIB.TRANSUTF8TOUNICODE ,
      AddressLine2 VARCHAR(120) CHARACTER SET UNICODE NOT CASESPECIFIC COMPRESS USING TD_SYSFNLIB.TRANSUNICODETOUTF8 DECOMPRESS USING TD_SYSFNLIB.TRANSUTF8TOUNICODE ,
      Phone VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      DateFirstPurchase DATE FORMAT 'yyyy-mm-dd',
      CommuteDistance VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS ('0-1 Miles','2-5 Miles','1-2 Miles','5-10 Miles','10+ Miles'), 
PRIMARY KEY ( CustomerKey ), 
CONSTRAINT FK_DimCustomer_DimGeography FOREIGN KEY ( GeographyKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimGeography ( GeographyKey ))
UNIQUE INDEX idcust ( CustomerKey ,GeographyKey );

--

/* <sc-table> AdventureWorksDW.DimDate </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimDate ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      DateKey INTEGER NOT NULL,
      FullDateAlternateKey DATE FORMAT 'yyyy-mm-dd',
      DayNumberOfWeek BYTEINT,
      EnglishDayNameOfWeek VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      SpanishDayNameOfWeek VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      FrenchDayNameOfWeek VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      DayNumberOfMonth BYTEINT,
      DayNumberOfYear SMALLINT,
      WeekNumberOfYear BYTEINT,
      EnglishMonthName VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      SpanishMonthName VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      FrenchMonthName VARCHAR(10) CHARACTER SET LATIN NOT CASESPECIFIC,
      MonthNumberOfYear BYTEINT,
      CalendarQuarter SMALLINT,
      CalendarYear CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC,
      CalendarSemester SMALLINT,
      FiscalQuarter SMALLINT,
      FiscalYear CHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC,
      FiscalSemester SMALLINT, 
PRIMARY KEY ( DateKey ))
;

--

/* <sc-table> AdventureWorksDW.DimDepartmentGroup </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimDepartmentGroup ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      DepartmentGroupKey INTEGER NOT NULL,
      ParentDepartmentGroupKey INTEGER,
      DepartmentGroupName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC, 
PRIMARY KEY ( DepartmentGroupKey ), 
CONSTRAINT FK_DimDepartmentGroup_DimDepartmentGroup FOREIGN KEY ( ParentDepartmentGroupKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDepartmentGroup ( DepartmentGroupKey ))
;

--

/* <sc-table> AdventureWorksDW.DimEmployee </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimEmployee ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      EmployeeKey INTEGER NOT NULL,
      ParentEmployeeKey INTEGER,
      EmployeeNationalIDAlternateKey VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      ParentEmployeeNationalIDAltKey VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      SalesTerritoryKey INTEGER,
      FirstName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
      LastName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
      MiddleName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      NameStyle BYTEINT CHECK ( NameStyle  IN (0 ,1 ) ) NOT NULL,
      "Title" VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      HireDate DATE FORMAT 'yyyy-mm-dd',
      BirthDate DATE FORMAT 'yyyy-mm-dd',
      LoginID VARCHAR(256) CHARACTER SET UNICODE NOT CASESPECIFIC,
      EmailAddress VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      Phone VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
      MaritalStatus CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      EmergencyContactName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      EmergencyContactPhone VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      SalariedFlag BYTEINT CHECK ( SalariedFlag  IN (0 ,1 ) ),
      Gender CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PayFrequency BYTEINT,
      BaseRate NUMBER(18,4),
      VacationHours SMALLINT,
      SickLeaveHours SMALLINT,
      CurrentFlag BYTEINT CHECK ( CurrentFlag  IN (0 ,1 ) ) NOT NULL,
      SalesPersonFlag BYTEINT CHECK ( SalesPersonFlag  IN (0 ,1 ) ) NOT NULL,
      DepartmentName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      StartDate DATE FORMAT 'yyyy-mm-dd',
      EndDate DATE FORMAT 'yyyy-mm-dd',
      Status VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      EmployeePhoto BLOB(2097088000), 
PRIMARY KEY ( EmployeeKey ), 
CONSTRAINT FK_DimEmployee_DimSalesTerritory FOREIGN KEY ( SalesTerritoryKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimSalesTerritory ( SalesTerritoryKey ),
CONSTRAINT FK_DimEmployee_DimEmployee FOREIGN KEY ( ParentEmployeeKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimEmployee ( EmployeeKey ))
;

--

/* <sc-table> AdventureWorksDW.DimGeography </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimGeography ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      GeographyKey INTEGER NOT NULL,
      City VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
      StateProvinceCode VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
      StateProvinceName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      CountryRegionCode VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
      EnglishCountryRegionName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      SpanishCountryRegionName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      FrenchCountryRegionName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      PostalCode VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      SalesTerritoryKey INTEGER,
      IpAddressLocator VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC, 
PRIMARY KEY ( GeographyKey ), 
CONSTRAINT FK_DimGeography_DimSalesTerritory FOREIGN KEY ( SalesTerritoryKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimSalesTerritory ( SalesTerritoryKey ))
;

--

/* <sc-table> AdventureWorksDW.DimOrganization </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimOrganization ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      OrganizationKey INTEGER NOT NULL,
      ParentOrganizationKey INTEGER,
      PercentageOfOwnership VARCHAR(16) CHARACTER SET LATIN NOT CASESPECIFIC,
      OrganizationName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      CurrencyKey INTEGER, 
PRIMARY KEY ( OrganizationKey ), 
CONSTRAINT FK_DimOrganization_DimCurrency FOREIGN KEY ( CurrencyKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimCurrency ( CurrencyKey ),
CONSTRAINT FK_DimOrganization_DimOrganization FOREIGN KEY ( ParentOrganizationKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimOrganization ( OrganizationKey ))
;

--

/* <sc-table> AdventureWorksDW.DimProduct </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimProduct ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ProductKey INTEGER NOT NULL,
      ProductAlternateKey VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      ProductSubcategoryKey INTEGER,
      WeightUnitMeasureCode CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
      SizeUnitMeasureCode CHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
      EnglishProductName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SpanishProductName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      FrenchProductName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      StandardCost NUMBER(18,4),
      FinishedGoodsFlag BYTEINT CHECK ( FinishedGoodsFlag  IN (0 ,1 ) ) NOT NULL,
      Color VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SafetyStockLevel SMALLINT,
      ReorderPoint SMALLINT,
      ListPrice NUMBER(18,4),
      SIZE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      SizeRange VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      Weight NUMBER,
      DaysToManufacture INTEGER,
      ProductLine CHAR(2) CHARACTER SET UNICODE NOT CASESPECIFIC,
      DealerPrice NUMBER(18,4),
      "Class" CHAR(2) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STYLE CHAR(2) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ModelName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      LargePhoto BLOB(2097088000),
      EnglishDescription VARCHAR(400) CHARACTER SET LATIN NOT CASESPECIFIC,
      FrenchDescription VARCHAR(400) CHARACTER SET LATIN NOT CASESPECIFIC,
      ChineseDescription VARCHAR(400) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ArabicDescription VARCHAR(400) CHARACTER SET UNICODE NOT CASESPECIFIC,
      HebrewDescription VARCHAR(400) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ThaiDescription VARCHAR(400) CHARACTER SET UNICODE NOT CASESPECIFIC,
      GermanDescription VARCHAR(400) CHARACTER SET LATIN NOT CASESPECIFIC,
      JapaneseDescription VARCHAR(400) CHARACTER SET UNICODE NOT CASESPECIFIC,
      TurkishDescription VARCHAR(400) CHARACTER SET UNICODE NOT CASESPECIFIC,
      StartDate DATE FORMAT 'yyyy-mm-dd',
      EndDate DATE FORMAT 'yyyy-mm-dd',
      Status VARCHAR(7) CHARACTER SET LATIN NOT CASESPECIFIC COMPRESS 'Current', 
PRIMARY KEY ( ProductKey ), 
CONSTRAINT FK_DimProduct_DimProductSubcategory FOREIGN KEY ( ProductSubcategoryKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimProductSubcategory ( ProductSubcategoryKey ))
;

--

/* <sc-table> AdventureWorksDW.DimProductCategory </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimProductCategory ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ProductCategoryKey INTEGER NOT NULL,
      ProductCategoryAlternateKey INTEGER,
      EnglishProductCategoryName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SpanishProductCategoryName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      FrenchProductCategoryName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL, 
PRIMARY KEY ( ProductCategoryKey ))
;

--

/* <sc-table> AdventureWorksDW.DimProductSubcategory </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimProductSubcategory ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ProductSubcategoryKey INTEGER NOT NULL,
      ProductSubcategoryAlternateKey INTEGER,
      EnglishProductSubcategoryName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SpanishProductSubcategoryName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      FrenchProductSubcategoryName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      ProductCategoryKey INTEGER, 
PRIMARY KEY ( ProductSubcategoryKey ), 
CONSTRAINT FK_DimProductSubcategory_DimProductCategory FOREIGN KEY ( ProductCategoryKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimProductCategory ( ProductCategoryKey ))
;

--

/* <sc-table> AdventureWorksDW.DimPromotion </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimPromotion ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      PromotionKey INTEGER NOT NULL,
      PromotionAlternateKey INTEGER,
      EnglishPromotionName VARCHAR(255) CHARACTER SET LATIN NOT CASESPECIFIC,
      SpanishPromotionName VARCHAR(255) CHARACTER SET UNICODE NOT CASESPECIFIC,
      FrenchPromotionName VARCHAR(255) CHARACTER SET UNICODE NOT CASESPECIFIC,
      DiscountPct NUMBER,
      EnglishPromotionType VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      SpanishPromotionType VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      FrenchPromotionType VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      EnglishPromotionCategory VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      SpanishPromotionCategory VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      FrenchPromotionCategory VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      StartDate DATE FORMAT 'yyyy-mm-dd' NOT NULL,
      EndDate DATE FORMAT 'yyyy-mm-dd',
      MinQty INTEGER,
      MaxQty INTEGER, 
PRIMARY KEY ( PromotionKey ))
;

--

/* <sc-table> AdventureWorksDW.DimReseller </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimReseller ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ResellerKey INTEGER NOT NULL,
      GeographyKey INTEGER,
      ResellerAlternateKey VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      Phone VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      BusinessType VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      ResellerName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
      NumberEmployees INTEGER,
      OrderFrequency CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      OrderMonth BYTEINT,
      FirstOrderYear INTEGER,
      LastOrderYear INTEGER,
      ProductLine VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      AddressLine1 VARCHAR(60) CHARACTER SET UNICODE NOT CASESPECIFIC,
      AddressLine2 VARCHAR(60) CHARACTER SET UNICODE NOT CASESPECIFIC,
      AnnualSales NUMBER(18,4),
      BankName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      MinPaymentType BYTEINT,
      MinPaymentAmount NUMBER(18,4),
      AnnualRevenue NUMBER(18,4),
      YearOpened INTEGER, 
PRIMARY KEY ( ResellerKey ), 
CONSTRAINT FK_DimReseller_DimGeography FOREIGN KEY ( GeographyKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimGeography ( GeographyKey ))
;

--

/* <sc-table> AdventureWorksDW.DimSalesReason </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimSalesReason ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      SalesReasonKey INTEGER NOT NULL,
      SalesReasonAlternateKey INTEGER NOT NULL,
      SalesReasonName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SalesReasonReasonType VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL, 
PRIMARY KEY ( SalesReasonKey ))
;

--

/* <sc-table> AdventureWorksDW.DimSalesTerritory </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimSalesTerritory ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      SalesTerritoryKey INTEGER NOT NULL,
      SalesTerritoryAlternateKey INTEGER,
      SalesTerritoryRegion VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SalesTerritoryCountry VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SalesTerritoryGroup VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      SalesTerritoryImage BLOB(2097088000), 
PRIMARY KEY ( SalesTerritoryKey ))
;

--

/* <sc-table> AdventureWorksDW.DimScenario </sc-table> */

CREATE SET TABLE AdventureWorksDW.DimScenario ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ScenarioKey INTEGER NOT NULL,
      ScenarioName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC, 
PRIMARY KEY ( ScenarioKey ))
;

--

/* <sc-table> AdventureWorksDW.FactAdditionalInternationalProductDescription </sc-table> */

CREATE SET TABLE AdventureWorksDW.FactAdditionalInternationalProductDescription ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ProductKey INTEGER NOT NULL,
      CultureName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      ProductDescription VARCHAR(32000) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL COMPRESS USING TD_SYSFNLIB.TRANSUNICODETOUTF8 DECOMPRESS USING TD_SYSFNLIB.TRANSUTF8TOUNICODE )
PRIMARY INDEX ( ProductKey );

--

/* <sc-table> AdventureWorksDW.FactCallCenter </sc-table> */

CREATE SET TABLE AdventureWorksDW.FactCallCenter ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      FactCallCenterID INTEGER NOT NULL,
      DateKey INTEGER NOT NULL,
      WageType VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
      Shift VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
      LevelOneOperators SMALLINT NOT NULL,
      LevelTwoOperators SMALLINT NOT NULL,
      TotalOperators SMALLINT NOT NULL,
      Calls INTEGER NOT NULL,
      AutomaticResponses INTEGER NOT NULL,
      Orders INTEGER NOT NULL,
      IssuesRaised SMALLINT NOT NULL,
      AverageTimePerIssue SMALLINT NOT NULL,
      ServiceGrade NUMBER NOT NULL,
      "Date" DATE FORMAT 'yyyy-mm-dd', 
PRIMARY KEY ( FactCallCenterID ), 
CONSTRAINT FK_FactCallCenter_DimDate FOREIGN KEY ( DateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ))
;

--

/* <sc-table> AdventureWorksDW.FactCurrencyRate </sc-table> */

CREATE SET TABLE AdventureWorksDW.FactCurrencyRate ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      CurrencyKey INTEGER NOT NULL,
      DateKey INTEGER NOT NULL,
      AverageRate NUMBER NOT NULL,
      EndOfDayRate NUMBER NOT NULL,
      "Date" DATE FORMAT 'yyyy-mm-dd', 
PRIMARY KEY ( CurrencyKey ,DateKey ), 
CONSTRAINT FK_FactCurrencyRate_DimDate FOREIGN KEY ( DateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactCurrencyRate_DimCurrency FOREIGN KEY ( CurrencyKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimCurrency ( CurrencyKey ))
;

--

/* <sc-table> AdventureWorksDW.FactFinance </sc-table> */

CREATE SET TABLE AdventureWorksDW.FactFinance ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      FinanceKey INTEGER NOT NULL,
      DateKey INTEGER NOT NULL,
      OrganizationKey INTEGER NOT NULL,
      DepartmentGroupKey INTEGER NOT NULL,
      ScenarioKey INTEGER NOT NULL,
      AccountKey INTEGER NOT NULL,
      Amount NUMBER NOT NULL,
      "Date" DATE FORMAT 'yyyy-mm-dd', 
PRIMARY KEY ( FinanceKey ), 
CONSTRAINT FK_FactFinance_DimScenario FOREIGN KEY ( ScenarioKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimScenario ( ScenarioKey ),
CONSTRAINT FK_FactFinance_DimOrganization FOREIGN KEY ( OrganizationKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimOrganization ( OrganizationKey ),
CONSTRAINT FK_FactFinance_DimDepartmentGroup FOREIGN KEY ( DepartmentGroupKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDepartmentGroup ( DepartmentGroupKey ),
CONSTRAINT FK_FactFinance_DimDate FOREIGN KEY ( DateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactFinance_DimAccount FOREIGN KEY ( AccountKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimAccount ( AccountKey ))
;

--

/* <sc-table> AdventureWorksDW.FactInternetSales </sc-table> */

CREATE MULTISET TABLE AdventureWorksDW.FactInternetSales ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ProductKey INTEGER NOT NULL,
      OrderDateKey INTEGER NOT NULL,
      DueDateKey INTEGER NOT NULL,
      ShipDateKey INTEGER NOT NULL,
      CustomerKey INTEGER NOT NULL,
      PromotionKey INTEGER NOT NULL,
      CurrencyKey INTEGER NOT NULL COMPRESS (6 ,19 ,100 ),
      SalesTerritoryKey INTEGER NOT NULL COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      SalesOrderNumber VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SalesOrderLineNumber SMALLINT NOT NULL COMPRESS (1 ,2 ,3 ),
      RevisionNumber BYTEINT NOT NULL COMPRESS 1 ,
      OrderQuantity SMALLINT NOT NULL COMPRESS 1 ,
      UnitPrice NUMBER(18,4) NOT NULL,
      ExtendedAmount NUMBER(18,4) NOT NULL,
      UnitPriceDiscountPct NUMBER NOT NULL COMPRESS 0 ,
      DiscountAmount NUMBER NOT NULL COMPRESS 0 ,
      ProductStandardCost NUMBER(18,4) NOT NULL,
      TotalProductCost NUMBER(18,4) NOT NULL,
      SalesAmount NUMBER(18,4) NOT NULL,
      TaxAmt NUMBER(18,4) NOT NULL,
      Freight NUMBER(18,4) NOT NULL,
      CarrierTrackingNumber VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      CustomerPONumber VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      OrderDate DATE FORMAT 'yyyy-mm-dd',
      DueDate DATE FORMAT 'yyyy-mm-dd',
      ShipDate DATE FORMAT 'yyyy-mm-dd', 
CONSTRAINT FK_FactInternetSales_DimCurrency FOREIGN KEY ( CurrencyKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimCurrency ( CurrencyKey ),
CONSTRAINT FK_FactInternetSales_DimCustomer FOREIGN KEY ( CustomerKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimCustomer ( CustomerKey ),
CONSTRAINT FK_FactInternetSales_DimDate FOREIGN KEY ( OrderDateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactInternetSales_DimDate1 FOREIGN KEY ( DueDateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactInternetSales_DimDate2 FOREIGN KEY ( ShipDateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactInternetSales_DimProduct FOREIGN KEY ( ProductKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimProduct ( ProductKey ),
CONSTRAINT FK_FactInternetSales_DimPromotion FOREIGN KEY ( PromotionKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimPromotion ( PromotionKey ),
CONSTRAINT FK_FactInternetSales_DimSalesTerritory FOREIGN KEY ( SalesTerritoryKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimSalesTerritory ( SalesTerritoryKey ))
PRIMARY INDEX ( SalesOrderNumber );

--

/* <sc-table> AdventureWorksDW.FactInternetSalesReason </sc-table> */

CREATE SET TABLE AdventureWorksDW.FactInternetSalesReason ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      SalesOrderNumber VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SalesOrderLineNumber SMALLINT NOT NULL COMPRESS (1 ,2 ,3 ),
      SalesReasonKey INTEGER NOT NULL COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ), 
CONSTRAINT FK_FactInternetSalesReason_FactInternetSales FOREIGN KEY ( SalesOrderNumber ,
SalesOrderLineNumber ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.FactInternetSales ( SalesOrderNumber ,
SalesOrderLineNumber ),
CONSTRAINT FK_FactInternetSalesReason_DimSalesReason FOREIGN KEY ( SalesReasonKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimSalesReason ( SalesReasonKey ))
PRIMARY INDEX ( SalesOrderNumber );

--

/* <sc-table> AdventureWorksDW.FactProductInventory </sc-table> */

CREATE SET TABLE AdventureWorksDW.FactProductInventory ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ProductKey INTEGER NOT NULL,
      DateKey INTEGER NOT NULL,
      MovementDate DATE FORMAT 'YYYY-MM-DD' NOT NULL,
      UnitCost NUMBER(18,4) NOT NULL COMPRESS (.41 ,.18 ,.36 ,.31 ,.26 ,.44 ,.21 ,.39 ,.16 ,.34 ,.29 ,.24 ,.42 ,.19 ,.37 ,.32 ,.27 ,.45 ,.22 ,.4 ,.17 ,.35 ,.3 ,.25 ,.43 ,.2 ,.38 ,.33 ,.51 ,.28 ,.23 ),
      UnitsIn INTEGER NOT NULL COMPRESS 0 ,
      UnitsOut INTEGER NOT NULL COMPRESS 0 ,
      UnitsBalance INTEGER NOT NULL COMPRESS (4 ,52 ,84 ,88 ,875 ,438 ,700 ), 
PRIMARY KEY ( ProductKey ,DateKey ), 
CONSTRAINT FK_FactProductInventory_DimDate FOREIGN KEY ( DateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactProductInventory_DimProduct FOREIGN KEY ( ProductKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimProduct ( ProductKey ))
;

--

/* <sc-table> AdventureWorksDW.FactResellerSales </sc-table> */

CREATE MULTISET TABLE AdventureWorksDW.FactResellerSales ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ProductKey INTEGER NOT NULL,
      OrderDateKey INTEGER NOT NULL,
      DueDateKey INTEGER NOT NULL,
      ShipDateKey INTEGER NOT NULL,
      ResellerKey INTEGER NOT NULL,
      EmployeeKey INTEGER NOT NULL,
      PromotionKey INTEGER NOT NULL COMPRESS 1 ,
      CurrencyKey INTEGER NOT NULL COMPRESS (6 ,19 ,100 ),
      SalesTerritoryKey INTEGER NOT NULL COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ),
      SalesOrderNumber VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      SalesOrderLineNumber BYTEINT NOT NULL COMPRESS (1 ,2 ,3 ),
      RevisionNumber BYTEINT COMPRESS 1 ,
      OrderQuantity SMALLINT COMPRESS (1 ,2 ,3 ,4 ,5 ,6 ,7 ),
      UnitPrice NUMBER(18,4),
      ExtendedAmount NUMBER(18,4),
      UnitPriceDiscountPct NUMBER COMPRESS 0 ,
      DiscountAmount NUMBER COMPRESS 0 ,
      ProductStandardCost NUMBER(18,4),
      TotalProductCost NUMBER(18,4),
      SalesAmount NUMBER(18,4),
      TaxAmt NUMBER(18,4),
      Freight NUMBER(18,4),
      CarrierTrackingNumber VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      CustomerPONumber VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      OrderDate DATE FORMAT 'yyyy-mm-dd',
      DueDate DATE FORMAT 'yyyy-mm-dd',
      ShipDate DATE FORMAT 'yyyy-mm-dd', 
CONSTRAINT FK_FactResellerSales_DimCurrency FOREIGN KEY ( CurrencyKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimCurrency ( CurrencyKey ),
CONSTRAINT FK_FactResellerSales_DimDate FOREIGN KEY ( OrderDateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactResellerSales_DimDate1 FOREIGN KEY ( DueDateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactResellerSales_DimDate2 FOREIGN KEY ( ShipDateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactResellerSales_DimEmployee FOREIGN KEY ( EmployeeKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimEmployee ( EmployeeKey ),
CONSTRAINT FK_FactResellerSales_DimProduct FOREIGN KEY ( ProductKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimProduct ( ProductKey ),
CONSTRAINT FK_FactResellerSales_DimPromotion FOREIGN KEY ( PromotionKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimPromotion ( PromotionKey ),
CONSTRAINT FK_FactResellerSales_DimReseller FOREIGN KEY ( ResellerKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimReseller ( ResellerKey ),
CONSTRAINT FK_FactResellerSales_DimSalesTerritory FOREIGN KEY ( SalesTerritoryKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimSalesTerritory ( SalesTerritoryKey ))
PRIMARY INDEX ( SalesOrderNumber );

--

/* <sc-table> AdventureWorksDW.FactSalesQuota </sc-table> */

CREATE SET TABLE AdventureWorksDW.FactSalesQuota ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      SalesQuotaKey INTEGER NOT NULL,
      EmployeeKey INTEGER NOT NULL,
      DateKey INTEGER NOT NULL,
      CalendarYear SMALLINT NOT NULL,
      CalendarQuarter BYTEINT NOT NULL,
      SalesAmountQuota NUMBER(18,4) NOT NULL,
      "Date" DATE FORMAT 'yyyy-mm-dd', 
PRIMARY KEY ( SalesQuotaKey ), 
CONSTRAINT FK_FactSalesQuota_DimEmployee FOREIGN KEY ( EmployeeKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimEmployee ( EmployeeKey ),
CONSTRAINT FK_FactSalesQuota_DimDate FOREIGN KEY ( DateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ))
;

--

/* <sc-table> AdventureWorksDW.FactSurveyResponse </sc-table> */

CREATE SET TABLE AdventureWorksDW.FactSurveyResponse ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      SurveyResponseKey INTEGER NOT NULL,
      DateKey INTEGER NOT NULL,
      CustomerKey INTEGER NOT NULL,
      ProductCategoryKey INTEGER NOT NULL,
      EnglishProductCategoryName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      ProductSubcategoryKey INTEGER NOT NULL,
      EnglishProductSubcategoryName VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      "Date" DATE FORMAT 'yyyy-mm-dd', 
PRIMARY KEY ( SurveyResponseKey ), 
CONSTRAINT FK_FactSurveyResponse_DateKey FOREIGN KEY ( DateKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimDate ( DateKey ),
CONSTRAINT FK_FactSurveyResponse_CustomerKey FOREIGN KEY ( CustomerKey ) REFERENCES WITH NO CHECK OPTION AdventureWorksDW.DimCustomer ( CustomerKey ))
;

--

/* <sc-table> AdventureWorksDW.NewFactCurrencyRate </sc-table> */

CREATE MULTISET TABLE AdventureWorksDW.NewFactCurrencyRate ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      AverageRate NUMBER,
      CurrencyID VARCHAR(3) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CurrencyDate DATE FORMAT 'yyyy-mm-dd',
      EndOfDayRate NUMBER,
      CurrencyKey INTEGER,
      DateKey INTEGER)
PRIMARY INDEX ( CurrencyID ,CurrencyDate );

--

/* <sc-table> AdventureWorksDW.ProspectiveBuyer </sc-table> */

CREATE SET TABLE AdventureWorksDW.ProspectiveBuyer ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      ProspectiveBuyerKey INTEGER NOT NULL,
      ProspectAlternateKey VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      FirstName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      MiddleName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      LastName VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      BirthDate DATE FORMAT 'yyyy-mm-dd',
      MaritalStatus CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      Gender CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      EmailAddress VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      YearlyIncome NUMBER(18,4),
      TotalChildren BYTEINT,
      NumberChildrenAtHome BYTEINT,
      Education VARCHAR(40) CHARACTER SET LATIN NOT CASESPECIFIC,
      Occupation VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      HouseOwnerFlag CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      NumberCarsOwned BYTEINT,
      AddressLine1 VARCHAR(120) CHARACTER SET UNICODE NOT CASESPECIFIC,
      AddressLine2 VARCHAR(120) CHARACTER SET UNICODE NOT CASESPECIFIC,
      City VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
      StateProvinceCode VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
      PostalCode VARCHAR(15) CHARACTER SET LATIN NOT CASESPECIFIC,
      Phone VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      Salutation VARCHAR(8) CHARACTER SET UNICODE NOT CASESPECIFIC,
      Unknown INTEGER, 
PRIMARY KEY ( ProspectiveBuyerKey ))
;

