# SQL EndSem 
Inforamtion Technology SEM 3 Mumbai University REV C-19
<br>
[Sample Questions](assignment.pdf)
<br>[Solutions](ANSWERS.md)

## Basic Structure

Function

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

Procedure IN

```sql
DELIMITER $$

CREATE PROCEDURE findBalance(IN Bal int)
BEGIN
SELECT * FROM Customer_info WHERE Balance=Bal;
END
$$

DELIMITER ;

Call findBalance(10000);
```

Procedure OUT

```sql
DELIMITER $$
CREATE PROCEDURE findMinBalance(OUT Min int)
BEGIN
SELECT MIN(BALANCE) INTO Min FROM Customer_info;
END
$$
DELIMITER ;

Call findMinBalance(@MinBal);
SELECT @MinBal;
```

Join

```sql
SELECT product_master.description,sales_order_details.product_no
FROM product_master
INNER JOIN sales_order_details
ON product_master.product_no = sales_order_details.product_no;
```

Trigger Uppercase

```sql
create trigger tg 
before insert on salesman_detail
for each row 
begin
set new.name = upper(new.name);
end;
$$
delimiter ;
```

Trigger Audit

```sql
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
```

Cursor

```sql
TODO
```
