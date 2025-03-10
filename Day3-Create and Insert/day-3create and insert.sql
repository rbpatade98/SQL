-- syntax create db
-- create database database name
create database db1;
show databases;
create database db2;
show databases;
use db1;
-- use db29; -- unknown db
select database();
show tables;

-- creating table
-- login(username,password)


create table login
(
username varchar(30),
password varchar(50)
);
show tables;
describe login;
desc login;

select * from login;
insert into login values("komal",12324);
select * from login;




