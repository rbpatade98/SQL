use amazon;
-- distinct() clause avoid repeated values
select * from student;
select * from customers;
-- WQ to show cities of customers where they belong.
select address from customers;
select distinct(address) from customers;
select distinct(address),country from customers;
update customers set country='UK' where cid=5;
select * from customers;
select distinct(address) from customers;
select distinct(address),country from customers;
select distinct(address),country,cid from customers;

-- order by (ascending-asc and descending-desc)
select * from customers order by firstname; -- default ascending
select * from customers order by firstname asc;
select * from customers order by firstname desc;
select * from customers order by cid,firstname; -- sort only by cid
-- WQ to show customer records as per birthdate oldest to youngest.
select * from customers order by dateofbirth;

-- WQ to female customers with aplhabetical order.
select * from customers where gender='female' order by firstname;

-- limit clause (used to show specified rows)

-- WQ to show first two records of customers.
select * from customers limit 2;


-- WQ to show last two records of customers.
select * from customers order by cid desc limit 2;

-- WQ to show only last records of customers.
select * from customers order by cid desc limit 1;


-- limit clause has offset which is used to omit the rows
select * from customers;
-- WQ to show 2nd records of customers.
select * from customers limit 1,1; -- first 1 is used to skip the row and 2nd one is used to show 1 row

-- WQ to show 6th row of customers.
select * from customers limit 5,1; 

-- WQ to show 2nd last records of customers.
select * from customers order by cid desc limit 1,1; 

-- WQ to show 3rd and 4th row of customers.
select * from customers limit 2,2; 

-- WQ to show 2nd and 5th row of customers.
select * from customers;
(select * from customers limit 1,1)
union
select * from customers limit 4,1; -- showing only 5th row

select * from emp;
-- WQ show 2nd highest salaries employee details.
select * from emp order by salary desc limit 1,1;

-- WQ to show only 4th to 8th rows of employees but show in alphabetical order
select * from emp;
select * from emp order by eid,ename limit 3,5; -- but shows via cid order

select * from emp limit 3,5;
-- views  (virtual table used to store query result)
create view emprecord as select * from emp limit 3,5;
select * from emprecord order by ename;

-- select case stmt it is block where we show result as per condition matches.
-- syntax
-- select col1,col2,col3, or *,
-- case
-- when condition1 then 'stmt'
-- when condition2 then 'stmt'
-- when condition3 then 'stmt'
-- else 'stmt'
-- end as 'stmt'
-- from tablename;

-- WQ to show remark based on salary ranges as salary<20000 'grade-III',
-- salary<50000 and salary>=20000 'grade-II' and salary<=80000 and salary>=50000 'grade-I'  
-- for each employee and show only eid,ename,salary and remark
select eid,ename,salary,
case
when salary<20000 then 'Grade-III'
when salary<50000 and salary >=20000 then 'Grade-II'
when salary<=80000 and salary >=50000 then 'Grade-I'
else 'N/A'
end as 'Salary Remark'
from emp;

-- save above query result in view so it will easier to call multiple time
create view salarygrade
as
select eid,ename,salary,
case
when salary<20000 then 'Grade-III'
when salary<50000 and salary >=20000 then 'Grade-II'
when salary<=80000 and salary >=50000 then 'Grade-I'
else 'N/A'
end as 'Salary Remark'
from emp;

select * from salarygrade;


-- Functions (built-in)- it block used to avoid repeatation of code and called n number of times
-- 3 types (math,string,date)





















