--Checking if there is a correlation between hospital quality and patient satisfaction
CREATE TABLE HospitalQuality AS
SELECT Hospitals.ProviderID,HospitalName,Avg(Score) AS AvgQuality
FROM Procedures
INNER JOIN Hospitals on Procedures.ProviderID = Hospitals.ProviderID
GROUP BY Hospitals.ProviderID,Hospitals.HospitalNAme;

SELECT Corr(AvgQuality,TotalScore) FROM hospitalquality
INNER JOIN surveys_responses ON hospitalquality.ProviderID = surveys_responses.ProviderNumber;

--Checking if there is a correlation between hospital procedure variability and patient satisfaction

CREATE TABLE HospitalProcsVariation AS
SELECT HospitalName, ProviderID, Variance(AvgQuality)
FROM HospitalProcsQuality
GROUP BY HospitalName,ProviderID;

SELECT Corr(Variability,TotalScore)
FROM HospitalProcsVariation
INNER JOIN surveys_responses on hospitalprocsvariation.ProviderID = surveys_responses.ProviderNumber;
