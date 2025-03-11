use amazon;
show tables;
select * from customers;
-- DML(update)
alter table customers add country varchar(20);
select * from customers;

-- WQ to update counry for all customers set as 'INDIA'
update customers set country='INDIA';
select * from customers;

-- WQ to update country for customerid 1 set country 'UK';
update customers set country='UK' where cid=1;
select * from customers;
-- delete from customers where cid='A123';

-- WQ to update lname,gender,dateofbirth,email,mobile,address for 'Rohit' whose id is 2.
update customers 
set lname='shah',gender='male',dateofbirth='2002-04-12',email='r@gmail.com',
mobile=56575,address='malad'
where cid=2 and firstname='Rohit';

select * from customers;

-- WQ to change datatype of mobile column from customers modify as bigint.
alter table customers modify mobile bigint;
desc customers;

-- WQ to update mobile number of customer id 1 and 2 set as 9878987401.
update customers set mobile=9878987401 where cid in (1,2);
select * from customers;

-- WQ to update country of customers who are from 'malad' and 'vasai' set country as 'USA'.
update customers set country='USA' where address in ('malad','vasai');
select * from customers;

-- WQ to set address as 'Borivali' for those who address is not there  in customers table
update customers set address='Borivali' where address is null;
select * from customers;

-- WQ to update customers email id those who are from 'india' and 'usa' set email as 'e@gmail.com'
update customers set email='e@gmail.com' where country='india' or country='usa';
-- OR
update customers set email='t@gmail.com' where country in('india','usa');
select * from customers;

create table employees
(
eid int primary key,
fname char(20),
gender enum('female','male','other'),
dob date,
salary float,
managerid int,
deptname set('hr','admin','training','accounts','it'),
city varchar(20)
);

desc employees;

insert into employees values(101,'rakesh','male','1999-08-12',80000,null,'hr,it','mumbai');
select * from employees;
insert into employees values(102,'pooja','female','2002-1-2',60000,101,'hr','pune');
select * from employees;
insert into employees values(103,'meena','female','2001-11-22',40000,null,'admin','indore');