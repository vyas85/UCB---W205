CREATE TABLE HospitalProcsQuality AS SELECT HospitalName,Hospitals.HospitalID, Condition,Avg(Score) as AvgQuality FROM Procedures INNER JOIN Hospitals on Procedures.ProviderID = Hospitals.ProviderID GROUP BY Hospitals.HospitalNAme,Hospitals.HospitalID,Procedures.Condition ORDER BY AvgQuality DESC;

Select Condition,Variance(AvgQuality) as Variability FROM HospitalProcsQuality GROUP BY Condition ORDER BY Variability DESC;

