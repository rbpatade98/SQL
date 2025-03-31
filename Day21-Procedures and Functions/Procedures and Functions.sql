use amazon;
-- Syntax for procedures
 
-- delimiter //
-- create procedure proc_name(in,out,inout optional)
-- begin
-- select stmt;
-- end //

-- call proc_name(optional)

-- drop procedure proc_name;

select "welcome";


-- Write a procedure to show all employees details

delimiter //
create procedure showemp()
begin
select * from emp;
end //

call showemp;

drop procedure showemp;

delimiter $
create procedure showemp()
begin
select eid,ename from emp;
end $

call showemp;

-- Use of procedure parameter (in,out,inout)
-- in parameter used to take input from user

-- Write a procedure to show entered employee details as per name.

delimiter #
create procedure show_given_empdetails(in empname char(20)) -- parameter
begin
select * from emp where ename=empname;
end #

call show_given_empdetails('pooja');
call show_given_empdetails('keerti'); -- argument

-- Write procedure to show arithmatic operation by taking number from user

delimiter $
create procedure calculator(in a int,in b int,out addition int)
begin
set addition=a+b;
select addition;
end $

call calculator(5,6,@addition);

--

delimiter $
create procedure sub1(in a int,in b int,out sub int)
begin
set sub=a-b;
end $

call sub1(5,6,@sub);
select @sub;

call sub1(11245,60,@sub);
select @sub;

--


delimiter //
create procedure cal(in x int,in y int,out add1 int,out sub int,out mul int,out div1 int,out mod1 int)
begin
set add1=x+y;
set sub=x-y;
set div1=x/y;
set mul=x*y;
set mod1=x%y; -- (3/4) then gives remainder 
end //
call cal(3,4,@add1,@sub,@mul,@div1,@mod1);
select @add1,@sub,@mul,@div1,@mod1;

-- Write a procedure to show emp salary whoes id is entered by user.
delimiter //
create procedure showsalary(in id int,out sal decimal(8,2))
begin
select salary from emp where eid=id;
end //

call showsalary(1,@sal);
-- call showsalary; -- error required input argument

-- inout parameter
-- Write procedure to show count of employees.
delimiter $
create procedure empcount(inout count1 int)
begin
select count(eid)  from emp;
end $

call empcount(@count1);

-- 
delimiter $
create procedure empcountsal(inout count1 int)
begin
select count(eid)  from emp where salary>count1;
end $
set @count1=50000;
call empcountsal(@count1);

-- Write procedure to find employee count asked by gender value.
delimiter $
create procedure empcountgender(inout countgender varchar(20))
begin
select count(eid) from emp where gender=countgender;
end $
set @gender='male';
call empcountgender(@gender);

set @countgender1='female';
call empcountgender(@countgender1);

drop procedure empcountgender;

















