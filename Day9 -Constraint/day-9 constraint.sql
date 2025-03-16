show databases;
use amazon;
select database();
show tables;

select * from customers;
desc customers;

create table student(
sid int,
name char(20),
gender enum('male','female','other'),
dob date,
city char(50),
totalmarks int
);
desc student;

insert into student values(101,'komal','female','2000-06-12','mumbai',400);
select * from student;
insert into student values(null,'kk','male','2001-06-22','delhi',470);
insert into student values(101,'pooja','female','2003-10-11','pune',370);
select * from student;

-- constraint- apply strict rule or access constrol while creating table or after creatio
-- types- not null,default,check,(key-unique key,primary key,foreign key)

desc student;
-- apply not null to sid
update student set sid=102 where name='kk';
alter table student modify sid int not null;
desc student;
select * from student;
-- insert into student values(null,'aaa','male','2005-02-12','delhi',200); -- error not null

-- WQ to apply not null to name,gender column
insert into student values(104,'aaa',null,'2005-02-12','delhi',200);
select * from student;
update  student set gender='male' where sid=104;
select * from student;
desc student;
alter table student modify gender enum('male','female','other') not null;
desc student;

alter table student modify name char(50) not null;
desc student;

-- WQ to remove not null for name
alter table student modify name char(50);
desc student;

insert into student values(105,'','male','2002-12-12','delhi',270);
select * from student;

-- default
desc student;
insert into student(sid,gender) values(106,'male');
select * from student;

-- WQ to set deafult value for city as 'none'
alter table student modify city char(50) default 'none';
desc student;
insert into student(sid,gender) values(107,'female');
select * from student;


-- WQ to set deafult value for city as null
alter table student modify city char(50);
-- or
alter table student modify city char(50) default null;
desc student;


