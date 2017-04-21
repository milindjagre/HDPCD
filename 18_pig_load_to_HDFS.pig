--Storing the data into HDFS

--loading the data in input_data relation
input_data = LOAD '/hdpcd/input/post17/post17.txt' USING PigStorage() AS (line:chararray);

--storing the loaded data in HDFS
STORE input_data INTO '/hdpcd/output/post17';
