-- this pig script demonstrates how to invoke an UDF in Apache PIG

-- LOAD command is used to load data from post27.csv into input_data pig relation
input_data = LOAD '/hdpcd/input/post27/post27.csv' USING PigStorage(',');

-- we need to register the jar file first with REGISTER command
REGISTER /usr/hdp/2.3.0.0-2557/pig/piggybank.jar;

-- defining an alias for the fully qualified class name UPPER
DEFINE upper org.apache.pig.piggybank.evaluation.string.UPPER;

-- invoking upper ALIAS for UPPER() function in piggybank.jar file
-- only first name and last name is extracted from this input file into upper_data pig relation
upper_data = FOREACH input_data GENERATE upper($1) as fname, upper($2) as lname;

-- STORE command is used to store upper_data in HDFS directory /hdpcd/output/post27
STORE upper_data INTO '/hdpcd/output/post27' USING PigStorage(' ');
