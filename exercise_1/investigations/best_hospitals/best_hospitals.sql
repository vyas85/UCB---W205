SELECT HospitalName,Avg(Score) as AvgQuality FROM Procedures INNER JOIN Hospitals on Procedures.ProviderID = Hospitals.ProviderID GROUP BY Hospitals.HospitalNAme ORDER BY AvgQuality DESC LIMIT 10;
