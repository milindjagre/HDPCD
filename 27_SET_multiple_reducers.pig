-- this pig script is going to launch parallel reduce tasks

-- we are using SET command for doing this
-- below line launches 4 reducer tasks for doing an operation
SET default_parallel 4

-- data in post21.csv is stored in input_data pig relation using LOAD command
input_data = LOAD '/hdpcd/input/post21/post21.csv' USING PigStorage(',');

-- a SORT operation is performed using ORDER command
-- output of this command is stored in sorted_data pig relation
sorted_data = ORDER input_data BY $6 DESC;

-- sorted_data pig relation is stored in HDFS using STORE command
-- since reduce tasks are 4, there should be 4 part files in /hdpcd/output/post21_1 directory
STORE sorted_data INTO '/hdpcd/output/post21_1' USING PigStorage(':');
