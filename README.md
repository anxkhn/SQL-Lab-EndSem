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
INSERT INTO Customer_Info VALUES ('C005','Amit Desai','Chenna',780001,'Tamil Nadu',85000.00);
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
INSERT INTO sales_order VALUES ('O107','C001','2018-09-25',NULL,'S001','F','Y','2018-09-30','F');
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



Calling The Function *(to demonstrate)* :-

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


