--
/* <sc-table> AdventureWorksDW.DimSalesReason </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimSalesReason
(
     SalesReasonKey INTEGER NOT NULL,
     SalesReasonAlternateKey INTEGER NOT NULL,
     SalesReasonName VARCHAR(50) NOT NULL,
     SalesReasonReasonType VARCHAR(50) NOT NULL,
PRIMARY KEY ( SalesReasonKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactResellerSales </sc-table> */
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactResellerSales
(
     ProductKey INTEGER NOT NULL,
     OrderDateKey INTEGER NOT NULL,
     DueDateKey INTEGER NOT NULL,
     ShipDateKey INTEGER NOT NULL,
     ResellerKey INTEGER NOT NULL,
     EmployeeKey INTEGER NOT NULL,
     PromotionKey INTEGER NOT NULL,
     CurrencyKey INTEGER NOT NULL,
     SalesTerritoryKey INTEGER NOT NULL,
     SalesOrderNumber VARCHAR(20) NOT NULL,
     SalesOrderLineNumber BYTEINT NOT NULL,
     RevisionNumber BYTEINT,
     OrderQuantity SMALLINT,
     UnitPrice NUMBER(18,4),
     ExtendedAmount NUMBER(18,4),
     UnitPriceDiscountPct NUMBER(38, 18),
     DiscountAmount NUMBER(38, 18),
     ProductStandardCost NUMBER(18,4),
     TotalProductCost NUMBER(18,4),
     SalesAmount NUMBER(18,4),
     TaxAmt NUMBER(18,4),
     Freight NUMBER(18,4),
     CarrierTrackingNumber VARCHAR(25),
     CustomerPONumber VARCHAR(25),
     OrderDate DATE,
     DueDate DATE,
     ShipDate DATE
)
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimScenario </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimScenario
(
     ScenarioKey INTEGER NOT NULL,
     ScenarioName VARCHAR(50),
PRIMARY KEY ( ScenarioKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactProductInventory </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactProductInventory
(
     ProductKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     MovementDate DATE NOT NULL,
     UnitCost NUMBER(18,4) NOT NULL,
     UnitsIn INTEGER NOT NULL,
     UnitsOut INTEGER NOT NULL,
     UnitsBalance INTEGER NOT NULL,
PRIMARY KEY ( ProductKey ,DateKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactFinance </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactFinance
(
     FinanceKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     OrganizationKey INTEGER NOT NULL,
     DepartmentGroupKey INTEGER NOT NULL,
     ScenarioKey INTEGER NOT NULL,
     AccountKey INTEGER NOT NULL,
     Amount NUMBER(38, 18) NOT NULL,
     "Date" DATE,
PRIMARY KEY ( FinanceKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimGeography </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimGeography
(
     GeographyKey INTEGER NOT NULL,
     City VARCHAR(30),
     StateProvinceCode VARCHAR(3),
     StateProvinceName VARCHAR(50),
     CountryRegionCode VARCHAR(3),
     EnglishCountryRegionName VARCHAR(50),
     SpanishCountryRegionName VARCHAR(50),
     FrenchCountryRegionName VARCHAR(50),
     PostalCode VARCHAR(15),
     SalesTerritoryKey INTEGER,
     IpAddressLocator VARCHAR(15),
PRIMARY KEY ( GeographyKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactInternetSalesReason </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactInternetSalesReason
(
     SalesOrderNumber VARCHAR(20) NOT NULL,
     SalesOrderLineNumber SMALLINT NOT NULL,
     SalesReasonKey INTEGER NOT NULL
)
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimEmployee </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimEmployee
(
     EmployeeKey INTEGER NOT NULL,
     ParentEmployeeKey INTEGER,
     EmployeeNationalIDAlternateKey VARCHAR(15),
     ParentEmployeeNationalIDAltKey VARCHAR(15),
     SalesTerritoryKey INTEGER,
     FirstName VARCHAR(50) NOT NULL,
     LastName VARCHAR(50) NOT NULL,
     MiddleName VARCHAR(50),
     "Title" VARCHAR(50),
     HireDate DATE,
     BirthDate DATE,
     LoginID VARCHAR(256),
     EmailAddress VARCHAR(50),
     Phone VARCHAR(25),
     MaritalStatus CHAR(1),
     EmergencyContactName VARCHAR(50),
     EmergencyContactPhone VARCHAR(25),
     Gender CHAR(1),
     PayFrequency BYTEINT,
     BaseRate NUMBER(18,4),
     VacationHours SMALLINT,
     SickLeaveHours SMALLINT,
     DepartmentName VARCHAR(50),
     StartDate DATE,
     EndDate DATE,
     Status VARCHAR(50),
     EmployeePhoto BINARY /*** SSC-FDM-TD0001 - COLUMN CONVERTED FROM BLOB DATA TYPE ***/,
PRIMARY KEY ( EmployeeKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimCurrency </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimCurrency
(
     CurrencyKey INTEGER NOT NULL,
     CurrencyAlternateKey CHAR(3) NOT NULL,
     CurrencyName VARCHAR(50) NOT NULL,
PRIMARY KEY ( CurrencyKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimSalesTerritory </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimSalesTerritory
(
     SalesTerritoryKey INTEGER NOT NULL,
     SalesTerritoryAlternateKey INTEGER,
     SalesTerritoryRegion VARCHAR(50) NOT NULL,
     SalesTerritoryCountry VARCHAR(50) NOT NULL,
     SalesTerritoryGroup VARCHAR(50),
     SalesTerritoryImage BINARY /*** SSC-FDM-TD0001 - COLUMN CONVERTED FROM BLOB DATA TYPE ***/,
PRIMARY KEY ( SalesTerritoryKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimDepartmentGroup </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimDepartmentGroup
(
     DepartmentGroupKey INTEGER NOT NULL,
     ParentDepartmentGroupKey INTEGER,
     DepartmentGroupName VARCHAR(50),
PRIMARY KEY ( DepartmentGroupKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimReseller </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimReseller
(
     ResellerKey INTEGER NOT NULL,
     GeographyKey INTEGER,
     ResellerAlternateKey VARCHAR(15),
     Phone VARCHAR(25),
     BusinessType VARCHAR(20) NOT NULL,
     ResellerName VARCHAR(50) NOT NULL,
     NumberEmployees INTEGER,
     OrderFrequency CHAR(1),
     OrderMonth BYTEINT,
     FirstOrderYear INTEGER,
     LastOrderYear INTEGER,
     ProductLine VARCHAR(50),
     AddressLine1 VARCHAR(60),
     AddressLine2 VARCHAR(60),
     AnnualSales NUMBER(18,4),
     BankName VARCHAR(50),
     MinPaymentType BYTEINT,
     MinPaymentAmount NUMBER(18,4),
     AnnualRevenue NUMBER(18,4),
     YearOpened INTEGER,
PRIMARY KEY ( ResellerKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.sample_table </sc-table> */
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.sample_table
(
     EmployeeKey INTEGER,
     EmployeeName VARCHAR(101),
     "Title" VARCHAR(50),
     Gender CHAR(1),
     SalesTerritoryRegion VARCHAR(50),
     SalesTerritoryCountry VARCHAR(50),
     SalesTerritoryGroup VARCHAR(50)
)
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactCurrencyRate </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactCurrencyRate
(
     CurrencyKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     AverageRate NUMBER(38, 18) NOT NULL,
     EndOfDayRate NUMBER(38, 18) NOT NULL,
     "Date" DATE,
PRIMARY KEY ( CurrencyKey ,DateKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.NewFactCurrencyRate </sc-table> */
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.NewFactCurrencyRate
(
     AverageRate NUMBER(38, 18),
     CurrencyID VARCHAR(3),
     CurrencyDate DATE,
     EndOfDayRate NUMBER(38, 18),
     CurrencyKey INTEGER,
     DateKey INTEGER)
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactInternetSales </sc-table> */
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactInternetSales
(
     ProductKey INTEGER NOT NULL,
     OrderDateKey INTEGER NOT NULL,
     DueDateKey INTEGER NOT NULL,
     ShipDateKey INTEGER NOT NULL,
     CustomerKey INTEGER NOT NULL,
     PromotionKey INTEGER NOT NULL,
     CurrencyKey INTEGER NOT NULL,
     SalesTerritoryKey INTEGER NOT NULL,
     SalesOrderNumber VARCHAR(20) NOT NULL,
     SalesOrderLineNumber SMALLINT NOT NULL,
     RevisionNumber BYTEINT NOT NULL,
     OrderQuantity SMALLINT NOT NULL,
     UnitPrice NUMBER(18,4) NOT NULL,
     ExtendedAmount NUMBER(18,4) NOT NULL,
     UnitPriceDiscountPct NUMBER(38, 18) NOT NULL,
     DiscountAmount NUMBER(38, 18) NOT NULL,
     ProductStandardCost NUMBER(18,4) NOT NULL,
     TotalProductCost NUMBER(18,4) NOT NULL,
     SalesAmount NUMBER(18,4) NOT NULL,
     TaxAmt NUMBER(18,4) NOT NULL,
     Freight NUMBER(18,4) NOT NULL,
     CarrierTrackingNumber VARCHAR(25),
     CustomerPONumber VARCHAR(25),
     OrderDate DATE,
     DueDate DATE,
     ShipDate DATE
)
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.ProspectiveBuyer </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.ProspectiveBuyer
(
     ProspectiveBuyerKey INTEGER NOT NULL,
     ProspectAlternateKey VARCHAR(15),
     FirstName VARCHAR(50),
     MiddleName VARCHAR(50),
     LastName VARCHAR(50),
     BirthDate DATE,
     MaritalStatus CHAR(1),
     Gender CHAR(1),
     EmailAddress VARCHAR(50),
     YearlyIncome NUMBER(18,4),
     TotalChildren BYTEINT,
     NumberChildrenAtHome BYTEINT,
     Education VARCHAR(40),
     Occupation VARCHAR(100),
     HouseOwnerFlag CHAR(1),
     NumberCarsOwned BYTEINT,
     AddressLine1 VARCHAR(120),
     AddressLine2 VARCHAR(120),
     City VARCHAR(30),
     StateProvinceCode VARCHAR(3),
     PostalCode VARCHAR(15),
     Phone VARCHAR(20),
     Salutation VARCHAR(8),
     Unknown INTEGER,
PRIMARY KEY ( ProspectiveBuyerKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimAccount </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimAccount
(
     AccountKey INTEGER NOT NULL,
     ParentAccountKey INTEGER,
     AccountCodeAlternateKey INTEGER,
     ParentAccountCodeAlternateKey INTEGER,
     AccountDescription VARCHAR(50) NOT NULL,
     AccountType VARCHAR(50),
     Operator VARCHAR(50),
     CustomMembers VARCHAR(300),
     ValueType VARCHAR(50),
     CustomMemberOptions VARCHAR(200),
PRIMARY KEY ( AccountKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimProductCategory </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimProductCategory
(
     ProductCategoryKey INTEGER NOT NULL,
     ProductCategoryAlternateKey INTEGER,
     EnglishProductCategoryName VARCHAR(50) NOT NULL,
     SpanishProductCategoryName VARCHAR(50) NOT NULL,
     FrenchProductCategoryName VARCHAR(50) NOT NULL,
PRIMARY KEY ( ProductCategoryKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimDate </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimDate
(
     DateKey INTEGER NOT NULL,
     FullDateAlternateKey DATE,
     DayNumberOfWeek BYTEINT,
     EnglishDayNameOfWeek VARCHAR(10),
     SpanishDayNameOfWeek VARCHAR(10),
     FrenchDayNameOfWeek VARCHAR(10),
     DayNumberOfMonth BYTEINT,
     DayNumberOfYear SMALLINT,
     WeekNumberOfYear BYTEINT,
     EnglishMonthName VARCHAR(10),
     SpanishMonthName VARCHAR(10),
     FrenchMonthName VARCHAR(10),
     MonthNumberOfYear BYTEINT,
     CalendarQuarter SMALLINT,
     CalendarYear CHAR(4),
     CalendarSemester SMALLINT,
     FiscalQuarter SMALLINT,
     FiscalYear CHAR(4),
     FiscalSemester SMALLINT,
PRIMARY KEY ( DateKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimProductSubcategory </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimProductSubcategory
(
     ProductSubcategoryKey INTEGER NOT NULL,
     ProductSubcategoryAlternateKey INTEGER,
     EnglishProductSubcategoryName VARCHAR(50) NOT NULL,
     SpanishProductSubcategoryName VARCHAR(50) NOT NULL,
     FrenchProductSubcategoryName VARCHAR(50) NOT NULL,
     ProductCategoryKey INTEGER,
PRIMARY KEY ( ProductSubcategoryKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactCallCenter </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactCallCenter
(
     FactCallCenterID INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     WageType VARCHAR(15) NOT NULL,
     Shift VARCHAR(20) NOT NULL,
     LevelOneOperators SMALLINT NOT NULL,
     LevelTwoOperators SMALLINT NOT NULL,
     TotalOperators SMALLINT NOT NULL,
     Calls INTEGER NOT NULL,
     AutomaticResponses INTEGER NOT NULL,
     Orders INTEGER NOT NULL,
     IssuesRaised SMALLINT NOT NULL,
     AverageTimePerIssue SMALLINT NOT NULL,
     ServiceGrade NUMBER(38, 18) NOT NULL,
     "Date" DATE,
PRIMARY KEY ( FactCallCenterID ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.AdventureWorksDWBuildVersion </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.AdventureWorksDWBuildVersion
(
     DBVersion VARCHAR(50),
     VersionDate TIMESTAMP(0))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimPromotion </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimPromotion
(
     PromotionKey INTEGER NOT NULL,
     PromotionAlternateKey INTEGER,
     EnglishPromotionName VARCHAR(255),
     SpanishPromotionName VARCHAR(255),
     FrenchPromotionName VARCHAR(255),
     DiscountPct NUMBER(38, 18),
     EnglishPromotionType VARCHAR(50),
     SpanishPromotionType VARCHAR(50),
     FrenchPromotionType VARCHAR(50),
     EnglishPromotionCategory VARCHAR(50),
     SpanishPromotionCategory VARCHAR(50),
     FrenchPromotionCategory VARCHAR(50),
     StartDate DATE NOT NULL,
     EndDate DATE,
     MinQty INTEGER,
     MaxQty INTEGER,
PRIMARY KEY ( PromotionKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactSalesQuota </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactSalesQuota
(
     SalesQuotaKey INTEGER NOT NULL,
     EmployeeKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     CalendarYear SMALLINT NOT NULL,
     CalendarQuarter BYTEINT NOT NULL,
     SalesAmountQuota NUMBER(18,4) NOT NULL,
     "Date" DATE,
PRIMARY KEY ( SalesQuotaKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactSurveyResponse </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactSurveyResponse
(
     SurveyResponseKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     CustomerKey INTEGER NOT NULL,
     ProductCategoryKey INTEGER NOT NULL,
     EnglishProductCategoryName VARCHAR(50) NOT NULL,
     ProductSubcategoryKey INTEGER NOT NULL,
     EnglishProductSubcategoryName VARCHAR(50) NOT NULL,
     "Date" DATE,
PRIMARY KEY ( SurveyResponseKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.FactAdditionalInternationalProductDescription </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.FactAdditionalInternationalProductDescription
(
     ProductKey INTEGER NOT NULL,
     CultureName VARCHAR(50) NOT NULL,
     ProductDescription VARCHAR(32000) NOT NULL
)
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimOrganization </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimOrganization
(
     OrganizationKey INTEGER NOT NULL,
     ParentOrganizationKey INTEGER,
     PercentageOfOwnership VARCHAR(16),
     OrganizationName VARCHAR(50),
     CurrencyKey INTEGER,
PRIMARY KEY ( OrganizationKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;

--
/* <sc-table> AdventureWorksDW.DimProduct </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE TABLE IF NOT EXISTS AdventureWorksDW.Snowconvert.DimProduct
(
     ProductKey INTEGER NOT NULL,
     ProductAlternateKey VARCHAR(25),
     ProductSubcategoryKey INTEGER,
     WeightUnitMeasureCode CHAR(3),
     SizeUnitMeasureCode CHAR(3),
     EnglishProductName VARCHAR(50) NOT NULL,
     SpanishProductName VARCHAR(50) NOT NULL,
     FrenchProductName VARCHAR(50) NOT NULL,
     StandardCost NUMBER(18,4),
     Color VARCHAR(15) NOT NULL,
     SafetyStockLevel SMALLINT,
     ReorderPoint SMALLINT,
     ListPrice NUMBER(18,4),
     SIZE VARCHAR(50),
     SizeRange VARCHAR(50),
     Weight NUMBER(38, 18),
     DaysToManufacture INTEGER,
     ProductLine CHAR(2),
     DealerPrice NUMBER(18,4),
     "Class" CHAR(2),
     STYLE CHAR(2),
     ModelName VARCHAR(50),
     LargePhoto BINARY /*** SSC-FDM-TD0001 - COLUMN CONVERTED FROM BLOB DATA TYPE ***/,
     EnglishDescription VARCHAR(400),
     FrenchDescription VARCHAR(400),
     ChineseDescription VARCHAR(400),
     ArabicDescription VARCHAR(400),
     HebrewDescription VARCHAR(400),
     ThaiDescription VARCHAR(400),
     GermanDescription VARCHAR(400),
     JapaneseDescription VARCHAR(400),
     TurkishDescription VARCHAR(400),
     StartDate DATE,
     EndDate DATE,
     Status VARCHAR(7),
PRIMARY KEY ( ProductKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "07/15/2025",  "domain": "no-domain-provided" }}'
;