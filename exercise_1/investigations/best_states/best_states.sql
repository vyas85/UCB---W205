SELECT State,Avg(Score) as AvgQuality FROM Procedures
INNER JOIN Hospitals on Procedures.ProviderID = Hospitals.ProviderID
GROUP BY Hospitals.State
ORDER BY AvgQuality DESC
LIMIT 10;
