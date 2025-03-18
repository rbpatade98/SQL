use amazon;
show tables;
select * from student;
-- create foreign key table as projects has sid,pid,title,frontend,backend
-- foreign key (reference key which nothing but an primary key of another table)
desc student;
alter table student add primary key(sid);
create table projects
(
pid int primary key,
sid int,
title varchar(50),
frontend varchar(50),
backend varchar(50),
foreign key (sid) references student(sid)
);
desc projects;
show create table projects;
show index from projects;

create table mentor
(
mid int primary key,
name char(50),
deptname char(50),
sid int,
pid int
);

desc mentor;
alter table mentor add foreign key(sid) references student(sid);
desc mentor;
alter table mentor add foreign key(pid) references projects(pid);
desc mentor;

select * from student;
insert into projects values(1000,102,'Hotel system','js','mysql');
insert into projects values(1001,null,'Chatbot','python',null);
select * from projects;
insert into projects values(1002,102,'Portfolio','reactjs','express');

insert into mentor values(1,'raju','IT',102,1000);
insert into mentor values(2,'pooja','CS',104,1001);
insert into mentor values(3,'usha','CS',105,1002);
select * from mentor;

-- deleting fk rows
delete from mentor where mid=3;
select * from mentor;
select * from student;

-- delete from projects where pid=1000; -- error mentor table not allowing
-- delete from student where sid=102; -- error project and mentor not allowing

-- To apply new rule of foreign key with cascade 1st remove old FK constraint
show create table projects;
show index from projects;
alter table projects drop constraint projects_ibfk_1;
alter table projects drop index sid;
show create table projects;
desc projects;


show create table mentor;
show index from mentor;
alter table mentor drop constraint mentor_ibfk_1;
alter table mentor drop constraint mentor_ibfk_2;
alter table mentor drop index sid;
alter table mentor drop index pid;
show create table mentor;
desc mentor;


alter table projects add foreign key(sid) references student(sid) on delete cascade;
show create table projects;

delete from student where sid=102;
select * from projects;
select * from mentor;
update mentor set sid=105 where mid=1;
alter table mentor add foreign key(sid) references student(sid) on delete set null;
show create table mentor;
delete from student where sid=104;
select * from mentor;

-- 
