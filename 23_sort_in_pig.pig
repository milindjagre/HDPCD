-- this pig script is used to demonstrate the SORT operation in Apache Pig

-- LOAD command is used for storing the data in input file post19.csv into a pig relation input_data
-- a custom schema is also passed along with LOAD command
input_data = LOAD '/hdpcd/input/post19/post19.csv' USING PigStorage(',') AS (station_name:chararray, year:int, month:int, dayofmonth:int, precipitation:int, maxtemp:int, mintemp:int);

-- ORDER command is used for performing the SORT operation
-- DESC keyword makes sure that this SORT operation is in descending order
sorted_data = ORDER input_data BY maxtemp DESC;

-- finally storing this output sorted_data relation into an HDFS directory
STORE sorted_data INTO '/hdpcd/output/post19';
