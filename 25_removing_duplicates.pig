-- this file is used for removing the duplicate tuples from a pig relation

-- LOAD command is used for loading the data in input file to input_data pig relation
-- we are not passing any custom schema in this case
input_data = LOAD '/hdpcd/input/post20/post20.csv' USING PigStorage(',');

-- DISTINCT command is used removing the duplicate tuples from the pig relation
-- output is stored in unique_data pig relation
unique_data = DISTINCT input_data;

-- final output is stored in 
STORE unique_data INTO '/hdpcd/output/post20';
