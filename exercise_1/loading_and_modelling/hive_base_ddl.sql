DROP TABLE measures_raw;
CREATE EXTERNAL TABLE measures_raw
(
MeasureName string,
MeasureID string,
MeasureStartQuarter string,
MeasureStartDate date,
MeasureEndQuarter string,
MeasureEndDate date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\n'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures_raw';

DROP TABLE hospitals_raw;
CREATE EXTERNAL TABLE hospitals_raw
(
ProviderID bigint,
HospitalName string,
Address string,
City string,
State string,
ZIPCode string,
CountyName string,
PhoneNumber string,
HospitalType string,
HospitalOwnership string,
EmergencyServices string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\n'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals_raw';

DROP TABLE effective_care_raw;
CREATE EXTERNAL TABLE effective_care_raw
(
ProviderID bigint,
HospitalName string,
Address string,
City string,
State string,
ZIPCode string,
CountyName string,
PhoneNumber string,
Condition string,
MeasureID string,
MeasureName string,
Score string,
Sample string,
Footnote string,
MeasureStartDate date,
MeasureEndDate date
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\n'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care_raw';

DROP TABLE surveys_responses_raw;
CREATE EXTERNAL TABLE surveys_responses_raw
(
ProviderNumber bigint,
HospitalName string,
Address string,
City string,
State string,
ZIPCode string,
CountyName string,
CommunicationwithNursesAchievementPoints string,
CommunicationwithNursesImprovementPoints string,
CommunicationwithNursesDimensionScore string,
CommunicationwithDoctorsAchievementPoints string,
CommunicationwithDoctorsImprovementPoints string,
CommunicationwithDoctorsDimensionScore string,
ResponsivenessofHospitalStaffAchievementPoints string,
ResponsivenessofHospitalStaffImprovementPoints string,
ResponsivenessofHospitalStaffDimensionScore string,
PainManagementAchievementPoints string,
PainManagementImprovementPoints string,
PainManagementDimensionScore string,
CommunicationaboutMedicinesAchievementPoints string,
CommunicationaboutMedicinesImprovementPoints string,
CommunicationaboutMedicinesDimensionScore string,
CleanlinessandQuietnessofHospitalEnvironmentAchievementPoints string,
CleanlinessandQuietnessofHospitalEnvironmentImprovementPoints string,
CleanlinessandQuietnessofHospitalEnvironmentDimensionScore string,
DischargeInformationAchievementPoints string,
DischargeInformationImprovementPoints string,
DischargeInformationDimensionScore string,
OverallRatingofHospitalAchievementPoints string,
OverallRatingofHospitalImprovementPoints string,
OverallRatingofHospitalDimensionScore string,
HCAHPSBaseScore bigint,
HCAHPSConsistencyScore bigint
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\n'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys_responses_raw';
