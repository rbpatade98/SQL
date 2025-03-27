use amazon;
select * from student;
desc student;
select * from projects;
desc projects;


create database exampledb;
use exampledb;
create table customers
(
cid int primary key,
cname char(10),
dob date,
address varchar(20),
phno int
);
show tables;
desc customers;
select * from customers;
insert into customers values(1,'rahul','2005-12-5','malad',2035345345);
insert into customers values(2,'seema','2006-10-6','borivali',55345345);
insert into customers values(3,'reema','2000-5-7','vasai',3445345);
insert into customers values(4,'raj','2001-2-3','malad',4345345);
insert into customers values(5,'aakash',null,null,95345345);
select * from customers;


create table orders
(
oid int primary key,
orderdate date,
cid int,
amount float,
qty int,
foreign key(cid) references  customers(cid)
);

insert into orders values(101,'2023-5-5',1,300,2);
insert into orders values(102,'2023-4-4',1,4000,4);
insert into orders values(103,'2023-6-5',2,2000,2);
insert into orders values(104,'2023-7-8',4,1000,5);
insert into orders values(105,'2023-7-8',null,1000,5);
select * from orders;



-- Inner Join
-- Syntax
-- select t1.col1,table2.col1 from table1 t1(aliasname) inner join table2 t2 on condition

-- 	WQ to find customers who placed an order
select c.cid,c.cname,o.oid,o.qty from customers c inner join orders o on c.cid=o.cid; -- on clause
-- OR
select customers.cid,cname,oid,qty from customers inner join orders on customers.cid=orders.cid;
-- OR
select c.cid,c.cname,o.oid,o.qty from customers c inner join orders o using(cid); -- using clause
-- OR
select c.cid,c.cname,o.oid,o.qty from customers c inner join orders o where c.cid=o.cid;
-- OR
select c.cid,c.cname,o.oid,o.qty from customers c join orders o where c.cid=o.cid;

-- Natural Join
select customers.cid,cname,oid,qty from customers natural join orders;
select customers.cid,cname,oid,qty from orders natural join customers;

-- Equi Join
select customers.cid,cname,oid,qty from customers,orders where customers.cid=orders.cid;

-- WQ to find customer who placed orders but show only those order whose qty is greater that 3.
select c.cid,cname,oid,qty
from customers c,orders o
where c.cid=o.cid and qty>3; -- Non- Equi Join

-- or

select c.cid,cname,oid,qty
from customers c inner join orders o
on c.cid=o.cid and qty>3;

-- Outer Join(left,right,full and cross)

-- Left Join
select c.cid,cname,oid,qty from customers c left join orders o on c.cid=o.cid;
select c.cid,cname,oid,qty from customers c left outer join orders o on c.cid=o.cid;

-- Right Join
select c.cid,cname,oid,qty from customers c right join orders o on c.cid=o.cid;
select c.cid,cname,oid,qty from customers c right outer join orders o on c.cid=o.cid;

-- Full Join( Deprecated in Mysql-8 version)
select * from customers c left outer join orders o on c.cid=o.cid
union
select * from customers c right outer join orders o on c.cid=o.cid;

-- cross Join (cartesian product)
select * from customers cross join orders;

-- self join (join within same table)
select * from customers;

-- WQ to find customers whoes ardress are similar.
select c1.cid,c1.cname,c2.address
from customers c1,customers c2
where c1.cid!=c2.cid and c1.address=c2.address;







