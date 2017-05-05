-- this pig script is used for storing the data in pig relation into a hive table

-- loading the data in the input file into a pig relation with the custom schema
-- this custom schema is used for constructing the hive table
input_data = LOAD '/hdpcd/input/post18/post18.csv' USING PigStorage(',') AS (station_name:chararray, year:int, month:int, dayofmonth:int, precipitation:int, temperature_max:int, temperature_min:int);

-- storing the input_data pig relation data into a hive table called sfo_weather using HCatalog
STORE input_data INTO 'sfo_weather' USING org.apache.hive.hcatalog.pig.HCatStorer();
