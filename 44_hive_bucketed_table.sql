create table post32 (
id int,
name string,
gender string
)
clustered by (id) into 4 buckets
row format delimited
fields terminated by ','
stored as textfile;
