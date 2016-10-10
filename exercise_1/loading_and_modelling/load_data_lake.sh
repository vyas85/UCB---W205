#Creating the right hdfs folder structure
hdfs dfs -rm -R hospital_compare

hdfs dfs -mkdir hospital_compare
hdfs dfs -mkdir hospital_compare/hospitals_raw
hdfs dfs -mkdir hospital_compare/effective_care_raw
hdfs dfs -mkdir hospital_compare/measures_raw
hdfs dfs -mkdir hospital_compare/surveys_responses_raw

#Reemoving headers
tail -n +2 Hospital_Revised_Flatfiles/hospitals.csv > Hospital_Revised_Flatfiles/hospitals_noheader.csv
tail -n +2 Hospital_Revised_Flatfiles/effective_care.csv > Hospital_Revised_Flatfiles/effective_care_noheader.csv
tail -n +2 Hospital_Revised_Flatfiles/measures.csv > Hospital_Revised_Flatfiles/measures_noheader.csv
tail -n +2 Hospital_Revised_Flatfiles/surveys_responses.csv > Hospital_Revised_Flatfiles/surveys_responses_noheader.csv

#Loading files into hdfs
hdfs dfs -put Hospital_Revised_Flatfiles/hospitals_noheader.csv /user/w205/hospital_compare/hospitals_raw/hospitals.csv
hdfs dfs -put Hospital_Revised_Flatfiles/effective_care_noheader.csv /user/w205/hospital_compare/effective_care_raw/effective_care.csv
hdfs dfs -put Hospital_Revised_Flatfiles/measures_noheader.csv /user/w205/hospital_compare/measures_raw/measures.csv
hdfs dfs -put Hospital_Revised_Flatfiles/surveys_responses.csv /user/w205/hospital_compare/surveys_responses_raw/surveys_responses.csv


