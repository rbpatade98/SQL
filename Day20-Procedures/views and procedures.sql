use amazon;
show tables;
-- subquery with create,insert, update and delete
select * from emp;
create table newemp as select * from emp where gender='female'; -- without key constraint
select * from newemp;
desc newemp;

-- TCL(commit,rollback,savepoint)
start transaction;
delete from newemp;
select * from newemp;
rollback;
select * from newemp;
commit;

select * from emp;
-- WQ to insert employees whoes salary is greater than 10000 in newemp;

insert into newemp select * from emp where salary>10000;
select * from newemp;

-- WQ to delete employees whoes salary is from 10000 to 30000 in newemp but compare from emp table;
delete from newemp where salary in (select salary from emp where salary between 10000 and 30000);

-- WQ to update country as IN for employees who are from india from newemp but compare in emp table;

update newemp set country='IN'
where country in(select country from emp where country='india');

select * from newemp;
rollback;
select * from newemp;

start transaction;
savepoint beforedelete;
-- delete emp id 1 record
delete from newemp where eid=1;
select * from newemp;

savepoint beforeupdate;
-- set salary as 20000 for eid=3
update newemp set salary=20000 where eid=3;
select * from newemp;

rollback to beforedelete;
select * from newemp;

-- Views (views is used to store result also it called virtual table
create view newemp_view as select eid,ename,city,salary from newemp;
select * from newemp;
create view newemp1 as select * from newemp;
select * from newemp1;

-- inserting in newemp(main)
desc newemp;
insert into newemp values(90,'aaaa','male',5345,null,'mumbai',null,null,null);
select * from newemp;
select * from newemp1;
insert into newemp1 values(91,'bbbb','male',5345,null,'mumbai',null,null,null);
select * from newemp;
select * from newemp1;

select * from newemp_view;
insert into newemp_view values (92,'cccc','delhi',50000);  -- working with warning

delete from newemp where eid=91;
select * from newemp_view;
select * from newemp1;


delete from newemp1 where eid=90;
select * from newemp_view;
select * from newemp;

select * from emp_age;


