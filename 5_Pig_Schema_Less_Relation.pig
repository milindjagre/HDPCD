--We use LOAD command to load data into a PIG Relation
--The absence of the keyword "AS" indicates the schema-less Pig Relation creation

data_without_schema = LOAD '/hdpcd/input/post10/input.csv' USING PigStorage(',');

--Dumping the structure of Pig Relation "data_without_schema" created in the above line

DESCRIBE data_without_schema;

--Dumping the data stored in Pig Relation "data_without_schema"

DUMP data_without_schema;
