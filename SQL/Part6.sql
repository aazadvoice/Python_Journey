
use hrms;
-- display the name of the employees who is managing atlest one employee
select first_name
from employees e
where employee_id in (select distinct(manager_id) from employees)
and manager_id is not null;

-- display emp who do not manage anyone
select first_name
from employees e
where employee_id  not in (select (manager_id) from employees )
and manager_id is  null;


-- display the sallary of employees who works as programmer

-- using join
select salary
from employees e , jobs j
where e.job_id= j.job_id 
and job_title = 'programmer';

-- using subquary
select salary
from employees
where job_id =(select job_id from jobs where job_title = 'programmer');

-- display the name , sallary of emp whoes sallary is equal to any of the emp working as job id 9
select distinct(e1.first_name), e1.salary
from employees e, employees e1
where  e.job_id = e1.job_id
and e.job_id =9;


-- using sub quary
select e.first_name, e.salary, e.job_id
from employees e
where salary = any  (select salary from employees where job_id = 9)  
and 
e.job_id not in (select job_id from employees where job_id=9);

-- display the name , sallary of emp whoes sallary is less than  any of the emp working as job id 9
select e.first_name, e.salary, e.job_id
from employees e
where salary < any (select salary from employees where job_id = 9)  
and 
e.job_id not in (select job_id from employees where job_id=9);

-- display the name , sallary of emp whoes sallary is more than any of the emp working as job id 9
select e.first_name, e.salary, e.job_id
from employees e
where salary > any (select salary from employees where job_id = 9)  
and 
e.job_id not in (select job_id from employees where job_id=9);

-- display the name , sallary of emp whoes sallary is less than every emp working as job id 9
select e.first_name, e.salary, e.job_id
from employees e
where salary >= all (select salary from employees where job_id = 9)  
and 
e.job_id not in (select job_id from employees where job_id=9);

-- display the name and salary  of emp who gets or earrn more than avg (salary) in their department
select e.first_name, e.salary, e2.average
from employees e , (select department_id , avg(salary) as 'average' from employees group by department_id) e2
where e.department_id = e2.department_id
and e.salary > e2.average;




where salary in( select avg(e1.salary) from employees e1 group by department_id) 
and e.department_id = e1.department_id
and e.salary > (avg(e1.salary))




select avg(salary) from employees where department_id =9
