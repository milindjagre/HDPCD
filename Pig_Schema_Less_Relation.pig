-- We use LOAD command to load the data into a PIG Relation
-- The absence of the keyword "BY" indicates the schema-less Pig Relation creation

data_without_schema = LOAD '/hdpcd/input/post10/input.csv' USING PigStorage(',');

--Dumping the Pig Relation data_without_schema created in the above line

DESCRIBE data_without_schema;
