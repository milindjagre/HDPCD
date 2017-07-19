create external table post37 (
id int,
name string,
gender string
)
row format delimited
fields terminated by '\t'
stored as textfile
location '/hdpcd/input/post37/';
