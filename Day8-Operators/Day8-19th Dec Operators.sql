use amazon;
show tables;
select database();

-- Arithmatic,Relational,Logical,Range,List,Like,Is 
-- range(between)
select * from emp;

-- WQ to show emp whoes salary from 50k to 60k.
select * from emp where salary>=50000 and salary<=60000;
-- OR
select * from emp where salary between 50000 and 60000;

-- WQ to show emp whoes birthday from 1st Jan 1995 to 31st Jan 2000.
select * from emp where dob between '1995-01-01' and '2000-01-31';
-- select * from emp where dob between '2000-01-31' and '1995-01-01'; -- it won't work because between always start from lower to higher

-- list operator(in,not in)
-- WQ to show emp who are only from mumbai,pune and delhi.
select * from emp where city='mumbai' or city='pune' or city='delhi';
select * from emp where city in ('mumbai','pune','delhi');

-- WQ to show emp whoes salary is not 55000,80000 or 48000.
-- select * from emp where salary!=55000 or salary!=80000 or salary!=48000; -- wrong answer rules violates

select * from emp where not (salary=55000 or salary=80000 or salary=48000);

select * from emp where salary not in (55000,80000,48000);

-- like (pattern) %,_

-- WQ to find emp whose name starts with 'j'
select * from emp where ename like 'j%';

-- WQ to find emp whose name ends with 'n'
select * from emp;
select * from emp where ename like '%n';

-- WQ to find emp whose name ends with 'son'
select * from emp where ename like '%son';

-- WQ to find employees who are using gmail account.
select * from emp where email like '%gmail.com' or '%gmail.co.in';

-- WQ to find emo whoes name having 2nd character as 'o';
select * from emp where ename like '_o%';

-- WQ to find emo whoes name having 2nd last as 'o';
select * from emp where ename like '%o_';
select * from emp;

-- WQ to find emo whoes name having 'ee' in between;
select * from emp where ename like '%ee%';
 
-- WQ to find emo whoes name starts and ends with  'n';
select * from emp where ename like 'n%n';

-- WQ to find emo whoes mobile number start with 98.
select * from emp where mobile like '98%';

-- is null, is not null
select * from emp;
desc emp;
insert into emp values(13,'','female',76762378,null,'delhi',null,50000,'UK');
select * from emp;
insert into emp values(14,'kishor','male',987878,'kk@gmail.com','mumbai','1998-09-19',500000,'USA');

-- WQ to find emp whoes email id is not present.
-- select * from emp where email=null; -- wrong way of checking empty values
select * from emp where email is null or email='';

insert into emp(ename,gender,mobile,email,city,dob,salary,country)
values('Siddhu','male',787877,'','pune','2000-10-21',30000,'USA');
select * from emp;
select * from emp where email is null or email='';

-- WQ to find emp whoes name is not listed.
select * from emp where ename is null or ename='';

select * from emp where ename like '';



