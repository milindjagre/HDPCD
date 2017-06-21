create table post31 (
id int,
name string,
gender string
)
partitioned by (year int, month int)
row format delimited
fields terminated by ','
stored as textfile;
