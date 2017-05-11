-- this pig script is going to launch parallel reduce tasks

-- we are using PARALLEL command for doing this

-- data in post21.csv is stored in input_data pig relation using LOAD command
input_data = LOAD '/hdpcd/input/post21/post21.csv' USING PigStorage(',');

-- a SORT operation is performed using ORDER command
-- PARALLEL 6 indicates that this task should be performed with 6 reduce tasks
sorted_data = ORDER input_data BY $6 DESC PARALLEL 6;

-- sorted_data pig relation is stored in HDFS using STORE command
-- since reduce tasks are 6, there should be 6 part files in /hdpcd/output/post21_6 directory
STORE sorted_data INTO '/hdpcd/output/post21_2' USING PigStorage(';');
