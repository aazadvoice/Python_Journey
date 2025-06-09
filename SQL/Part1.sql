create database cdac;
-- switch to the database
use cdac;
-- the name of the current database in which you are working right now with Alias
-- Alias are the new name for the column which is applicaple in this query itself
select database as "Name of the Database"; 

-- the list of databases created

show databases;
-- the list of tables created
show tables;

create table student(rollno int,
sname varchar(20),
age int,
phone_no bigint,
dob date,
city varchar(30));

-- display the structure of the table
desc student;
-- insert a record to the table student
insert into student values(10,'ritu',23,58585785,'2010-03-11','Noida');
insert into student values(11,'kiran',4,5546685,'2003-03-11','delhi');
insert into student values(10,'ritu',23,58585785,'2010-03-11','Noida');
insert into student(rollno,sname,age)values(15,'aaa',66);
insert into student(rollno,sname,age)values(16,'ccc',66),(18,'ccc',66),(17,'ccc',66),(16,'ccc',66);
select * from student;

-- create a table student where each student must be uniquely identified by their roll number. 
/* constraints are the rules on a table. 
there are 5 types of constraints
1.Primary key
2. foreighn key
3. Not null
4.check 
5. unique
create constarints at 2 levels. 
column level
table level

*/ 

-- create PK constarints at column level 

create table student1(
rollno int primary key,
sname varchar(20),
age int,
phone_no bigint,
dob date,
city varchar(30));

desc student1;

insert into student1 values(10,'ritu',23,58585785,'2010-03-11','Noida');
insert into student1 values(11,'kiran',4,5546685,'2003-03-11','delhi');
insert into student1 values(12,'ritu',23,58585785,'2010-03-11','Noida');


select * from student1;

-- create PK constarints at table level 

create table customer(
cid int ,cname varchar(20),age int,
phone_no bigint,dob date,
city varchar(30),
primary key(cid,phone_no));

desc customer;

show tables;

drop table student;
drop table student1;
select * from student1;
truncate table customer;
select * from customer;
insert into customer values(10,'ritu',23,58585785,'2010-03-11','Noida');
insert into customer values(11,'kiran',4,5546685,'2003-03-11','delhi');
insert into customer values(10,'ritu',23,1,'2010-03-11','Noida');
insert into customer values(12,'ritu',24,58585785,'2010-03-11','Noida');

-- create a course table

create table course(cid varchar(20) primary key, cname varchar(40) );
create table student(
rollno int primary key,
sname varchar(20),
age int,
cid varchar(20),
constraint fk1 foreign key(cid) references course(cid));


insert into course values('c1','PGDBDA'),('c2','PGDAC'),('c3','PGDAI'),('c4','PGDMC');

insert into student values(101,'aaa',10,'c1');

insert into student values(102,'aaa',10,'c1');

insert into student values(103,'aaa',10,'c8');

#28/02/2025

#not null constraint
use cdac;


create table student1(
rollno int primary key,
sname varchar(20) not null,
age int,
phone_no bigint,
dob date,
city varchar(30) not null);

insert into student1 values(10,'ritu',23,58585785,'2010-03-11','Noida');
insert into student1 (rollno, sname,city) values(14, 'neha', 'noida');


#how to give default value
create table student2(
rollno int primary key,
sname varchar(20) not null default 'xxxxxx',
age int default 18,
phone_no bigint,
dob date,
city varchar(30) not null );

insert into student2 (rollno, sname,city) values(12, 'neha', 'noida');
select * from student2

#we canot give default value to primary key
create table student3(
rollno int primary key default 16,
sname varchar(20) not null default 'xxxxxx',
age int default 18,
phone_no bigint,
dob date,
city varchar(30) not null );

insert into student3 ( sname,city) values( 'neha', 'noida');
insert into student3 ( sname,city) values( 'seha', 'noida');

desc student2;


#to check need to see foreign key 
select * from information_schema.key_schema_usage;

#when we need information about table
select * from information_schema.check_constraints;


#check constraint
# example age of the student must be  less than 40
# also city must be noida/pune/banglore


#way 1
create table student4(
rollno int primary key ,
sname varchar(20) not null default 'xxxxxx',
age int check (age<=40),
phone_no bigint,
dob date,
city varchar(30) not null check (city in ('noida','pune','banglore' )));

insert into student4 values(14, 'neha',24,34456435,'2000-02-23', 'noida');
insert into student4 values(15, 'sneha',30,34456435,'2000-02-23', 'delhi');


#way2

#way 1
create table student5(
rollno int primary key ,
sname varchar(20) not null default 'xxxxxx',
age int,
phone_no bigint,
dob date,
city varchar(30) not null check (city in ('noida','pune','banglore' )),
constraint check1_student5 check (age between 18 and 30));

insert into student5 values(14, 'neha',24,34456435,'2000-02-23', 'noida');
insert into student4 values(15, 'sneha',18,34456435,'2000-02-23', 'delhi');

desc student5;





#unique constraint

create table student6(
rollno int primary key ,
sname varchar(20) not null default 'xxxxxx',
age int,
phone_no bigint unique, #column level
dob date,
email_id varchar(50),
city varchar(30) not null check (city in ('noida','pune','banglore' )),
constraint check1_student6 check (age between 18 and 30),
constraint unique1_emailid unique(email_id)); #table level

desc student6;
insert into student6 values(1116, 'nehaa',24,34456435,'2000-02-23', 'saty@gmail.com', 'noida');
insert into student6 values(1115,'satyam',28,344556435,'2000-02-24', 'saaaaty@gmail.com', 'noida');
insert into student6 values(1117,'satyam',28,null ,'2000-02-24', 'saady@gmail.com', 'noida');
 select * from student6;
 
 
 create table student7(
rollno int primary key ,
sname varchar(20) not null default 'xxxxxx',
age int,
phone_no bigint unique, #column level
dob date,
email_id varchar(50),
cid varchar(20),
city varchar(30) not null check (city in ('noida','pune','banglore' )),
constraint check7 check (age between 18 and 30),
constraint unique7_emailid unique(email_id), #table level
constraint fk_cid_student7 foreign key (cid) references course (cid));


#update command
select * from student;

use cdac;
update student2
set phone_no=1121212
where rollno =12;



#delete command
delete from student where rollno in (1,2);

# ADD AUTOINCREMENT IN A PRIMARY KEY COLUMN OF A TABLE
#ONLY ONE AUTO INCREMENT COLUMN

CREATE TABLE PRODUCT(
ITEM_ID INT AUTO_INCREMENT,
ITEM_NAME VARCHAR(50), 
QTY INT CHECK (QTY>0), 
PRICE REAL,
PRIMARY KEY(ITEM_ID));


INSERT INTO PRODUCT VALUES (1001, 'SUGAR',3,6000);


ALTER TABLE PRODUCT AUTO_INCREMENT=5000;
INSERT INTO PRODUCT (ITEM_NAME, QTY,PRICE) VALUE 
('RICE11', 2, 50000),
('WHEAT11',3,8000),
('BARELY11',3, 6000);

SELECT * FROM PRODUCT;


TRUNCATE TABLE PRODUCT;


COMMIT;






/* ALTER COMMAND (IT ALLOW TO CHANGE TH STRUCTURE OF THE TABLE) LIKE
1) ADD COLUMN/s
2) MODIFY A COLUMN/s
3) DROP COLUMN/COLUMNS
4) RENAME THE COLUMN
5) ADD CONSTRAINT
6) MODIFY CONSTRAINT
7) DROP CONSTRAINT */

#1) ADD COLUMN/s
create table students(
rollno int primary key ,
sname varchar(20) not null default 'xxxxxx',
age int default 18,
dob date,
city varchar(30) not null );

alter table students add phone_no bigint;
alter table students add marks decimal;
alter table students add country varchar(50), add zip bigint;
alter table students add email_id varchar(50) not null default 'xxxxx';

desc students;



#2) MODIFY A COLUMN/s ( we can change data type, constraints(only not null), size 

#remove the not null constraint from city
alter table students modify city varchar(50);

#remove the default value email id column
alter table students modify email_id varchar(50);

#modify the default size of varchar from 40 to 60
alter table students modify city varchar (60);

#modify the zip datatype to medium int
alter table students modify zip mediumint;




#3) DROP COLUMN/COLUMNS

alter table students drop zip;
alter table students drop city, drop column country;
alter table students add city varchar(50), drop column age ;

#4) RENAME THE COLUMN
alter table students change column sname  student_name varchar(50);
alter table students rename column dob to date_of_birth;

desc students;

#5) ADD CONSTRAINT
create table student_info(
rollno int ,
sname varchar(20),
age int ,
phone_no bigint,
dob date,
city varchar(30) );

alter table student_info add primary key(rollno);
alter table student_info modify rollno int auto_increment;

#add not null constrant on sname and age column
alter table student_info modify sname varchar(50) not null;
alter table student_info modify age  int not null;


#add a check contraint on age column
alter table student_info add constraint check_age check (age <= 18 and age >= 60);

#add a unique constraint on phone number
alter table student_info add constraint unique_phone_no1 unique(phone_no);

#add a column cid in student info
alter table student_info add column cid int;
alter table student_info modify cid varchar(20);

#add a foreign key constraint on cid
alter table student_info add constraint fk_cid_student_info foreign key (cid) references course(cid);

#7) DROP CONSTRAINT */

#remove the not null constraint from age column
alter table student_info modify age int;

#remove the primary key
alter table student_info  modify rollno int;
alter table student_info  drop primary key;

#drop a check constraint by its name from the table
alter table student_info drop constraint check_age;

#drop a unique constraint by its name from the table
alter table student_info drop constraint unique_phone_no1;

#drop a foreign key constraint by its name from the table
alter table student_info drop constraint fk_cid_student_info;
desc student_info;
