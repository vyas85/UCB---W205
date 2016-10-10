DROP TABLE measures;
CREATE TABLE measures AS
SELECT MeasureID, MeasureName, MeasureStartDate, MeasureEndDate
FROM measures_raw;

DROP TABLE procedures;
CREATE TABLE procedures AS
SELECT ProviderID,Condition, MeasureID, CAST(Score as bigint) AS Score
FROM effective_care_raw
WHERE Condition not in ('Emergency Department','Surgical Care Improvement Project') and MeasureId not in ('OP_3b','OP_5');

DROP TABLE hospitals;
CREATE TABLE hospitals AS
SELECT ProviderID,HospitalName, State,HospitalType,HospitalOwnership,EmergencyServices
FROM hospitals_raw;

DROP TABLE surveys_responses;
CREATE TABLE surveys_responses AS
SELECT ProviderNumber, HCAHPSBaseScore, HCAHPSConsistencyScore,HCAHPSBaseScore+ HCAHPSConsistencyScore as TotalScore
FROM surveys_responses_raw;
