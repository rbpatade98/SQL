-- function- it is set of code or block of code used to avoid repeatation and called n number times

-- Built in function(system defined)
-- Math function (1)Scalar 2) Aggregate(Group function)

-- Scalar function
select sqrt(50);
select power(10,6);
select pow(10,6);
select round(1111.45445443);
select round(1111.95445443); -- showing only digits and it is doing rounding of  decimal point digit
select floor(1111.95445443);-- showing digits but truncating decimal point digits
use amazon;
select * from emp;

-- WQ to show employee id,name and salary with round figure.
select eid,ename,round(salary) from emp;

-- display emp id,name and also whoes round of salary is 500000.
select eid,ename,round(salary) from emp where round(salary)=500000;

select sign(455); -- when +ve then it show 1
select sign(-455.435345); -- when -ve then it show -1
select abs(3435);
select abs(-3435);  -- it removes -ve sign
select ceil(45.4545); -- next highest integral number
select ceil(45.1);
select ceil(45.000000001); 
select mod(4,2); -- 4%2 show remainder 0
select 4%2;-- 0
select mod(2,4); -- 2
select mod(22,4); -- 2

-- Aggregate function /group function- generates single row answer
-- min(),max(),count(),sum(),avg()
select * from emp;


-- find total count of employees.
select count(*) from emp;
select count(eid) from emp;
select count(ename) from emp;
select count(email) from emp; -- count() ignores null values
desc emp;

-- find employees count whose salary is above 50000.
select count(eid) from emp where salary>50000;

-- display how many cities are there where employees are belong
select count(city) from emp; -- wrong with repeated cities
select count(distinct(city)) from emp; -- with repeated cities

-- display lowest salary of emp.
select min(salary) from emp;
select salary,ename from emp where salary=(select min(salary) from emp);

-- display highest salary of emp.
select max(salary) from emp;

-- display avrage salary of emp.
select avg(salary) from emp;

-- display total of salary of all employees.
select sum(salary) from emp;


-- display count of employees as per cities
select city,count(eid) from emp group by city;

-- group by clause used to show result in group by using below things
-- 1) group by applied only single column which has repeated values
-- 2) group by worked with Agggregate/group function- min(),max(),count(),avg(),sum()
-- 3) the column written in group by must be present in select
-- 4) group by also has having clause which not compulsory. 
-- 5) having clause used to write condition after group by

-- Q.1) Display count for employees as per gender
select gender,count(eid) from emp group by gender;

-- Q.2) Display count for employees as per gender with total salaries of emp wrf gender
select gender,count(eid),sum(salary) from emp group by gender;
select gender,count(eid),sum(round(salary)) from emp group by gender;
select * from emp;

-- Q.3) Display emp count as per countries
select country,count(eid) from emp group by country; 

-- Q.4) Find emp count those who are using gmail account
select email,count(eid) from emp where email like '%gmail%' group by email;
-- OR
select email,count(eid) from emp  group by email having email like '%gmail%';

-- Q.5) Show avgrage salary of employees whoes birthday from 1st Jan 2000 to 31st Dec 2005.
select avg(salary) from emp where dob between '2000-01-01' and '2005-12-31';
-- as per dob avg salary
select dob,avg(salary) from emp where dob between '2000-01-01' and '2005-12-31' group by dob;

-- Q.6) show emp sum of salaries as per cities and show emp count as well
-- but show only those employees whose total of salary is above 120000.

-- select city,count(eid),sum(salary) from emp where sum(salary)>120000 group by city; -- error because where clause giving single row and can't proceed to group by
select city,count(eid),sum(salary) from emp  group by city having sum(salary)>120000; 

-- Q.7) SHow emp sum of salaries as per cities for mumbai and pune ahd show emp count as well
-- but show only those whose total is above 120000.


select city,count(eid),sum(salary) 
from emp  
where city in ('mumbai','pune')
group by city 
having sum(salary)>120000; 






