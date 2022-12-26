# Set 2 & Set 28 :-

### Customer_Info

Create Table

```sql
CREATE TABLE Customer_Info (
  Customer_id varchar(10) PRIMARY KEY, 
  Name varchar(10) NOT NULL,
  City varchar(10), 
  Pincode numeric(8), 
  State varchar(15), 
  Balance numeric(10, 2),
  CHECK (Customer_id like 'C%')
);
```

Alter Table

```sql
ALTER TABLE Customer_Info
MODIFY COLUMN Name varchar(25) NOT NULL;
```

Insert Queries

```sql
INSERT INTO Customer_Info VALUES ('C001','Shamakant Navathe','Mumbai',400050,'Maharashtra',100000.00);
INSERT INTO Customer_Info VALUES ('C002','Namita Murty','Bangalore',560001,'Karnataka',35000.00);
INSERT INTO Customer_Info VALUES ('C003','Kartik Mahadevan','Mumbai',400030,'Maharashtra',90000.00);
INSERT INTO Customer_Info VALUES ('C004','Monisha mehta','Manglore',560050,'Karnataka',45000.00);
INSERT INTO Customer_Info VALUES ('C005','Amit Desai','Chennai',780001,'Tamil Nadu',85000.00);
```

Delete Row

```sql
DELETE FROM Customer_Info WHERE Customer_id = 'C003';
```

### sales_order

Create Table

```sql
CREATE TABLE sales_order
(orderno varchar(10) PRIMARY KEY CHECK(orderno like 'O%'),
Customer_id varchar (10) REFERENCES Customer_info(Customer_id),
orderdate date NOT NULL,
delyaddress varchar(15),
Salesman_id varchar(10),
delytype char(1) check(delytype IN ('P','F')),
billyn char(1),
delydate date,
check(delydate > orderdate),
Orderstatus varchar (10) check (Orderstatus IN ('IP','F','BO','C'))
);
```

Insert Into 

```sql
INSERT INTO sales_order VALUES ('O101','C001','2018-06-12',NULL,'S001','F','N','2018-06-20','IP');
INSERT INTO sales_order VALUES ('O109','C005','2018-06-25',NULL,'S002','P','N','2018-06-29','C');
INSERT INTO sales_order VALUES ('O102','C003','2018-08-18',NULL,'S001','F','Y','2018-08-25','F');
INSERT INTO sales_order VALUES ('O107','C001','2018-09-25',NULL,'S005','F','Y','2018-09-30','F');
INSERT INTO sales_order VALUES ('O188','C005','2018-09-19',NULL,'S001','P','N','2018-09-22','F');
```

Q1. Retrieve the list of names, city, and State of all the Customers

```sql
SELECT Name,City,State from Customer_Info;
```

Q2. Change the name of Customer_info to Customer_Details

```sql
ALTER TABLE Customer_info RENAME TO Customer_Details;
```

Q3. Find the count of all the customers

```sql
SELECT COUNT(*) FROM Customer_Details;
```

Q4. Find the Customer name,city and pincode who as placed order no ‘O109’-use nested queries

```sql
Select Name,City,Pincode from Customer_Details WHERE Customer_id IN (SELECT Customer_id from sales_order WHERE orderno ='O109');
```

# Set 05 & Set 31:-

Q1: Create table employee ( eid, ename, address, city, pincode, salary)
Constraints: First letter of eid must start with ‘E’, ename should Not Null.
Create Table

```sql
CREATE TABLE employee (
  eid varchar(6) PRIMARY KEY, 
  ename varchar(10) NOT NULL,
  address varchar(25), 
  city varchar(10), 
  pincode numeric(6), 
  salary numeric(10, 2),
  CHECK (eid like 'E%')
);
```

Q2 : Insert suitable values.

```sql
INSERT INTO employee VALUES ('EMP001','Anas Khan','Mira Road','Mumbai',401107,100000.00);
INSERT INTO employee VALUES ('EMP002','Ayesha N','Mumbai Central','Mumbai',400008,500000.00);
INSERT INTO employee VALUES ('EMP003','Ninad Naik','Andheri','Mumbai',400069,100000.00);
INSERT INTO employee VALUES ('EMP004','Edward Blu','OpenSea','NFT Land',100000,5000.00);
```

Q3 : Create function that set the credit level to either ‘Platinum, Silver, Gold’ based on salary earned.

```sql
DELIMITER $$
CREATE FUNCTION CheckLevel(salary int) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE stat VARCHAR(20);
    IF salary > 200000 THEN
        SET stat = 'Platinum';
    ELSEIF (salary >= 10000 AND 
            salary <= 200000) THEN
        SET stat = 'Gold';
    ELSEIF salary < 10000 THEN
        SET stat = 'Silver';
    END IF;
    RETURN (stat);
END $$
DELIMITER ;
```

> Used creative liberty here.
> Calling The Function *(to demonstrate)* :-

```sql
SELECT *,CheckLevel(salary) AS STATUS FROM employee;
```

# Set 03 & Set 29:-

Q : Create table sales_order_details (s_order_no, product_no,qty_ordered,qty_disp,product_rate)
Constraints: First letter of s_order_no must start with ‘O’, First letter of product_no must start with ‘P’,
Create Table 

```sql
CREATE TABLE sales_order (
  s_order_no varchar(6) PRIMARY KEY, 
  product_no varchar(6) NOT NULL,
  qty_ordered numeric(6), 
  qty_disp numeric(6), 
  product_rate numeric(10, 2),
  CHECK (s_order_no like 'O%'),
  CHECK (product_no like 'P%')
);
```

Insert Into

```sql
INSERT INTO sales_order VALUES ('OR1610','P11212',5,2,500.00);
INSERT INTO sales_order VALUES ('OR1121','P11112',10,5,10000.00);
INSERT INTO sales_order VALUES ('OR7841','P00008',15,10,1500.00);
INSERT INTO sales_order VALUES ('OR0007','P00067',20,10,25000.00);
```

Q : Create function that set the rate level to either ‘Cheap, Moderate, Expensive’ based on product_rate.
RateCheck Function

```sql
DELIMITER $$
CREATE FUNCTION RateCheck(product_rate int) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE stat VARCHAR(20);
    IF product_rate > 20000 THEN
        SET stat = 'Expensive';
    ELSEIF (product_rate >= 5000 AND 
            product_rate <= 20000) THEN
        SET stat = 'Moderate';
    ELSEIF product_rate < 5000 THEN
        SET stat = 'Cheap';
    END IF;
    RETURN (stat);
END $$
DELIMITER ;
```

MISC : Deleting a user defined function

```sql
DROP FUNCTION FunctionName;
DROP FUNCTION RateCheck;
```

Calling The Function *(to demonstrate)* :-

```sql
SELECT *,RateCheck(product_rate) AS Rate FROM sales_order;
```

# Set 08 & Set 34:-

Customer_Info

Create Table

```sql
CREATE TABLE Customer_Info (
  Customer_id varchar(10) PRIMARY KEY, 
  Name varchar(10) NOT NULL,
  City varchar(10), 
  Pincode numeric(8), 
  State varchar(15), 
  Balance numeric(10, 2),
  CHECK (Customer_id like 'C%')
);
```

Alter Table

```sql
ALTER TABLE Customer_Info
MODIFY COLUMN Name varchar(25) NOT NULL;
```

Insert Queries

```sql
INSERT INTO Customer_Info VALUES ('C001','Shamakant Navathe','Mumbai',400050,'Maharashtra',100000.00);
INSERT INTO Customer_Info VALUES ('C002','Namita Murty','Bangalore',560001,'Karnataka',35000.00);
INSERT INTO Customer_Info VALUES ('C003','Kartik Mahadevan','Mumbai',400030,'Maharashtra',90000.00);
INSERT INTO Customer_Info VALUES ('C004','Monisha mehta','Manglore',560050,'Karnataka',45000.00);
INSERT INTO Customer_Info VALUES ('C005','Amit Desai','Chennai',780001,'Tamil Nadu',85000.00);
```

### sales_order

Create Table

```sql
CREATE TABLE sales_order
(orderno varchar(10) PRIMARY KEY CHECK(orderno like 'O%'),
Customer_id varchar (10) REFERENCES Customer_info(Customer_id),
orderdate date NOT NULL,
delyaddress varchar(15),
Salesman_id varchar(10),
delytype char(1) check(delytype IN ('P','F')),
billyn char(1),
delydate date,
check(delydate > orderdate),
Orderstatus varchar (10) check (Orderstatus IN ('IP','F','BO','C'))
);
```

Insert Into

```sql
INSERT INTO sales_order VALUES ('O101','C001','2018-06-12',NULL,'S001','F','N','2018-06-20','IP');
INSERT INTO sales_order VALUES ('O109','C005','2018-06-25',NULL,'S002','P','N','2018-06-29','C');
INSERT INTO sales_order VALUES ('O102','C003','2018-08-18',NULL,'S001','F','Y','2018-08-25','F');
INSERT INTO sales_order VALUES ('O107','C001','2018-09-25',NULL,'S005','F','Y','2018-09-30','F');
INSERT INTO sales_order VALUES ('O188','C005','2018-09-19',NULL,'S001','P','N','2018-09-22','F');
```

Q1. List all the customers who stay in ‘Mumbai’ and ‘Chennai’.

```sql
SELECT Name,City FROM Customer_info WHERE City="Mumbai" OR City="Chennai";
```

Q2. List the customers whose names contain with letters ‘am’.

```sql
SELECT * FROM Customer_info WHERE (Name LIKE '%am%');
```

Q3. Change the Balance of Customer_id ‘C002’ to 89000.00

```sql
UPDATE Customer_info
SET balance = 89000.00
WHERE customer_id = 'C002';
```

Q4. Find the minimum balance of customers.

```sql
SELECT Name,MIN(balance) AS Balance
FROM Customer_info;
```

Q5. Create a view on a table in such a way that view contains orderno, Customer_id and orderdate.

Creating :

```sql
CREATE VIEW myView AS
SELECT orderno, Customer_id, orderdate
FROM Sales_order;
```

Displaying

```sql
SELECT * FROM myView;
```

# Set 12 & Set 38 :-

### Table – Worker

Create Table

```sql
CREATE TABLE Worker (
 Worker_id numeric(10) PRIMARY KEY, 
FIRST_NAME varchar(10) NOT NULL,
 LAST_NAME varchar(10),
 SALARY numeric(10), 
JOINING_DATE date, 
State varchar(15), 
DEPARTMENT varchar(10)
);
```

Insert Into

```sql
INSERT INTO Worker VALUES (1,'Monika','Arora',100000,'2014-02-20',NULL,'HR');
INSERT INTO Worker VALUES (2,'Niharika','Verma',80000,'2014-06-11',NULL,'Admin');
INSERT INTO Worker VALUES (3,'Vishal','Singhal',300000,'2014-02-20',NULL,'HR');
INSERT INTO Worker VALUES (4,'Amitabh','Singh',500000,'2014-02-20',NULL,'Admin');
INSERT INTO Worker VALUES (5,'Vivek','Bhati',500000,'2014-06-11',NULL,'Admin');
INSERT INTO Worker VALUES (6,'Vipul','Diwan',200000,'2014-06-11',NULL,'Account');
INSERT INTO Worker VALUES (7,'Satish','Kumar',75000,'2014-01-20',NULL,'Account');
INSERT INTO Worker VALUES (8,'Geetika','Chauhan',90000,'2014-04-11',NULL,'Admin');
```

### Table – Bonus

Create Table

```sql
CREATE TABLE Bonus (
  Worker_id numeric(10) REFERENCES Worker(Worker_id),  
  BONUS_DATE date, 
  BONUS_AMOUNT numeric(10,2)
);
```

Insert Into

```sql
INSERT INTO Bonus VALUES (1,'2016-02-20',5000);
INSERT INTO Bonus VALUES (2,'2016-02-11',3000);
INSERT INTO Bonus VALUES (3,'2016-02-20',4000);
INSERT INTO Bonus VALUES (1,'2016-02-20',4500);
INSERT INTO Bonus VALUES (2,'2016-02-11',3500);
```

### Table – Title

Create Table 

```sql
CREATE TABLE Title (
  Worker_id numeric(10) REFERENCES Worker(Worker_id),  
  WORKER_TITLE varchar(15), 
  AFFECTED_FROM date
);
```

Insert Into

```sql
INSERT INTO Title VALUES (1,'Manager','2016-02-20');
INSERT INTO Title VALUES (2,'Executive','2016-02-11');
INSERT INTO Title VALUES (8,'Executive','2016-02-11');
INSERT INTO Title VALUES (5,'Manager','2016-02-11');
INSERT INTO Title VALUES (4,'Asst. Manager','2016-02-11');
INSERT INTO Title VALUES (7,'Executive','2016-02-11');
INSERT INTO Title VALUES (6,'Lead','2016-02-11');
INSERT INTO Title VALUES (3,'Lead','2016-02-11');
```



Q1. Write an SQL query to fetch “FIRST_NAME” from Worker table

```sql
SELECT FIRST_NAME from Worker;
```

Q2. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

```sql
SELECT FIRST_NAME from Worker ORDER BY FIRST_NAME ASC;
```

Q3. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

```sql
SELECT * from Worker WHERE FIRST_NAME IN ('Vipul','Satish');
```

Q4. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

```sql
SELECT * from Worker WHERE DEPARTMENT='Admin';
```

Q5 Write an SQL query to fetch the no. of workers for each department in the descending order.

```sql
SELECT DEPARTMENT, count(WORKER_ID) AS No_Of_Workers FROM Worker GROUP BY DEPARTMENT ORDER BY No_Of_Workers DESC;
```



# Set 13 & Set 39:-

### Table – Worker

Create Table

```sql
CREATE TABLE Worker (
 Worker_id numeric(10) PRIMARY KEY, 
FIRST_NAME varchar(10) NOT NULL,
 LAST_NAME varchar(10),
 SALARY numeric(10), 
JOINING_DATE date, 
State varchar(15), 
DEPARTMENT varchar(10)
);
```

Insert Into

```sql
INSERT INTO Worker VALUES (1,'Monika','Arora',100000,'2014-02-20',NULL,'HR');
INSERT INTO Worker VALUES (2,'Niharika','Verma',80000,'2014-06-11',NULL,'Admin');
INSERT INTO Worker VALUES (3,'Vishal','Singhal',300000,'2014-02-20',NULL,'HR');
INSERT INTO Worker VALUES (4,'Amitabh','Singh',500000,'2014-02-20',NULL,'Admin');
INSERT INTO Worker VALUES (5,'Vivek','Bhati',500000,'2014-06-11',NULL,'Admin');
INSERT INTO Worker VALUES (6,'Vipul','Diwan',200000,'2014-06-11',NULL,'Account');
INSERT INTO Worker VALUES (7,'Satish','Kumar',75000,'2014-01-20',NULL,'Account');
INSERT INTO Worker VALUES (8,'Geetika','Chauhan',90000,'2014-04-11',NULL,'Admin');
```

### Table – Bonus

Create Table

```sql
CREATE TABLE Bonus (
  Worker_id numeric(10) REFERENCES Worker(Worker_id),  
  BONUS_DATE date, 
  BONUS_AMOUNT numeric(10,2)
);
```

Insert Into

```sql
INSERT INTO Bonus VALUES (1,'2016-02-20',5000);
INSERT INTO Bonus VALUES (2,'2016-02-11',3000);
INSERT INTO Bonus VALUES (3,'2016-02-20',4000);
INSERT INTO Bonus VALUES (1,'2016-02-20',4500);
INSERT INTO Bonus VALUES (2,'2016-02-11',3500);
```

### Table – Title

Create Table

```sql
CREATE TABLE Title (
  Worker_id numeric(10) REFERENCES Worker(Worker_id),  
  WORKER_TITLE varchar(15), 
  AFFECTED_FROM date
);
```

Insert Into

```sql
INSERT INTO Title VALUES (1,'Manager','2016-02-20');
INSERT INTO Title VALUES (2,'Executive','2016-02-11');
INSERT INTO Title VALUES (8,'Executive','2016-02-11');
INSERT INTO Title VALUES (5,'Manager','2016-02-11');
INSERT INTO Title VALUES (4,'Asst. Manager','2016-02-11');
INSERT INTO Title VALUES (7,'Executive','2016-02-11');
INSERT INTO Title VALUES (6,'Lead','2016-02-11');
INSERT INTO Title VALUES (3,'Lead','2016-02-11');
```

Q1. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

```sql
SELECT FIRST_NAME from Worker WHERE FIRST_NAME LIKE '_____h';
```

Q2 Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

```sql
SELECT * from Worker WHERE SALARY BETWEEN 100000 AND 500000;
```

Q3. Write an SQL query to fetch the count of employees working in the department ‘Account’.

```sql
SELECT DEPARTMENT, count(WORKER_ID) AS No_Of_Workers FROM Worker Where DEPARTMENT='Account';
```

Q4. Write an SQL query to print details of the Workers who are also Managers.

```sql
SELECT * FROM Worker WHERE WORKER_ID IN (SELECT WORKER_ID FROM TITLE WHERE WORKER_TITLE='Manager');
```

Q5. Describe Bonus Table

```sql
DESCRIBE Bonus;
```

# Set 1 & Set 27:-

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

-- insert into product_master values('P001','T-shirts',5,'Piece',200,50,350,250);
-- insert into product_master values('P340','Shirts',7,'Piece',150,50,500,350);
-- insert into product_master values('P671','Jeans',5,'Piece',100,20,600,450);
-- insert into product_master values('P885','Trousers',5,'Piece',100,20,750,500);
-- insert into product_master values('P005','Denim Shirts',2,'Piece',150,50,850,550);

-- modified ones are here.

insert into product_master values('P00001','T-shirts',5,'Piece',200,50,350,250);
insert into product_master values('P00340','Shirts',7,'Piece',150,50,500,350);
insert into product_master values('P00671','Jeans',5,'Piece',100,20,600,450);
insert into product_master values('P00885','Trousers',5,'Piece',100,20,750,500);
insert into product_master values('P00005','Denim Shirts',2,'Piece',150,50,850,550);

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

select description,sell_price from product_master where sell_price in (select  max(sell_price) from product_master);

Q4. Find the product_no and description of moving products -use joins

SELECT product_master.description,sales_order_details.product_no
FROM product_master
INNER JOIN sales_order_details
ON product_master.product_no = sales_order_details.product_no;

# Set 4 & Set 30:-


create table person
(
fname char(10),
lname char(10),
id decimal(8) primary key
);

insert into person values ('leena','kirtikar',43);
insert into person values ('aakash','kapadia',38);
insert into person values ('parth','shroff',63);

select * from person;

create table audit_log
(
ofname char(10),
olname char(10),
nfname char(10),
nname char(10),
cwhen date
);

delimiter $$
create trigger t2
after update on person
for each row
begin
insert into audit_log
values(old.fname,old.lname,new.fname,new.lname,curdate()
);
end $$
delimiter ;

update person set fname='anish' where id like 43;
update person set fname='anvay' where id like 63;
update person set fname='aman' where id like 38;
select * from audit_log;

# Set 10 & Set 36:-

CREATE TABLE Salesman_detail (
  Salesman_id varchar(10) PRIMARY KEY, 
  Name varchar(10) NOT NULL,
  Address varchar(10),
  City varchar(10), 
  Pincode numeric(8), 
  State varchar(15), 
  Saleamt numeric(8, 2),
  Tgttoget numeric(6, 2),
  Ytdsales numeric(6, 2) NOT NULL,
  Remarks varchar(50),
  check(Saleamt<>0),
  check(Tgttoget<>0)
);

INSERT INTO Salesman_detail VALUES ('S001','Aditya','Bandra','Mumbai',400050,'Maharashtra',3000,100,50,'good');
INSERT INTO Salesman_detail VALUES ('S002','Rohan','Khar','Mumbai',400051,'Maharashtra',3000,200,100,'good');
INSERT INTO Salesman_detail VALUES ('S003','Anish','Borivali','Mumbai',400054,'Maharashtra',3000,200,100,'good');
INSERT INTO Salesman_detail VALUES ('S004','Abhay','Sanpada','Mumbai',400045,'Maharashtra',3500,200,100,'good');
INSERT INTO Salesman_detail VALUES ('S005','Roshan','Bandra','Mumbai',400050,'Maharashtra',3000,200,150,'good');

Q1. Implement trigger on Salesman_detail table to change name attribute to upper case
delimiter $$
create trigger tg 
before insert on salesman_detail
for each row 
begin
set new.name= upper(new.name);
end;
$$
delimiter ;

insert into salesman_detail values ('S006','Ayesha','Bandra','Mumbai',400008,'Maharashta',3000,100,60,'good');

Q2. Copy the table Salesman_detail as sd
create table sd like salesman_detail;
insert into sd select* from salesman_detail;
select * from sd;

Q3. Alter the table by adding a column salary
alter table salesman_detail 
add column salary numeric(6);

Q4. Describe the table Salesman_detail
describe Salesman_detail;

# MISC

12. Retrieve total salary of employee which is greater than >120000
Divide the cost of product '540 HDD' by difference between its price and 100.

Q: Find the products and their quantities for the orders placed by 'Vandana Saitwal' and 'Ivan Bayross'

select name,description,qty_ordered from client_master,product_master,sales_order,sales_order_details where name in('Ivan Bayross','Vandana Saitwal') and client_master.client_no = sales_order.client_no and sales_order.order_no = sales_order_details.order_no and sales_order_details.product_no = product_master.product_no;

Q: Print the description and total qty sold for each product

 select description,sum(qty_ordered) from product_master,sales_order_details WHERE sales_order_details.product_no = product_master.product_no group by description;


### [Link to questions](assignment.pdf)
