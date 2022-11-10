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
