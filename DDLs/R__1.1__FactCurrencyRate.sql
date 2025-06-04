/* <sc-table> AdventureWorksDW.FactCurrencyRate </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactCurrencyRate
(
     CurrencyKey INTEGER NOT NULL,
     DateKey INTEGER NOT NULL,
     AverageRate NUMBER(38, 18) NOT NULL,
     EndOfDayRate NUMBER(38, 18) NOT NULL,
     "Date" DATE,
PRIMARY KEY ( CurrencyKey ,DateKey ),
CONSTRAINT FK_FactCurrencyRate_DimDate FOREIGN KEY ( DateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ),
CONSTRAINT FK_FactCurrencyRate_DimCurrency FOREIGN KEY ( CurrencyKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimCurrency ( CurrencyKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--