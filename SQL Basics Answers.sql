 -- Question 1: Create a New Database comapny_db and  Table for Employees
CREATE SCHEMA company_db;

CREATE TABLE company_db.employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
salary INT,
hire_date DATE
);

 -- Question 2: Insert Data into Employees Table
INSERT INTO company_db.employees (employee_id,first_name,last_name,department,salary,hire_date)
VALUES (101,'Amit','Sharma','HR',50000,'2020-01-15'),
(102,'Riya','Kapoor','Sales',75000,'2019-03-22'),
(103,'Raj','Mehta','IT',90000,'2018-07-11'),
(104,'Neha','Verma','IT',85000,'2021-09-01'),
(105,'Arjun','Singh','Finance',60000,'2022-02-10');


-- Question3: Display All Employee Records Sorted by Salary (Lowest to Highest)
SELECT * FROM employees
ORDER BY salary ASC;

-- Question4: Show Employees Sorted by Department (A–Z) and Salary (High → Low)
SELECT first_name FROM employees
ORDER BY department ASC,salary DESC;

-- Question5: List All Employees in the IT Department, Ordered by Hire Date (Newest First)
SELECT * FROM employees
WHERE department='IT' 
ORDER BY hire_date DESC;

-- Question6: Create and Populate a Sales Table
CREATE TABLE sales (
sale_id  INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(50),
amount INT,
sale_date DATE
);

INSERT INTO sales (customer_name,amount,sale_date)
VALUES ('Aditi',1500,'2024-08-01'),
('Rohan',2200,'2024-08-03'),
('Aditi',3500,'2024-09-05'),
('Meena',2700,'2024-09-15'),
('Rohan',4500,'2024-09-25');


-- Question 7: Display All Sales Records Sorted by Amount (Highest → Lowest)
SELECT * FROM sales
ORDER BY amount DESC;


-- Question 8: Show All Sales Made by Customer “Aditi”
SELECT * FROM sales
WHERE customer_name = 'Aditi';

-- Question 9: What is the Difference Between a Primary Key and a Foreign Key?
-- Primary Key : It is key used to uniquely identify a row. It has to be unique and not NULL. It makes sure the integretiy of table. A table can have only one primary key.
-- Foreign Key : It is refential key for table which references to primary key column of other table. It can be duplicated and sometimes Null. It allows data which has any primary key in other table, and make sure that orphan data is not there.

-- Question 10 : What Are Constraints in SQL and Why Are They Used?
-- constraints are predefined rules applied to table columns to limit the type of data that can be stored. They stops to enter,delete or upload invalid data.
-- Usage : 1. They prevent errors in data type.
-- 2. They ensure that data follows logic.
-- 3. They maintain relationship between two tables.
-- 4.Data Integrity( they ensures your information remains accurate and reliable over time)