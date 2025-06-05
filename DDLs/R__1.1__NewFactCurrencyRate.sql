/* <sc-table> AdventureWorksDW.NewFactCurrencyRate </sc-table> */
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.NewFactCurrencyRate
(
     AverageRate NUMBER(38, 18),
     CurrencyID VARCHAR(3),
     CurrencyDate DATE,
     EndOfDayRate NUMBER(38, 18),
     CurrencyKey INTEGER,
     DateKey INTEGER)
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--