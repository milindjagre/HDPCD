--data transformation for matching schema with hive table
--LOAD command is used to load the data present in post14.csv file into input_data pig relation
--three columns are created while loading the data i.e. name, dob, and location
input_data = LOAD '/hdpcd/input/post14/post14.csv' USING PigStorage(',') AS (name:chararray, dob:chararray, location:chararray);

--actual data transformation operation starts now
--INPUT DATA: Milind Jagre,04/23/1991,Hartford CT US
--EXPACTED OUTPUT DATA: Milind,Jagre,4,23,1991,Hartford,CT,US
--name field is splitted into First Name and Last Name
--dob field is splitted into Month, Day, and Year for creating a clear segragation about the date fields
--location field splitted into city, state, and country for creating a clear segragation about the geographical fields
hive_data = FOREACH input_data GENERATE SUBSTRING(name, 0, INDEXOF(name, ' ', 0)) as fname,TRIM(SUBSTRING(name, INDEXOF(name, ' ', 0),100)) as lname,SUBSTRING(dob,0,2) as month,GetDay(ToDate(dob,'mm/dd/yyyy')) as day,GetYear(ToDate(dob,'mm/dd/yyyy')) as year,SUBSTRING(location, 0, INDEXOF(location, ' ', 0)) as city,TRIM(SUBSTRING(location, INDEXOF(location, ' ', 0), INDEXOF(location, ' ', 0)+3)) as state,TRIM(SUBSTRING(location, INDEXOF(location, ' ', 0)+3, INDEXOF(location, ' ', 0)+6)) as country;

--once we create schema required for hive table, we must store it in HDFS
--the data is delimited by tab character and directory is /hdpcd/output/post14
STORE hive_data INTO '/hdpcd/output/post14' USING PigStorage('\t');
