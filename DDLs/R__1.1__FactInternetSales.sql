/* <sc-table> AdventureWorksDW.FactInternetSales </sc-table> */
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactInternetSales
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
     ShipDate DATE,
CONSTRAINT FK_FactInternetSales_DimCurrency FOREIGN KEY ( CurrencyKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimCurrency ( CurrencyKey ),
CONSTRAINT FK_FactInternetSales_DimDate FOREIGN KEY ( OrderDateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ),
CONSTRAINT FK_FactInternetSales_DimDate1 FOREIGN KEY ( DueDateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ),
CONSTRAINT FK_FactInternetSales_DimDate2 FOREIGN KEY ( ShipDateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ),
CONSTRAINT FK_FactInternetSales_DimProduct FOREIGN KEY ( ProductKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimProduct ( ProductKey ),
CONSTRAINT FK_FactInternetSales_DimPromotion FOREIGN KEY ( PromotionKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimPromotion ( PromotionKey ),
CONSTRAINT FK_FactInternetSales_DimSalesTerritory FOREIGN KEY ( SalesTerritoryKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimSalesTerritory ( SalesTerritoryKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--