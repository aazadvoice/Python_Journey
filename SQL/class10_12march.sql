

/* Loop
their are 3 types of loop
1. while loop
2. loop
3. repeat loop
*/




# while loop example

#way 1
delimiter %%
create procedure while_example()
begin
declare i int;
set i = 1;
while i < 10 do
select  i ;
set i = i +1;
end while;
end%%  

#way2
delimiter %%
create procedure while_example1()
begin
declare i int;
declare str1 varchar(40);
set i = 1;
set str1= ' ';
while i < 10 do
set str1 = concat(str1, i,' ');
SELECT str1;
set i = i +1;
end while;
end %%  

drop procedure factorial;
# fACTORIAL OF A GIVEN NO USING WHILE LOOP
delimiter %%
create procedure factorial(in num bigint)
begin
declare  i int ;
declare fact bigint;
declare str1 varchar(40);
set i = 1;
set fact = 1;
set str1= ' ';

while i <= num do
	
	
	set fact= fact * i;
    set str1 = concat(str1, fact,' ');
    SELECT str1;
	set i = i+1;
end while;
end%%


drop procedure  loop_example;
#loop example

#WAY 1
delimiter %%
create procedure loop_example()
begin
	declare i int;
	set i = 1;
	loop1: loop
		if i > 10 then
			leave loop1;
		else
			select i;
            
			iterate loop1;
		end if;
	end loop;
end%%  

#WAY 2
delimiter %%
create procedure loop_example1()
begin
	declare i int;
    declare str varchar(40);
	set i = 1;
    SET str =' ';
	loop1: loop
		if i > 10 then
			leave loop1;
		else
        set i = i+1;
        set str = concat(str, i,'');
		select str;
		iterate loop1;
		end if;
	end loop;
end%%  

# repeat loop 
delimiter %%
create procedure mysql_test_repeat_loop()
begin
declare x int ;
declare str varchar(255);
set x = 1;
set str = '';
repeat
 set str = concat (str, x, '');
 set x = x+1;
 until x>5
 end repeat;
 select str;
 end %%

drop procedure squareof5
# print  square of multiplication of 5 till 5000;
delimiter $$
create procedure squareof5()
begin
declare i int;
declare str varchar(255);
set i = 5;
set str = '';
repeat
 set str = concat(str,i,'  ');
 set i = i*5;
 until i >5000
 end repeat;
 select str;
 end$$
 
 
 
 
 
 
 #TRIGGER
 
  CREATE DATABASE TRIGGER_;
  USE TRIGGER_;
  
 CREATE TABLE contacts
( contact_id INT(11) NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(30) NOT NULL,
  first_name VARCHAR(25),
  birthday DATE,
  created_date DATE,
  created_by VARCHAR(30),
  CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);

DELIMITER //
CREATE TRIGGER contacts_before_insert
BEFORE INSERT
   ON contacts FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);

   -- Find username of person performing INSERT into table
   SELECT USER() INTO vUser;

   -- Update create_date field to current system date
   SET NEW.created_date = SYSDATE();

   -- Update created_by field to the username of the person performing the INSERT
   SET NEW.created_by = vUser;

END; //

desc contacts;
insert into contacts(first_name,last_name, birthday)
values("ssssssss","qdqd",'2022-08-08');

select * from contacts;


-- https://www.techonthenet.com/mysql/triggers/before_insert.php


-- after insert

CREATE TABLE contacts1
( contact_id INT(11) NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(30) NOT NULL,
  first_name VARCHAR(25),
  birthday DATE,
  CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);

CREATE TABLE contact_audit
( contact_id INT(11) NOT NULL AUTO_INCREMENT,
  created_date DATE,
  created_by VARCHAR(30),
  CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);

--     We could then use the CREATE TRIGGER statement to create an AFTER INSERT trigger as follows:

DELIMITER //

CREATE TRIGGER after_insert_trigger
AFTER INSERT
   ON contacts1 FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);

   -- Find username of person performing the INSERT into table
   SELECT USER() INTO vUser;

   -- Insert record into audit table
   INSERT INTO contact_audit
   ( contact_id,
     created_date,
     created_by)
   VALUES
   ( NEW.contact_id,
     SYSDATE(),
     vUser );

END//

insert into contacts1 values(101,"qw","qd",'2019-08-06');
SELECT * FROM CONTACTS1;
select * from contact_audit;

-- before update

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);


INSERT INTO sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2003 Harley-Davidson Eagle Drag Bike',120, 2020,1),
    ('1969 Corvair Monza', 150,2020,1),
    ('1970 Plymouth Hemi Cuda', 200,2020,1);
    
    select * from sales;
    
DELIMITER $$

CREATE TRIGGER before_sales_update
BEFORE UPDATE
ON sales FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('The new quantity ',
                        NEW.quantity,
                        ' cannot be 3 times greater than the current quantity ',
                        OLD.quantity);
                        
    IF new.quantity > old.quantity * 3 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END $$

DELIMITER ;

/* The trigger is automatically fired before an update event occurs for each row in the sales table.

If you update the value in the quantity column to a new value that is 3 times greater than the current value, the trigger raises an error and stops the update.*/

update  sales set quantity=200 where id=1;

update  sales set quantity=2000 where id=1;

DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);

INSERT INTO Sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2001 Ferrari Enzo',140, 2021,1),
    ('1998 Chrysler Plymouth Prowler', 110,2021,1),
    ('1913 Ford Model T Speedster', 120,2021,1);


SELECT * FROM Sales;

DROP TABLE IF EXISTS SalesChanges;

CREATE TABLE SalesChanges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesId INT,
    beforeQuantity INT,
    afterQuantity INT,
    changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- create a trigger on after update

DELIMITER $$

CREATE TRIGGER after_sales_update
AFTER UPDATE
ON sales FOR EACH ROW
BEGIN
    IF OLD.quantity <> new.quantity THEN
        INSERT INTO SalesChanges(salesId,beforeQuantity, afterQuantity)
        VALUES(old.id, old.quantity, new.quantity);
    END IF;
END$$

DELIMITER ;
update  sales set quantity=200 where id=1;
update  sales set quantity=300 where id=2;
SELECT * FROM Sales;

select * from SalesChanges;

/* This after_sales_update trigger is automatically fired before an update event occurs for each row in the sales table.

If you update the value in the quantity column to a new value the trigger insert a new row to log the changes in the SalesChanges table.*/

-- before delete
-- BEFORE DELETE triggers are fired automatically before a delete event occurs in a table.

DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0
);
INSERT INTO salaries(employeeNumber,validFrom,amount)
VALUES
    (101,'2020-01-01',5300),
    (102,'2021-01-01',4000),
    (103,'2022-01-01',5600);


DROP TABLE IF EXISTS SalaryArchives;    

CREATE TABLE SalaryArchives (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeNumber INT ,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0,
    deletedAt TIMESTAMP DEFAULT NOW()
);

/* The following BEFORE DELETE trigger inserts a new row into the SalaryArchives table before a row from the Salaries table is deleted.*/

DELIMITER $$

CREATE TRIGGER before_salaries_delete
BEFORE DELETE
ON salaries FOR EACH ROW
BEGIN
    INSERT INTO SalaryArchives(employeeNumber,validFrom,amount)
    VALUES(OLD.employeeNumber,OLD.validFrom,OLD.amount);
END$$    




select * from salaries;

DELETE FROM salaries 
WHERE employeeNumber = 102;

select * from SalaryArchives;

-- The trigger was invoked and inserted a new row into the SalaryArchives table.

-- after delete trigger
DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0
);
-- insert data to the salaries table
INSERT INTO Salaries(employeeNumber,salary)
VALUES
    (102,5000),
    (106,7000),
    (107,8000);

-- Create the salary budget table.    
DROP TABLE IF EXISTS SalaryBudgets;

CREATE TABLE SalaryBudgets(
    total DECIMAL(15,2) NOT NULL
);


INSERT INTO SalaryBudgets(total)
SELECT SUM(salary) 
FROM Salaries;

-- The AFTER DELETE trigger updates the total salary in the SalaryBudgets
--  table after a row is deleted from the Salaries table:

CREATE TRIGGER after_salaries_delete
AFTER DELETE
ON Salaries FOR EACH ROW
UPDATE SalaryBudgets 
SET total = total - old.salary;


-- check the trigger
SELECT * FROM SalaryBudgets;    
 
-- delete a row from the Salaries table:

DELETE FROM Salaries
WHERE employeeNumber = 106;
-- again check the Salarybudgets table

SELECT * FROM SalaryBudgets;    








 

