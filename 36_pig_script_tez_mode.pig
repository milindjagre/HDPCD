-- this pig script is used for demonstrating TEZ execution mode

-- the script is quite straightforward
-- the execution mode is enabled while running the script

-- loading the data from input post24.txt file into pig relation input_data
input_data = LOAD '/hdpcd/input/post24/post24.txt' USING PigStorage();

-- storing this input_data into output HDFS directory
STORE input_data INTO '/hdpcd/output/post24';

-- this script should be executed with the following command
-- "pig -x tez post24.pig"
