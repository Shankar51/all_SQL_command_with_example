CREATE DATABASE library1;
USE  library1;

CREATE TABLE authors(
author_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
nationality VARCHAR(100),
PRIMARY KEY (author_id)
);
DESCRIBE authors;
INSERT INTO authors(name,nationality) VALUES
("VISHNU","NEPAL"),
("SHANKAR","INDIA");
SELECT*FROM authors;

CREATE TABLE books(
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
author_id INT NOT NULL,
isbn VARCHAR(13) NOT NULL UNIQUE,
publication_date DATE NOT NULL,
total_copies INT NOT NULL CHECK (total_copies>=0),
available_copies INT NOT NULL CHECK (available_copies>=0),
FOREIGN KEY(author_id) REFERENCES authors(author_id)
);
DESCRIBE books;
INSERT INTO books (title,author_id,isbn,publication_date,total_copies,available_copies) VALUES
("JAVA",2,"123","2005-06-15",5,3),
("PYTHON",1,"1234","2006-07-16",10,5);
SELECT *FROM books;


/* ALTER table command in SQL*/

CREATE TABLE departments(
id INT,
name VARCHAR(255)
);
INSERT INTO departments(id , name) VALUES
(1,"Human Resources"),
(2,"Marketing"),
(3,"Finance"),
(4,"IT");

/*1.. ADD CONSTRAINT */

ALTER TABLE departments
ADD PRIMARY KEY (id);



CREATE TABLE employees(
id INT PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
department_id INT,
FOREIGN KEY(department_id) REFERENCES departments(id)
);
describe employees;

/* 2.. DROP CONSTRAINT */
ALTER TABLE employees
DROP PRIMARY KEY ;

describe employees;

/* 3.. ADD COLUMN */
ALTER TABLE employees
ADD salary INT NOT NULL;

/* 4.. MODIFY COLUMN */
ALTER TABLE employees
MODIFY salary VARCHAR(50);

describe employees;

/* 5.. DROP COLUMN  */

ALTER TABLE employees
DROP salary;

describe employees;


