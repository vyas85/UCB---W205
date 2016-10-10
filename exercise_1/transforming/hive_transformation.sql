DROP TABLE measures;
CREATE TABLE measures AS
SELECT MeasureID, MeasureName, MeasureStartDate, MeasureEndDate
FROM measures_raw;

DROP TABLE procedures;
CREATE TABLE procedures AS
SELECT ProviderID,Condition, MeasureID, Score
FROM effective_care_raw;

DROP TABLE hospitals;
CREATE TABLE hospitals AS
SELECT ProviderID,HospitalName, State,HospitalType,HospitalOwnership,EmergencyServices
FROM hospitals_raw;

DROP TABLE surveys_responses;
CREATE TABLE surveys_responses AS
SELECT ProviderID, HCAHPSBaseScore, HCAHPSConsistencyScore
FROM surveys_responses_raw;

ALTER TABLE surveys_responses
ADD COLUMN TotalScore bigint;

UPDATE surveys_responses
SET TotalScore = HCAHPSBaseScore+HCAHPSConsistencyScore;
