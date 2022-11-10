
delimiter $$
create table person
(
fname char(10),
lname char(10),
id decimal(8) primary key
);
$$

insert into person values ('leena','kirtikar',43);
$$
insert into person values ('aakash','kapadia',38);
$$
insert into person values ('parth','shroff',63);
$$

select * from person;
$$

create table audit_log
(
ofname char(10),
olname char(10),
nfname char(10),
nname char(10),
cwhen date
);
$$

delimiter $$
create trigger t2
after update on person
for each row
begin
insert into audit_log
values(old.fname,old.lname,new.fname,new.lname,curdate()
);
end;
$$


update person set fname='anish' where id like 43;$$
update person set fname='anvay' where id like 63;$$
update person set fname='aman' where id like 38;$$
select * from audit_log;
$$
