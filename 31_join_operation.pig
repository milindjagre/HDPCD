--JOIN OPERATION IN APACHE PIG

--loading customers' data in customers relation
customers = LOAD '/hdpcd/input/post22/post22_customers.csv' USING PigStorage(',');

--loading orders' data in orders relation
orders = LOAD '/hdpcd/input/post22/post22_orders.csv' USING PigStorage(',');

--performing join operation based on customer ID
--customer ID is the first column in customers relation, therefore $0
--customer ID is the third column in orders relation, therefore $2
joined_data = JOIN customers BY $0, orders BY $2;

--generating output data with FOREACH...GENERATE command
--output contains customers' first name, last name, order ID, and payment status of the order
output_data = FOREACH joined_data GENERATE $1 AS fname, $2 AS lname, $8 AS orderid,$12 AS payment_status;

--storing the final output in HDFS
STORE output_data INTO '/hdpcd/output/post22/';
