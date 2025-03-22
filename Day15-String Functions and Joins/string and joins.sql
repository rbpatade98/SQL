use amazon;
select * from emp;

-- WQ to display employees whoes birthday on same day(dayname) in next week
select dayname(dob) from emp;

select eid,ename,dob,dayname(dob) 
from emp 
where dayname(now())=dayname(dob) and week(dob)=week(now())+1;

-- string functions (string is an set of literals enclosed within quotes)
select char_length("SQL");
select character_length("SQL");
select length("SQL");
select char_length("SQLis backend language");
select length(65658);
select length(65.878);

-- WQ to show total digits of salary from emp table
select salary,length(round(salary)) from emp;

-- WQ to show emp whoes email total length less than 10;
select eid,ename,email,length(email) from emp where length(email)<10;

select concat("sql"," ","nosql");
select concat(eid,"-",ename) as 'ID-NAME' from emp;

select upper('heeLo');
select lower('heeLo');

select eid,upper(ename) as Name from emp;

select ucase('heeLo');
select lcase('heeLo');

select reverse("sql");
select reverse(7340);

select replace("welcome to sql",'E','z'); -- follows Case(upper and lower)

select * from emp;
-- WQ to show employee id,name and cities in abbrevated form.
-- (i.e mumbai can be MU,delhi can be DH,pune can be PU,gujrat can be GJ,banglore can be BA)
select eid,ename,replace(city,'mumbai','MU') from emp;

select eid,ename,city,
case
when city like '%mumbai,delhi%' then replace(lower(city),'mumbai,delhi','MU,DH')
when city like '%mumbai%' then replace(lower(city),'mumbai','MU')
when city like '%delhi%' then replace(lower(city),'delhi','DH')
when city like '%gujrat%' then replace(lower(city),'gujrat','GJ')
when city='banglore' then replace(lower(city),'banglore','BA')
when city='pune' then replace(lower(city),'pune','PU')
else city
end 'City Code'
from emp;

select left('good morning',6); -- from left side after 6 position it truncates the string
select left('hello',2);
select left('hello',23);
select left('hello',2);
select left(1243,2);

select right('good morning',6); -- from right side after 6 position it truncates the string

select lpad("sql",10,"No");
select lpad("sql",10,"#"); -- from left side adds # until given string size up to 10
select rpad("sql",10,"#"); -- from right side adds # until given string size up to 10

select lpad(eid,4,'IT '),ename from emp;

select substring("welcome",5); -- starts from given position number as 5 to end string but it truncate before char  (1-4)
select substring("welcome",2); -- elcome
select substring("welcome",2,5); -- elcom (start=2 and count from that 1 to 5)
select substring("welcome",1,6); 

select insert("welcome",2,5,"good"); -- wgoode
select insert("welcome",2,4,"good"); -- wgoodme
select insert("hi",2,4,"good"); -- hgood

-- joins (used to fetch result from more than one table)
select * from student; -- 4*6
select * from projects; -- 1*5
select * from student,projects; -- 4*11 (row multies and columns added)

select * from emp; -- 15*9
select * from customers; -- 7*9
select * from emp,customers; -- 105*18

-- Types of joins
-- 1) Inner Join
-- 2) Outer Join
-- 3) Natural Join
-- 4) Cross Join
-- 5) Self Join
-- and Other Equi and Non-Equi Join















