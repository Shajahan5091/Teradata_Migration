/* <sc-table> AdventureWorksDW.FactResellerSales </sc-table> */
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactResellerSales
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
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/06/2025",  "domain": "no-domain-provided" }}'
;

--