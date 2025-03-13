use amazon;
create table emp
(
eid int primary key auto_increment,
ename char(20) not null,
gender enum('male','female','other') not null,
mobile bigint not null,
email varchar(20) unique,
city set('mumbai','delhi','pune','gujrat','banglore') not null,
dob date,
salary decimal(8,2) check (salary>0),
country char(20) default 'INDIA'
);

desc emp;
insert into emp(ename,gender,mobile,email,city,dob,salary)
values('keerti','female',454546,'k@gmail.com','mumbai,delhi','2001-07-9',500000.34);

INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('John Doe', 'male', 9876543210, 'john@example.com', 'mumbai', '1990-05-15', 55000.00);

-- Insert 2nd employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Jane Smith', 'female', 9876543211, 'jane@example.com', 'delhi', '1985-08-22', 60000.50);

-- Insert 3rd employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Alex Johnson', 'other', 9876543212, 'alex.j@example.com', 'pune', '1992-11-03', 48000.75);

-- Insert 4th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Michael Brown', 'male', 9876543213, 'michael@example.com', 'gujrat', '1988-02-17', 52000.00);

-- Insert 5th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Emily Davis', 'female', 9876543214, 'emily@example.com', 'banglore', '1995-06-30', 75000.25);

-- Insert 6th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Sophie Wilson', 'female', 9876543215, 'sophie@example.com', 'mumbai', '1991-04-12', 67000.00);

-- Insert 7th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('David Lee', 'male', 9876543216, 'david@example.com', 'delhi', '1989-09-29', 54000.25);

-- Insert 8th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Laura Martinez', 'female', 9876543217, 'laura@example.com', 'banglore', '1993-01-15', 72000.50);

-- Insert 9th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Chris Evans', 'male', 9876543218, 'chris@example.com', 'pune', '1986-12-05', 58000.75);

-- Insert 10th employee
INSERT INTO emp (ename, gender, mobile, email, city, dob, salary) 
VALUES ('Natalie Green', 'female', 9876543219, 'natalie@example.com', 'gujrat', '1994-07-20', 64000.00);

select * from emp;

-- Arithmatic (+,-,*,/,%(remainder))
select 6+7,6*7,6/7,6-7,6%7;
select 56%2,33%4,78%5;

-- syntax select
-- select col1,col2,...,or * from table1,table2...;

-- WQ to show salary of all employees by addition of 5000.
select eid,ename,salary,salary+5000 as 'Salary added by 5000' from emp;
select * from emp;


-- WQ to show salary with 20% hike for every employees;
select eid,ename,salary,salary+salary*20/100 as 'salary with 20% hike' from emp;

select eid,ename,salary,round(salary+salary*20/100) as 'salary with 20% hike' from emp;

-- WQ to show salary with 50% of deduction for every employees;
select eid,ename,salary,salary-salary*0.5 as 'salary with 50% deduction' from emp;


-- Relational/Comparison/Conditional >,<,>=,<=,=,!=

-- WQ to show employees whoes salary is greater than 70000.
select * from emp where salary>70000;

-- WQ to show employees who are from only 'mumbai' city.
select * from emp where city='mumbai';
-- OR
select * from emp where city in ('mumbai');

-- WQ to show employees who are from 'mumbai' city or from any other city as well.
select * from emp where city like '%mumbai%';
select * from emp;

-- WQ to show employee whose are not from 'Gujrat'.
select * from emp where city!='Gujrat';

-- WQ to show employee whose dob is lesser than 1st Jan 1990.
select * from emp where dob<'1990-01-01';

select 6>5;
-- Logical and,or,not
select 6>5 and 55>30;
select 6>5 or 55>30;
select 8>=9 or 9>=9;
select not 7>=8;

-- WQ to find emp whose salary greater than 70000 and less than 75000.
select * from emp where salary>70000 and salary<75000;
-- WQ to find emp whose birthday above 1st Jan 1993 and less than 31st Dec 1995.
select * from emp where dob>'1993-01-01' and dob<'1995-12-31';
-- OR
select * from emp where dob>'1993-01-01' and dob<'1995-12-31';

-- WQ to find male employees who are form delhi or from Gujrat.
select * from emp where gender='male'and (city='delhi' or city='Gujrat');

-- WQ to find employee whose salary is greater than 80000 and who are from mumbai or from pune.
select * from emp where salary>80000 and (city='mumbai' or city='pune');

-- WQ to find emp whose salary is less than or equal to 60000 not for male employees.
select * from emp where salary <=60000 and not (gender='male');

select * from emp where salary <=60000 and gender!='male';
select * from emp where salary <=60000 and (gender='female' or gender='other');
select * from emp;







