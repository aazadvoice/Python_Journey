create database cdac_3_march;
use cdac_3_march;
drop database cdac_3_march;


create database university;

use university;

create table student(
rollno int ,
name varchar(40),
degree varchar (40),
year int,
deptno int,
advisior varchar(30),
primary key (rollno));

insert into student values(20251,'aazad','ece',2016,103, 02);
insert into student values(20252,'mishra_ji','cce',2016,102, 01);
select * from student;
alter table student modify advisior int;

create table department(
deptId int,
name varchar(40),
hod varchar(40),
phone bigint,
primary key (deptId));

insert into department (deptId,name,phone) values (101,'CSE',987654),(102, 'CSE_DS',547587),(103,'ECE',5758485);
update department set hod = 01 where deptId = 101;
update department set hod = 02 where deptId = 102;
select * from department;

alter table department modify hod int;
alter table student add constraint fk2 foreign key  (deptno) references department(deptId);
alter table student add constraint fk4 foreign key  (advisior) references professor(empId);
alter table department add constraint fk5 foreign key  (hod) references professor(empId);
create table professor(
empId int,
name varchar(40),
sex varchar(40),
startYear int,
deptNo int,
phone bigint,
primary key(empId),
constraint fk1 foreign key (deptNo) references department(deptId));

insert into professor values (01,'chandrashekhar','M', 2023,101,987654);
insert into professor values (02, 'tripti_sharma','F',2012,102,98969969);

select * from professor;

create table course(
courseId int,
ename varchar(30),
credits int,
deptNo int,
primary key(courseId),
constraint fk3 foreign key (deptNo) references department(deptId));

insert into course values(316,'coa',3,101),(317,'data_structure',3,102);
select * from course;


create table enrollment(
rollno int,
courseId int,
sem int,
year int,
grade varchar(2),
primary key (rollno,courseId,sem,year));

alter table enrollment add constraint fk6 foreign key  (rollno) references student(rollno);
alter table enrollment add constraint fk11 foreign key  (courseId) references course(courseId);

insert into enrollment values (20251,316,3,2018,'A+'),(20252,317,3,2018,'A');
SELECT * from enrollment;



create table teaching(
empId int,
courseId int,
sem int,
year int,
classRoom int,
primary key(empId, courseId,sem,year),
constraint fk7 foreign key (empId) references professor(empId),
constraint fk8 foreign key (courseId) references course(courseId));

create table preRequistic(
preReqcourse int(40),
courseId int,
primary key(preReqcourse, courseId),
constraint fk9 foreign key (preReqcourse) references course(courseId),
constraint fk10 foreign key (courseId) references course(courseId));

insert into preRequistic values ( 316, 317);













create database HRMS;

USE HRMS;
CREATE TABLE regions (
	region_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT (11) NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) 
);

CREATE TABLE locations (
	location_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) 
);

CREATE TABLE jobs (
	job_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);

CREATE TABLE departments (
	department_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT (11) DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) 
);
select * from department;
CREATE TABLE employees (
	employee_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT (11) NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT (11) DEFAULT NULL,
	department_id INT (11) DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);
select * from employees;

CREATE TABLE dependents (
	dependent_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT (11) NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) 
);

/*Data for the table regions */

INSERT INTO regions(region_id,region_name) VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) VALUES (4,'Middle East and Africa');


/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);

/*Data for the table locations */
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');


/*Data for the table jobs */

INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);


/*Data for the table departments */

INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (11,'Accounting',1700);



/*Data for the table employees */

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);


/*Data for the table dependents */

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (30,'Sandra','Taylor','Child',176);



#some basic quaries

select 100+200 as 'output';
select now();  #give date and time
select round(78.90); #round off



select * from employees limit 5; #restrict the no of row in display

select * from employees limit 2,5; #restrict and skipping first 2 record to display



#sort the data by a particular column in ascending order

select * from employees    #sort in asceding order
order by salary;

select * from employees  #sort in desceding order
order by salary desc;



#display all the emp records in asceding order of their dept and  desceding order of their sallery
select * from employees
order by department_id asc, salary desc;

#display emp id and name
select employee_id, first_name from employees;

#display emp name , salary and date of joining  and sorted order by salary
select first_name, last_name , salary, hire_date 
from employees
order by salary desc;


#display emp name , salary and date of joining  and top 5 earner
select concat_ws(' ', first_name, last_name) "Employee_name", salary, hire_date 
from employees
order by salary desc 
limit 5;


select first_name , salary "monthaly  ", salary*12 "yearly"
from employees
order by yearly desc;


#distinct
# for example display all dept id in organization
select distinct department_id from employees;
select distinct job_id from employees;
select distinct manager_id from employees;



#restrict rows
select * from employees
where department_id =5;

#display the name job, doj, of all emp working in dept 10
select first_name , last_name,department_id,hire_date from employees
where department_id =10;


#display the name job, doj, of all emp steven
select first_name , last_name,department_id,hire_date from employees
where first_name ='steven';


#display the name job, doj, of all emp whoes job id is 19
select first_name , last_name,department_id,hire_date, salary from employees
where job_id=19
order by salary;

#display the name job, doj, of all emp whoes job id is not 19
select first_name , last_name,department_id,hire_date, salary from employees
where job_id!=19
order by salary;

#display the emp who not has a manager
select employee_id,first_name , manager_id 
from employees
where manager_id is null;

#display the emp who has a manager
select employee_id,first_name , manager_id 
from employees
where manager_id is not null;


/* =,<,<=,>,>=,!> relational operator
and , or , not logical operators
additional operators between, in,like */


#display the name, salary and hire date of all employees whose salary is greater than 8000.
select employee_id, first_name,salary
from employees
where salary >8000;


#display the name, salary and hire date of all employees whose salary is less than or 8000.
select employee_id, first_name,salary
from employees
where salary <= 8000;

#display the name, salary and hire date of all employees whose join date after 1990.
select employee_id, first_name,salary
from employees
where hire_date > '1989-12-31';

#display the name and salary and department of all employees whose working in dept 8 and sallary greater than 8000
select  first_name,salary, department_id
from employees
where department_id=8 and salary >8000;

#display the name and salary and department of all employees whose managed by 100 and job id 5
select  first_name,salary, department_id
from employees
where manager_id=100 and job_id=5;

#display the name and salary and department of all employees whose salary greater than 8000 and less thss than 20000
select  first_name,salary, department_id
from employees
where salary between 8000 and 20000;


#display the emp detail who join in 1990
select  first_name,salary, department_id, hire_date
from employees
where hire_date between '1990-01-01' and '1990-12-31';


#display the emp detail whoese work  in either dept 8,3 and 5

#way1
select * from employees
where department_id = 5 or department_id= 8 or department_id=3;

#way2
select * from employees
where department_id in (5,3,8,100);
departments



#04_march-2025

use hrms;
#display the dept name of department 5 and 3
select department_name 
from departments
where department_id in (5,3);


#display the city and street address of location 1700
select city ,street_address
from locations
where location_id = 1700;


#display the job title of job id 5
select job_title
from jobs
where job_id =5;



#display the name and salary and manager id of employees managed by 100,108 in asc order of their salary
select concat(first_name, ' ',last_name) , salary , manager_id
from employees
where manager_id in (100,108)
order by salary desc, manager_id asc;



#display emp detail who work as job id 3/6/9nand their salary is greater than 15000
select * from employees
where job_id in (3,6,9) and salary > 8000;


#display the emp working in any dept 10 or 11 and their salary in between 8000 and 15000
select concat(first_name ,' ' , last_name)
from employees
where department_id in (10,11) and salary  between 8000 and 15000;




#like operator
select first_name
from employees
where first_name  like 'S%'; #here % use to display any charater/s after S


select first_name
from employees
where first_name  like '%n'; ; #end at n preceded by any charater

select first_name
from employees
where first_name  like '%en'; #last char is en preceded by any

select first_name
from employees
where first_name  like '%ar%'; #charter in between ar or start with ar or end ar

#the name where second char is e
select first_name
from employees
where first_name  like '_e%';




#create a another table with same structure and data
create table emp1 as select * from employees ;
desc emp1;


#create a another table withs same structure but no data
create table emp2 as 
select * from employees
where 100=200; #false comdition

select * from emp2;


# create a another table where only depatment_id , salary, first_name will come of those emp who has dept_id is 5 0r 10
create table emp3 as 
select department_id, salary, first_name from employees
where department_id in (5,10);

select * from emp3;

# take data from another table
create table demo (
emp_name varchar(30),
departmentIid int);
 

insert into demo values ('aazad',5);
insert into demo  select concat(first_name , ' ' , Last_name), department_id
from employees
where department_id =5;

select * from demo;









/* JOIN
It is a technique of wrting sql quaries to fetch data from more than one tables
*/



#CROSS JOIN
 select first_name , department_name
 from employees,departments;
 
 
 
 
 
 #INNER JOIN
 
 #as per 2000 standard quary (display the dept name of rach employee
 select first_name, department_name
 from employees, departments
 where employees.department_id = departments.department_id  ;
 
 #using alias to short the name
select e.first_name, d.department_name,e.department_id
 from employees e, departments d
 where e.department_id = d.department_id ;
 
 #as per 1990 standard quary
 select e.first_name, d.department_name
 from employees e
 inner join departments d on e.department_id = d.department_id;
 
 
 #if we have n tables in the form clause then we must have n-1 join condition
 #print the department name of steaven
 select e.first_name, d.department_name
 from employees e, departments d
 where e.department_id = d.department_id and e.first_name='Steven';
 
 
 #print the name and department name and salary of all employees woekig in purshaing department
 select e.first_name, d.department_name,e.salary
 from employees e, departments d
 where e.department_id = d.department_id and d.department_name = 'Purchasing';
 
 #print the name and department name and salary of all employees woekig in purshaing department and salary more than 1000
 select e.first_name, d.department_name,e.salary
 from employees e, departments d
 where e.department_id = d.department_id and d.department_name = 'Purchasing' and e.salary >10000;
 
 #print the job title of each employee
 select e.first_name, j.job_title
 from employees e, jobs j
 where e.job_id = j.job_id ;
 
 
  #print the name,salary of the empwho work as accountant
 select e.first_name,e.salary, j.job_title
 from employees e, jobs j
 where e.job_id = j.job_id and job_title= 'accountant' ;
 
 
  #print the name,salary,job title and dept name  of the each emp and sorted order by salary
 select e.first_name,e.salary, j.job_title,d.department_id
 from employees e, jobs j, departments d
 where e.job_id = j.job_id and e.department_id= d.department_id
 order by e.salary;
 
   #print the employee name,department name and city in which they are working
 select e.first_name,e.last_name, l.city,d.department_name
 from employees e, locations l, departments d
 where d.location_id = l.location_id and e.department_id= d.department_id and l.city='southlake';
 
 
 create table job_grades(lowest_sal decimal(8, 2),higest_sal decimal(8, 2),grade char);
insert into job_grades values(1000,3000,'E');
insert into job_grades values(3001,5000,'D');
insert into job_grades values(5001,8000,'C');
insert into job_grades values(8001,15000,'B');
insert into job_grades values(15001,25000,'A');

select * from job_grades;

#example non equijoin (inner join)
select e.first_name, e.salary,j.grade
from employees e, job_grades j
where e.salary between j.lowest_sal and j.higest_sal;



#inner join (self join performed using equijoin)
#display the emp name and their respective manager name

#using 2000 standard format
select e1.first_name 'worker',e1.manager_id,
e2.employee_id,e2.first_name 'manager'
from employees e1, employees e2
where e1.manager_id=e2.employee_id and e1.first_name ='alexander';

#using 1990 standard format
select e1.first_name 'worker',e1.manager_id,
e2.employee_id,e2.first_name 'manager'
from employees e1 inner join employees e2
on e1.manager_id=e2.employee_id;




/* outer join
1 left outer join
2 right outer join
3 full outer join */

insert into employees values (300,'siddhi','nayak','sn@gmail.com',868969,'2000-11-12',5,3453,100,null);
insert into employees values (301,'siddhu','moosewala','sn@gmail.com',868969,'2000-11-12',5,3453,100,null);
insert into employees values (302,'Rajat','dalal','sn@gmail.com',868969,'2000-11-12',5,3453,100,null);

# display the dept name of each empee including the emp who are not part of any dept
 select e.first_name, d.department_name
 from employees e left  join departments d
on e.department_id = d.department_id;

