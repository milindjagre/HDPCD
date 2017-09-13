create table post50 (
order_id int,
order_date string,
order_amt int,
order_status string
)
row format delimited 
fields terminated by ','
stored as textfile;
