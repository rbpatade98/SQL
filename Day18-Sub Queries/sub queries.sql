use collegedb;
select * from studentnew;
select * from marksnew;

-- Sub query q2 operator(q1);
-- Q.2 Find students whoes marks are greater than min marks of any student.

select min(totalmarks) from marksnew; -- 74

select s.studentid,s.name,m.totalmarks
from studentnew s,marksnew m
where s.studentid=m.studentid and m.totalmarks >(select min(totalmarks) from marksnew);

-- Q.3 Find students whoes totalmarks are similar than average of all students.
select avg(totalmarks) from marksnew;

select s.studentid,s.name,m.totalmarks
from studentnew s,marksnew m
where s.studentid=m.studentid and m.totalmarks =(select avg(totalmarks) from marksnew); -- result only 1 row

select s.studentid,s.name,m.totalmarks
from studentnew s,marksnew m
where s.studentid=m.studentid and m.totalmarks in(select avg(totalmarks) from marksnew); -- result many row

-- Q.4 Find students whoes totalmarks is within the range of smallest marks and 85.
select s.studentid,s.name,m.totalmarks
from studentnew s,marksnew m
where s.studentid=m.studentid and m.totalmarks between (select min(totalmarks) from marksnew) and 85;

-- Q.5 Find students whoes totalmarks are present.
select s.studentid,s.name,m.totalmarks
from studentnew s,marksnew m
where s.studentid=m.studentid and m.totalmarks is not null;

-- OR

select s.studentid,s.name,m.totalmarks
from studentnew s right join marksnew m on s.studentid=m.studentid and m.totalmarks is not null;

-- Q.6 Find students whoes record is not present in marks table
select * from studentnew where studentid not in (select studentid from marksnew);

select * from studentnew 
where not exists (select studentid from marksnew where studentnew.studentid=marksnew.studentid);

select s.studentid,s.name
from studentnew s left join marksnew m on s.studentid!=m.studentid; -- wrong answer

-- Q.7 Find students whoes marks are not assigned.
select s.studentid,s.name
from studentnew s,marksnew m
where s.studentid=m.studentid and m.totalmarks is null
union
select * from studentnew
where studentid not in (select studentid from marksnew);

use hr;
show tables;
select * from regions;
select count(*) from regions; -- 4
select * from countries; -- 25
select * from locations; -- 23
select * from departments; -- 27
select * from employees; -- 107
select * from jobs; -- 19
select * from job_history; -- 10


-- Write a query to display the name (first and last ) for those employees who gets more 
-- salary than the employee whose ID is 163.
select salary from employees where employee_id=163;
select * from employees where salary>9500;

select first_name,last_name,salary from employees
where salary>(select salary from employees where employee_id=163);

-- Write a query to display all the information of employess whose salary is within the 
-- range of smallest salary and 2500.

-- Write a query to display the name (first and last ),salary,department id,job id 
-- for those employees who works in the same designation as the employee works whose id is 169.

-- Write a query to display the name (first and last ),salary,department id,job id for 
-- those employees who earn such amount of salary which is the smallest salary of any of the departments.

-- Write a query to get the details of employees who are managers.

-- Write a query to get the details of employees who manage a department.

-- Write a query to display the department id and the total salary for those departments which contains at least one employee

-- Write a query to display the name (first and last ) and department for all employees for any existence of 
-- those employees whose salary is more than 3700. 

-- Write a query to display all the information of those employees who 
-- did not have any job in the past.

-- Write a query to display employee name(firstname,lastname),employee_id and job title for all employees whose location is Toronto








