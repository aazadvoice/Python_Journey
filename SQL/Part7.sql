use hrms;

call hrms.demo();


-- create a mysql stored procedureto display the employee data from employees table
delimiter %%
create procedure emp_display()
begin
select * from employees;
end %%
call emp_display;

-- create a mysql stored procedureto display the employee data from employees table for department =5
delimiter %%
create procedure emp_display5()
begin
select * from employees where department_id =5;
end %%
call emp_display5;



/*3 types of parameter
1. in parameter(input parameter/default parmeter)
Here user sends a value / value as  paramter/input to the procedure */

-- create a mysql stored procedureto display the employee data from employees table for department entered by user
delimiter %%
create procedure emp_dept5(in dno int) # 
begin
select * from employees where department_id =dno;
end %%
call emp_dept5(6);


/* create a mysql stored procedureto display the first_name, sallary & dept of employees working in department 
entered by user and salary greater than user want*/
delimiter %%
create procedure emp_dept6(in dno int, in sal decimal(8,2)) 
begin
select first_name, salary, department_id from employees where department_id =dno and salary > sal;
end %%

call emp_dept6(9,5000);

-- create a styored p[rocedure to add two variable in a thired variable
delimiter %%
create procedure addition()
begin
declare a int;
declare b int;
declare c int;
set a=10;
set b= 20;
set c= a+b;
select concat('value of c=' ,c) as 'additiom';

end %%
call addition();



-- create a styored p[rocedure to add two variable in a thired variable WHERE VARIABLE ENETERT BY USER

-- WAY 1
delimiter %%
create procedure addition1(IN A INT, B INT)
begin
declare c int;
set c= a+b;
select concat('value of c=' ,c) as 'additiom';
end %%
call addition();


-- WAY 2
delimiter %%
create procedure addition2(IN A INT, B INT, OUT C INT)
begin
set c= a+b;
end %%

set @s=0;
call addition2(268,69, @s); # here @s is any variable which we used to store vslue of c 
select @s;




-- dispaly the name of the person who earns maximum salary in the job entered by user
delimiter %%
create procedure emp_dept_name(in jid int ) 
begin
declare fname varchar(50);
select first_name
from employees 
where job_id= jid
and salary= (select max(salary) from employees where job_id=jid);
end %%

call emp_dept_name(1);

drop procedure emp_dept_name1;
-- dispaly the max salary of the organization
delimiter %%
create procedure emp_dept_name1(in dno int,out maximum bigint ) 
begin
select max(salary) into maximum
from employees
where department_id =dno;
end %%

 call emp_dept_name1(5, @maximum);
 select @maximum;
 
 -- dispaly the max and min sallary of any dept
 delimiter %%
create procedure emp_dept_name2(in dno int,out maximum bigint, out minimum bigint ) 
begin
select max(salary), min(salary) into maximum, minimum
from employees
where department_id =dno;
end %%

 call emp_dept_name2(5, @maximum,@minimum);
 select @maximum,@minimum;
