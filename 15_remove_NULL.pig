--Removing records with NULL values in pig relation

--loading the data in input_data relation
input_data = LOAD '/hdpcd/input/post16/post16.csv' USING PigStorage() AS (line:chararray);

--performing filter operation to remove records with NULL values
filtered_data = FILTER input_data BY line IS NOT NULL;

--storing the final output in HDFS
STORE filtered_data INTO '/hdpcd/output/post16';
