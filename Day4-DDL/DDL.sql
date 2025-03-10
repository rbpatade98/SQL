create schema amazon;
show databases;
create database az1;
-- Tables customers,products,orders,carts,payments
-- customers(cid,fname,lname,gender,dob,email,mobile,address)
use amazon;
create table customers
(
cid int,
fname char(20),
lname char,
gender char(10),
dob date,
email varchar(30),
mobile int,
address varchar(50)
);

desc customers;
show tables;


-- products (pid,pname,category,modelnum,price,qty,manfdate)
create table products
(
pid int,
pname varchar(30),
category varchar(30),
modelnum int,
price float,
qty int,
manfdate date
);
desc products;

-- orders (oid int,cid int,pid int,orderdatetime datetime,qty int,totalprice decimal(8,2)
create table orders
(
oid int,
cid int,
pid int,
orderdatetime datetime,
qty int,
totalprice decimal(8,2)
);
desc orders;

-- insert
insert into customers(cid,fname,lname,gender,dob,email,mobile,address)
values(1,'komal','g','female','2000-09-02','k@gmail.com',1297797899,'malad');
select * from customers;

insert into customers(cid,fname,gender,email)
values(2,'rohit','maler','dsfdfs');
select * from customers;
desc customers;

-- insert into customers values('meena','k','dsfd','2003-08-06','m@gmail.com',2,1232434,'vasai'); --error data type
-- insert into customers values(2,'meena','k','dsfd','2003-08-06','m@gmail.com',1232434); -- error column count
insert into customers values(2,'meena','k',null,null,'m@gmail.com',1232434,null);
select * from customers;

insert into customers values();
select * from customers;
insert into customers values
(3,'abhi','z',null,null,null,576576,null),
(4,'raj',null,'male',null,null,576576,'virar'),
(5,'pooja',null,'female',null,null,576576,'dadar');
select * from customers;







