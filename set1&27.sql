create table product_master( product_no varchar(6) primary key check(product_no like 'p%'),
description varchar(50) not null,
profit_percent numeric (5,2) not null,
unit_measure varchar(10) not null, 
qty_on_hand numeric(8) not null, 
reorder_lvl numeric(8) not null, 
sell_price numeric(8,2) not null check(sell_price<>0),  
cost_price numeric(8,2) check(cost_price <> 0) not null);


create table sales_order ( orderno varchar(10) primary key check (orderno like 'o%'), 
customer_id varchar(10), 
orderdate date not null, 
salesman_id varchar(50), 
delytype char(1) check(delytype in('P','F')),
check(delydate>orderdate),
billyn char(1) not null,
delydate date , 
orderstatus varchar(10) check(orderstatus in ('IP','F','BO','C')));

create table sales_order_details (s_order_no varchar(6) references sales_order(s_order_no),
product_no varchar(6) references product_master(product_no), 
qty_ordered decimal(8), 
qty_displayed decimal (8), 
product_rate decimal(10,2) , 
CONSTRAINT PK_order PRIMARY KEY (s_order_no,product_no));

insert into product_master values('P001','T-shirts',5,'Piece',200,50,350,250);
insert into product_master values('P340','Shirts',7,'Piece',150,50,500,350);
insert into product_master values('P671','Jeans',5,'Piece',100,20,600,450);
insert into product_master values('P885','Trousers',5,'Piece',100,20,750,500);
insert into product_master values('P005','Denim Shirts',2,'Piece',150,50,850,550);

insert into sales_order (orderno,customer_id,orderdate,salesman_id, delytype,billyn,delydate,orderstatus) values('O101','C001','2018-06-12','S001','F','N','2018-06-20','IP');
insert into sales_order (orderno,customer_id,orderdate,salesman_id, delytype,billyn,delydate,orderstatus) VALUES ('O109','C005','2018-06-25','S002','P','N','2018-06-29','C');
insert into sales_order (orderno,customer_id,orderdate,salesman_id, delytype,billyn,delydate,orderstatus) values('O102','C003','2018-08-18','S001','F','Y','2018-08-25','F');
insert into sales_order (orderno,customer_id,orderdate,salesman_id, delytype,billyn,delydate,orderstatus) values('O107','C001','2018-09-25','S005','F','Y','2018-09-30','F');
insert into sales_order (orderno,customer_id,orderdate,salesman_id, delytype,billyn,delydate,orderstatus) 
VALUES ('O188','C005','2018-09-19','S001','P','N','2018-09-22','F');

insert into sales_order_details values('O19001', 'P00001',4,4,525);
insert into sales_order_details values('O19001','P07965',2, 1, 8400);
insert into sales_order_details values('O19001','P07885',2 ,1, 5250);
insert into sales_order_details values('O19002','P00001',10 ,0, 525);
insert into sales_order_details values('O46865','P07868', 3 ,3, 3150);
insert into sales_order_details values('O46865','P07885',3 ,1, 5250);
insert into sales_order_details values('O46865' ,'P00001',10 ,10, 525);
insert into sales_order_details values('O46865','P03453', 4 ,4, 1050);
insert into sales_order_details values('O19003' ,'P03453', 2 ,2, 1050);
insert into sales_order_details values('O19003' ,'P06734', 1 ,1, 12000);
insert into sales_order_details values('O46866' ,'P07965', 1 ,0, 8400);
insert into sales_order_details values('O46866' ,'P07975', 1 ,0, 1050);
insert into sales_order_details values('O10008' ,'P00001', 10, 5, 525);
insert into sales_order_details values('O10008' ,'P07975', 5 ,3 ,1050);

Q1. List all the products whose description is Shirts
SELECT * FROM product_master where description='Shirts';

Q2. Add a column ‘Contact_No’ of data type ‘number’ and size’10’ to sales_order table
 alter table sales_order
 add contact_no numeric(10);
 
Q3. Find the minimum and maximum sell price of products.
SELECT MIN(sell_price) AS smallest_price
FROM product_master;

SELECT MAX(sell_price) AS largest_price
FROM product_master;

Q4. Find the product_no and description of moving products -use joins

