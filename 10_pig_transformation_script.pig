--this file is used for data transformation using Apache Pig
--we will load the data from post13.txt file and transform it

--LOAD command is used for loading the data in input_data pig relation
input_data = LOAD '/hdpcd/input/post13/post13.txt' USING PigStorage(',');

--input_data pig relation is transformed and we extract only
--first name, location and the program from the original input
flat_data = FOREACH input_data GENERATE $1 as fname, $3 as location, $5 as program;

--at last, we print the flat_data pig relation for confirmation
--DUMP command is used for printing the pig relation contents to the terminal window
dump flat_data;
