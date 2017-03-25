--execute this file by using -useHCatalog flag
--the flag "-useHCatalog" enables Pig to pick jars for HCatalog
--HCatalog is used for loading data from Apache Hive to Pig

--loading the data in "products" hive table into a Pig Relation
hive_data = LOAD 'products' USING org.apache.hive.hcatalog.pig.HCatLoader();

--looking at the structure of the data
DESCRIBE hive_data;

--dumping the data on the terminal window
DUMP hive_data;
