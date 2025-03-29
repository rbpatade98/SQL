-- subquery(inner query) written  withi main query enclosed in parenthesis ()
-- sub query will be executed first
-- sub query must be written associated/ condition for main query column
-- to write condition use operators (>,<,>=,<=,=,in,!=,not in,exists,not exists,all,any,like,between)
-- order by and limit clause only written for main query
-- sub query can be written by create,update,insert,delete and select

use hr;
select * from employees;
-- 2) Write a query to display all the information of employess whose salary is within the 
-- range of smallest salary and 2500.
select * from employees where salary between(select min(salary) from employees) and 2500;

-- 3) Write a query to display the name (first and last ),salary,department id,job id 
-- for those employees who works in the same designation as the employee works whose id is 169.
select job_id from employees where employee_id=169;

select * from employees where job_id =(select job_id from employees where employee_id=169);
-- OR
select * from employees where job_id in(select job_id from employees where employee_id=169);

-- 4) Write a query to display the name (first and last ),salary,department id,job id for 
-- those employees who earn such amount of salary which is the smallest salary of any of the departments.
select first_name,last_name,salary,department_id,job_id
from employees where salary =(select min(salary) from employees);

select first_name,last_name,salary,department_id,job_id
from employees where salary in(select min(salary) from employees);

select first_name,last_name,salary,department_id,job_id
from employees where salary =any(select min(salary) from employees);

-- find employee count as per department and lowest salary of employees.
select department_id,count(employee_id),min(salary) from employees group by department_id;
select department_id,salary from employees where department_id=20;

-- Write a query to get the details of employees who are managers.
select * from employees where employee_id in (select manager_id from employees);

-- Write a query to get the details of employees who manage a department.
select * from employees where employee_id in (select manager_id from employees);

-- Write a query to display the department id and the total salary for those departments which 
-- contains at least one employee

select department_id,count(employee_id),sum(salary) 
from employees 
where department_id is not null
group by department_id
having count(employee_id)>=1;

-- Write a query to display the name (first and last ) and department for all employees for any existence of 
-- those employees whose salary is more than 3700. 
select first_name,last_name,department_id,salary
from employees
where salary>3700 and department_id is not null;

select e.first_name,e.last_name,d.department_id,d.department_name,e.salary
from employees e,departments d
where e.department_id=d.department_id and e.salary>3700;

-- Write a query to display all the information of those employees who 
-- did not have any job in the past. or find employees who are fresher
select distinct(employee_id) from job_history;

select * from employees where employee_id not in(select employee_id from job_history);

-- Write a query to display employee name(firstname,lastname),employee_id and job title for 
-- all employees whose location is Toronto

select * from locations where city='toronto';
select * from departments where location_id=1800;
select * from employees where department_id=20;

select e.employee_id,e.first_name,e.last_name,j.job_title,l.city
from employees e,departments d,jobs j,locations l
where e.department_id=d.department_id and
j.job_id=e.job_id and
d.location_id=l.location_id and
l.city='toronto';





