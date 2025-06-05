/* <sc-table> AdventureWorksDW.DimDate </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.DimDate
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
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/05/2025",  "domain": "no-domain-provided" }}'
;

--