i--This table groups Hospitals and Conditions and Averages the Quality Score per Hospital/Procedure
CREATE TABLE HospitalProcsQuality AS
SELECT HospitalName,Hospitals.ProviderID, Condition,Avg(Score) as AvgQuality
FROM Procedures
INNER JOIN Hospitals on Procedures.ProviderID = Hospitals.ProviderID
GROUP BY Hospitals.HospitalNAme,Hospitals.ProviderID,Procedures.Condition;

--Diplays top 10 Conditions by Variability
Select Condition,Variance(AvgQuality) as Variability
FROM HospitalProcsQuality
GROUP BY Condition
ORDER BY Variability DESC
LIMIT 10;
