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
     ShipDate DATE,
CONSTRAINT FK_FactResellerSales_DimCurrency FOREIGN KEY ( CurrencyKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimCurrency ( CurrencyKey ),
CONSTRAINT FK_FactResellerSales_DimDate FOREIGN KEY ( OrderDateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ),
CONSTRAINT FK_FactResellerSales_DimDate1 FOREIGN KEY ( DueDateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ),
CONSTRAINT FK_FactResellerSales_DimDate2 FOREIGN KEY ( ShipDateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ),
CONSTRAINT FK_FactResellerSales_DimEmployee FOREIGN KEY ( EmployeeKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimEmployee ( EmployeeKey ),
CONSTRAINT FK_FactResellerSales_DimProduct FOREIGN KEY ( ProductKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimProduct ( ProductKey ),
CONSTRAINT FK_FactResellerSales_DimPromotion FOREIGN KEY ( PromotionKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimPromotion ( PromotionKey ),
CONSTRAINT FK_FactResellerSales_DimReseller FOREIGN KEY ( ResellerKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimReseller ( ResellerKey ),
CONSTRAINT FK_FactResellerSales_DimSalesTerritory FOREIGN KEY ( SalesTerritoryKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimSalesTerritory ( SalesTerritoryKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--