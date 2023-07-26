
/* creating data base as university and in their creating table as students */

Create DATABASE university;
USE university;
SHOW TABLES;
CREATE TABLE students(
sID INT,
name VARCHAR(255),
email VARCHAR(255),
contactnumber BIGINT,
PRIMARY KEY(sID)
);
DESCRIBE students;

INSERT INTO students (sID,name,email,contactnumber) VALUES 
(001,"rahul","rahul@gmail.com",8756379823);
INSERT INTO students (sID,name,email,contactnumber) VALUES 
(002,"ravi","ravi@gmail.com",8756379822);

INSERT INTO students (sID,name,email,contactnumber) VALUES 
(003,"shankar","shankar@gmail.com",1656379822),
(004,"vishnu","vishnu@gmail.com",5356379822),
(005,"dipak","dipak@gmail.com",8756379987);
SELECT*FROM students;

/* showing the one-to many realationship by creating department and faculty tables*/
CREATE TABLE department(
dCode int,
dName VARCHAR(255),
PRIMARY KEY(dCode)
);
INSERT INTO department(dCode , dName) VALUES
(201,"CS"),
(202,"EEE");

CREATE TABLE faculty(
fID INT PRIMARY KEY,
fName VARCHAR(100),
email VARCHAR(100),
dCode INT,
FOREIGN KEY (dCode) REFERENCES department(dCode)
);
INSERT INTO faculty(fID,fName,email,dCode) VALUES
(91,"Rohit","rohit@gmail.com",201),
(92,"Somanna","somanna@gmail.com",202),
(93,"Sunil","sunil@gmail.com",201);

/* many-to many relationship by creating the students,semesters and junction as sID_semcode and also already have students table */
CREATE TABLE semesters(
semCode INT ,
sDATE DATE,
eDATE DATE
);
/*ADD CONSTRAINT*/
ALTER TABLE semesters
ADD PRIMARY KEY (semCode); 


INSERT INTO semesters(semCode,sDATE,eDATE) VALUES
(001,"2020-06-15","2021-02-15"),
(002,"2020-07-16","2021-06-14"),
(003,"2021-09-18","2022-01-10");

CREATE TABLE sID_semCode(
sID  INT,
semCode INT,
PRIMARY KEY(sID,semCode),
FOREIGN KEY (sID) REFERENCES students(sID),
FOREIGN KEY (semCode) REFERENCES semesters(semCode)
);
INSERT INTO sID_semCode(sID,semCode) VALUES (001,003);
INSERT INTO sID_semCode(sID,semCode) VALUES (002,001);
SELECT * FROM sID_semCode;














