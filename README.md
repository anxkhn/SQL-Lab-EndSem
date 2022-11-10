### Set 2 & Set 28 :-

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


