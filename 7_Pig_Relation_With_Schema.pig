--We use LOAD command to load data into a PIG Relation
--The keyword "AS" indicates the Pig Relation creation with a defined schema

data_with_schema = LOAD '/hdpcd/input/post11/input.csv' USING PigStorage(',') AS (station_name:chararray, year:int, month:int, dayofmonth:int, precipitation:int, maxtemp:int, mintemp:int);

--Dumping the structure of the Pig Relation "data_with_schema" created in the above line

DESCRIBE data_with_schema;

--Dumping the actual data stored in Pig Relation "data_with_schema"

DUMP data_with_schema;
