use hrms;

/* create a table emp1 with following data
 create a mysql procedure to find the total salary of any dept user entered (use employees table)
 and update the total salary of that dept in emp1 table
dept_id  total salary
 1            null
 2            null
 .            . 
 .            .
 12            null
 */

desc employees;
 create table emp2
 as
 select distinct department_id, null as 'total_salary' from employees;
 alter table emp2 modify total_salary bigint;

 select * from emp2;
 drop table emp2;
 drop procedure emp2_display;
 
 
delimiter %%
create procedure emp2_display(in dno int,out sal bigint )
begin
select sum(salary) into sal from employees where department_id = dno;
update emp2 set total_salary = sal
where department_id = dno;
select * from emp2;
end %%
call emp2_display(5,@a);






#inout procedure

delimiter %%
create procedure update1(in x int, inout y int)
set y = y + x;
end %%


drop procedure update1;
set @y = 6;
call hrms.update1(5, @y);
select @y;
call hrms.update1(98, @y);
select @y;

 --  write a pla procedure to take two input and check which one is greater
 
 delimiter %%
 create procedure greater(in x int, in y int, out result varchar(50))
 begin
 if x > y
 then set result = 'x is greater';
 else
 set result = 'y is greater';
 end if;
 end%%
 
 set @result = '0';
call hrms.greater(78, 89, @result);
select @result;


 --  write a pla procedure to take three input and check which one is greater
 
delimiter %%
 create procedure greater3(in x int, in y int,in z int, out result varchar(50))
 begin
 if 
 x > y and x > z
 then set result = concat ( 'largest numer is', x);
 elseif
 y > x and y > z
   then set result =concat ( 'largest numer is', y);
else
 set result = concat ( 'largest numer is', z);
 end if;
 end%%
  select * from employees
  
  
  
  drop  procedure seniour;  
 -- write a mysql procedure to compare the joining date of any two employees and who is senior among them
 delimiter %%
 create procedure seniour(in empid1 int, in empid2 int, out result varchar(50))
 begin
declare date1 date;
declare date2 date;
select hire_date into date1
from employees
where employee_id = empid1;
select hire_date into date2
from employees
where employee_id=empid2; 

if date1 < date2
 then set  result= concat(empid1 ,' ' , 'is seniour');
elseif date1 = date2 
then set result =concat(empid1 ,' ' ,empid2, 'is equal');
else  set result= concat(empid2 ,' ' , 'is greater');

 end if;
 end%%
 
/* write a plsql procedure to get the salary of any empl entered bu user.
if his/her salary is greater than update the salary by 10%,
if his/her salary in between 10000 to 20000 than update the salary by 20%,
if his/her salary is less than 10000 than update the salary by 15%,
other wise no change in salary
create table emps to do all these stuffes */

create table emps as (select * from employees);
delimitter %%
create procedure update_salary( in eid int)
begin
declare sal int;
select e.salary, e.first_name, e1.salary
from employees e, emps e1
where e.employee_id = e1.employee_id;
select  e1.salary into sal
from emps e1
where employee_id=eid;

if sal > 20000 
then update e1.employee_id
set e2.salary = salary +(salary * 0.1);

elseif sal between 10000 and 20000
then update e1.employee_id
set e2.salary = salary +(salary * 0.2);

else sal < 10000 
then update e1.employee_id
set e2.salary = salary +(salary * 0.15);
end if;
end%%