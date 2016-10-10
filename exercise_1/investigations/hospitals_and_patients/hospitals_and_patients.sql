--Checking if there is a correlation between hospital quality and patient satisfaction
CREATE TABLE HospitalQuality AS SELECT Hospitals.ProviderID,HospitalName,Avg(Score) as AvgQuality FROM Procedures INNER JOIN Hospitals on Procedures.ProviderID = Hospitals.ProviderID GROUP BY Hospitals.ProviderID,Hospitals.HospitalNAme ORDER BY AvgQuality DESC;

select Corr(AvgQuality,TotalScore) from hospitalquality INNER JOIN surveys_responses on hospitalquality.ProviderID = surveys_responses.ProviderNumber;

--Checking if there is a correlation between hospital procedure variability and patient satisfaction

CREATE TABLE HospitalProcsVariation AS
SELECT HospitalName, ProviderID, Variance(AvgQuality) From HospitalProcsQuality GROUP BY HospitalName,ProviderID;

select Corr(Variability,TotalScore) from hospitalprocsvariation INNER JOIN surveys_responses on hospitalprocsvariation.ProviderID = surveys_responses.ProviderNumber;



