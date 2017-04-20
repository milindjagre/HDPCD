--GROUP OPERATION IN APACHE PIG

--loading weather data in weather relation
weather = LOAD '/hdpcd/input/post15/post15.csv' USING PigStorage(',');

--performing group operation based on station name
--station name is the first column in weather relation, therefore $0
grouped_data = GROUP weather BY $0;

--generating output data with FOREACH...GENERATE command
--output contains station name as the group and rest of the columns in weather relation
output_data = FOREACH grouped_data GENERATE group,weather;

--storing the final output in HDFS
STORE output_data INTO '/hdpcd/output/post15/';
