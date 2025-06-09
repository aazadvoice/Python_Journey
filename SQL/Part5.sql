
-- SUBQUARIES  IN SQL

use hrms;
-- Display the salary of lex
select salary
from employees
where first_name = 'lex';

/* subquary 
^ (it is a quary inside another quary)
^ the inner quary execute first
^ the output/s of inner quary is/are passed to the upper quary
^ then only the outer/upper qquary executes and output is displayed in screen/result grid
^ single row subquary return only one row and one column

 */

-- display  the emp who earns more than lex
select  first_name , salary
from employees
where salary>(select salary from employees where first_name ='lex');

-- display the name of employees who works in the same department as daniel

-- using subquaries
select first_name
from employees 
where department_id= (select department_id from employees where first_name ='daniel')
and first_name <> 'daniel';



-- display the name of emp who reports to steven
-- using subquary
select first_name
from employees
where manager_id =(select employee_id from employees where first_name ='steven');

-- using join
select e.first_name
from employees e, employees e1
where e.manager_id = e1.employee_id
and e1.first_name='steven';

-- display the name of the emp who are working in executive dept

-- using join
select e.first_name
from employees e, departments d
where e.department_id = d.department_id
and d.department_name='executive';

-- using subquary
select first_name
from employees
where department_id = (select department_id from departments where department_name='executive');


-- display the name of the person who earns the maximum salary
select first_name
from employees
where salary = (select max(salary) from employees);

-- display the name of person who earns the minimum salary in depatment 5
select first_name
from employees
where salary= (select min(salary) from employees where department_id=5);


-- display the name of the person more than the avg salary
select first_name
from employees
where salary >(select avg(salary) from employees);









-- multirow subquary (where the subquary returns more than 1 row 

-- display the name of emp who arewworking in executive of finance
-- way 1
select first_name,department_id
from employees
where department_id in (select department_id from departments where department_name in('executive','finance'));

-- way2
	select first_name,department_id
	from employees
	where department_id = (select department_id 
						  from departments 
						  where department_name =('executive')	)
	or
	department_id = (select department_id 
					  from departments 
					  where department_name =('finance')	)
					  
	order by department_id;


-- display the emp who are working under manager 100 and salary less than that of adam
select  first_name,salary,manager_id
from employees
where manager_id in (select employee_id from employees where first_name ='steven')
and
salary<(select salary from employees where first_name ='adam');

-- display the city of dept executive, finance

select city
from locations
where location_id in (select location_id from departments where department_name in ('executive','finance'));

-- display first name , dept name of emp working in it department
select e.first_name , d.department_name
from employees e, departments d
where e.department_id=d.department_id
and d.department_id in (select d.department_id from departments d  where d.department_name ='it');


-- display the minimum salary of each department whoes min salaryis less than the minium salary of dept5
select min(e.salary), department_id
from employees e
where e.salary <  (select min(salary) from employees e where e.department_id=8)
group by  e.department_id
