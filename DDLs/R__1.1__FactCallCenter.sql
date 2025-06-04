/* <sc-table> AdventureWorksDW.FactCallCenter </sc-table> */
--** SSC-FDM-TD0024 - SET TABLE FUNCTIONALITY NOT SUPPORTED. TABLE MIGHT HAVE DUPLICATE ROWS **
CREATE OR REPLACE TABLE ADVENTUREWORKSDW.SNOWCONVERT.FactCallCenter
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
PRIMARY KEY ( FactCallCenterID ),
CONSTRAINT FK_FactCallCenter_DimDate FOREIGN KEY ( DateKey ) REFERENCES ADVENTUREWORKSDW.SNOWCONVERT.DimDate ( DateKey ))
COMMENT = '{ "origin": "sf_sc", "name": "snowconvert", "version": {  "major": 1,  "minor": 7,  "patch": "0.0" }, "attributes": {  "component": "teradata",  "convertedOn": "06/04/2025",  "domain": "no-domain-provided" }}'
;

--