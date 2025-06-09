use hrms;

#self join example
#dISPLAY THE NAME, HIREDATE OF EMP WHO JOIN WITH DAVID OR AFTER DAVID
select e1.first_name, e1.hire_date
from employees e, employees e1
where e.first_name  = 'david'and 
 e.hire_date >= e1.hire_date and
 e1.first_name <>'david';
 
 
 #DISPLAY THE NAME , HIREDATE OF,MANAGER NAME OF EMP WHO HAS JOINED BEFORE THEIR MANAGER
 select e.first_name,e.hire_date,m.first_name
 from employees e, employees m
 where e.manager_id = m.employee_Id
 and e.hire_date<m.hire_date;
 
 
 /* functions in MYSQL
 Their are two type of function
 1. single row function (it will operate on each row individually and return single output for each row)
 

 2. Multi row function (it will operate on multipkle row but return a single output for all)
  
  
all Group function are multi row function
 aggregate function// aggregated value // summarised analysis*/
 
 
 #example of single row function
 select upper('HELLO WORLD');
 select first_name, upper(first_name), last_name, lower(last_name)
 from employees;
 
 #example of multi row functiomn
 select sum(salary)'total monthaly salary'
 from employees;
 
select avg(salary)'total average monthaly salary'
from employees;

 select round(sum(salary))'total monthaly salary'
 from employees;
 
 select min(salary) 'minimun', max(salary) 'maximum'
 from employees;
 
select sum(salary*12) 'avg monthaly salary'
from employees;

select max(salary)-min(salary) "difference"
from employees;

select count(*) from employees;
select count(manager_id) from employees;

#display the sum salary of department 5
select sum(salary)
from employees
where department_id=5;

#display the sum salary and maximum salary of purchasing dept
select sum(salary), max(salary)
from employees e, departments d
where e.department_id = d.department_id
and department_name = 'purchasing';

#count the number of employees whose salary is between 1000 to 20000
select count(*)
from employees
where salary between 10000 and 20000 ;



#print the total salary for each unique department
select department_id,sum(salary) as 'total'
from employees
group by department_id
order by department_id asc,total desc;

#display the max salary and min salary of each department who has joined after the year 1990
select department_id,max(salary) as max, min(salary) as min
from employees
where hire_date > '1990-12-31'
group by department_id
order by department_id asc;

#display the max salary and min salary of each department name who has joined after the year 1990
select d.department_name, max(salary) as max, min(salary) as min
from employees e , departments d
where e.department_id = d.department_id
and hire_date >= '1990-12-31'
group by d.department_name;


#display the totalm slary of dept 3,6,9
SELECT department_id, sum(salary)
FROM employees
WHERE department_id IN (3,6,9)
GROUP BY department_id;


#display only sum salary is grater than 10000
SELECT department_id, sum(salary)
FROM employees
group by department_id
having sum(salary)>10000
order by sum(salary);

#display the manger id of those emp who manages atlest 5 emp
select manager_id, count(manager_id)
from employees
group by manager_id
having count(manager_id) >5;

#display job title where min salarry is greater than 5000
select job_title
from jobs
where min_salary >5000; 

#display the cities where the most no of departments are there
select (city), count(city)
from locations l, departments d
where l.location_id = d.location_id
group by l.location_id
order by count(city) desc
limit 1;



select department_id, job_id, max(salary)
from employees
group by department_id

