CREATE DATABASE joins;
USE joins;
/*.. CREATING TABLE as departments...*/

CREATE TABLE departments(
id INT,
name VARCHAR(255)
);
INSERT INTO departments(id , name) VALUES
(1,"Human Resources"),
(2,"Marketing"),
(3,"Finance"),
(4,"IT"),
(5,"Operations"),
(6,'Logistics');
ALTER TABLE departments
ADD PRIMARY KEY(id);

DESCRIBE departments;

/*... creating table as employees...*/

CREATE TABLE employees(
id INT PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
department_id INT,
FOREIGN KEY(department_id) REFERENCES departments(id)
);

INSERT INTO employees(id,first_name,last_name,department_id) VALUES
(1,'Amit','Gupta',1),
(2,'Priya','Sharma',2),
(3,'Rahul','Singh',3),
(4,'Meera','Patel',4),
(5,'Arjun','Kumar',1),
(6,'Anjali','Deshpande',2),
(7,'Vivek','Malhotra',3);

INSERT INTO employees(id,first_name,last_name) VALUES
(8,'Riya','Nair'),
(9,'Suresh','Menon');

/*....INNER JOIN...*/ 

# 1 List employees along with their department names, excluding employees without a department assigned.
SELECT employees.first_name,employees.last_name ,departments.name AS department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.id;

/*... LEFT JOIN...*/

 # 2 list all employees along with their departmrnt name,including employees without a department assigned.
SELECT employees.first_name,employees.last_name,departments.name AS department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.id;

/*... RIGHT JOIN...*/

 # 3 list all departments along with the employees in each department,including departments without employees
 SELECT employees.first_name,employees.last_name,departments.name AS department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.id;
 
 
 /*... FULL OUTER JOIN...*/
 
 # 4 List employees along with their department names, and list departments without employees
 
 SELECT employees.first_name,employees.last_name,departments.name AS department_name
 FROM employees
 LEFT JOIN departments ON employees.department_id = departments.id
 
 UNION 
 
  SELECT employees.first_name,employees.last_name,departments.name AS department_name
 FROM employees
 RIGHT JOIN departments ON employees.department_id = departments.id
 
/*... CROSS JOIN...*/

/*.. creating two table as (color and product) to perform CROSS JOIN..*/
CREATE TABLE colors(
id INT,
color VARCHAR(20)
);

INSERT INTO colors(id,color) VALUES 
(1,'RED'),
(2,'GREEN'),
(3,'BLUE');

CREATE TABLE products(
id INT ,
product VARCHAR(20)
);
INSERT INTO products(id,product) VALUES
(1, 'CAP'),
(2,'SHIRT'),
(3,'PANT');

# 5 List all combinations of colors and products
SELECT colors.color, products.product
FROM colors
CROSS JOIN products;

/*.. CRAETING TALBE student_course to perform SELF JOIN...*/

/*... SELF JOION...*/

CREATE TABLE student_course (
sid VARCHAR(10),
cid VARCHAR(10),
name VARCHAR(20)
);
INSERT INTO student_course(sid,cid,name) VALUES
('s1','c1','C'),
('s2','c2','C++'),
('s1','c3','JAVA');

# 6 list the student details who have enrolled in more than one course

SELECT T1.sid,T2.name
FROM student_course AS T1, student_course AS T2
WHERE T1.sid = T2.sid AND T1.name <> T2.name;

