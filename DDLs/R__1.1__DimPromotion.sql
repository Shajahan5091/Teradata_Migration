/* <sc-table> AdventureWorksDW.DimPromotion </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimPromotion
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
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--