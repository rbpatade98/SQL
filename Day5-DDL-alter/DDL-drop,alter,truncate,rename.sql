show databases;
use amazon;
show tables;
select * from customers;

-- drop (deleting db and tables)
drop database az1;
drop schema db2;

create table customers1 as select * from customers; -- subquery
select * from customers1;

create table customers2 as select * from customers; 
select * from customers2;

drop table customers2; -- delete table 
-- drop table customers2;  -- error unknown table

-- truncate (used to remove values/rows/tuples from tables)
select * from customers1;
truncate table customers1; -- or truncate customers1;
select * from customers1; 

-- alter (modify,change,drop,add,rename)
alter table customers add country varchar(20);
desc customers;
select * from customers;

-- alter table customers add newcolname datatype first|after;
-- WAQ to add aadharnum column at first in customers table
alter table customers add aadharnum bigint first;
desc customers;

-- WAQ to add city column before address in customers table
alter table customers add city varchar(20) after mobile;
desc customers;

-- WAQ to add licensenum and age column in customers table
alter table customers add (licensenum int,age int);
desc customers;


-- drop column
alter table customers drop aadharnum;
desc customers;
-- alter table customers drop (address,licensenum,age); -- syntax error
alter table customers drop city;
alter table customers drop licensenum;
alter table customers drop age;

-- modify (changing datatype)
-- WAQ to change datatype of lname to char(50) in customers table.
alter table customers modify lname char(50);
desc customers;
select * from customers;

-- WAQ to change datatype of cid to varchar(50) in customers table.
alter table customers modify cid varchar(50);
desc customers;

-- alter table customers modify fname int; -- error char to int not possible

insert into customers(cid) values('A123');
select * from customers;
-- alter table customers modify cid int; -- error or works with warning (truncate)

-- change(column name change/renaming column name)
-- WQ to change column name dob to dateofbirth into customers table
alter table customers change dob dateofbirth date;

-- WQ to change column name fname to firstname char(50) into customers table
alter table customers change fname firstname char(50);

-- alter rename(renaming table name)
-- WQ to rename table of customers into newcustomers.

alter table customers rename newcustomers; 
desc newcustomers;

-- rename (renaming table name)
-- WQ to rename table of newcustomers into customers.
rename table newcustomers to customers;
desc customers;


