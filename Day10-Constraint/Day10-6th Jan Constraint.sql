use amazon;
show tables;
select * from student;
desc student;
select * from student where totalmarks>=0 and totalmarks<=500;
-- check constraint
-- WQ to add check constraint for totalmarks i.e totalmarks>=0 and totalmarks<=500
alter table student modify totalmarks int check(totalmarks>=0 and totalmarks<=500);
desc student;
show create table student; -- show all constraint
select * from student;
-- insert into student values(108,'neeta','female','2000-09-09','pune',943); -- error for check
-- update student set totalmarks=900 where sid=101; -- error for check 

-- to remove check constraint
alter table student modify totalmarks int;
show create table student; 
-- OR
alter table student drop constraint student_chk_1;
show create table student; 

-- Key constraint (unique,primary,foreign)
-- unique(non-repeated but allow null)
select * from student;
desc student;
alter table student modify sid int; -- removed not null of sid
desc student;

-- apply unique to sid
delete from student where sid=101;
alter table student modify sid int unique; 
select * from student;
desc student;
insert into student values(101,'meena','female',null,null,null);
select * from student;
-- insert into student values(101,'usha','female',null,null,null); -- error for unique
insert into student values(null,'ritu','female',null,null,null);
insert into student values(null,'roshan','male',null,null,null);
select * from student;

-- remove unique key
alter table student modify sid int; -- can't remove unique key
desc student;
show create table student;
show index from student;
alter table student drop constraint sid;
desc student;
show create table student;
show index from student;

-- primary key(unique(no duplication) without not null)
-- add primary key to sid
delete from student where sid is null;
alter table student modify sid int unique not null; 
select * from student;
desc student;
show create table student;
show index from student;
alter table student drop constraint sid;
alter table student modify sid int;
desc student;

-- add primary key to sid directly
-- alter table student modify sid int primary key;
-- or
alter table student add primary key(sid);
desc student;
show create table student;
show index from student;

-- insert into student values(null,'hina','female',null,null,null);-- error because primary key
-- insert into student values(101,'hina','female',null,null,null); -- error because primary key

-- remove primary key
alter table student drop primary key;
desc student;
show create table student;
show index from student;





