---------------------------------------------Employee and Department----------------------------------------------------------------

--Create Database
CREATE DATABASE Office

--Create Table Department
  CREATE TABLE Dept(
  Dept_No NUMBER PRIMARY KEY,
  Dname VACHAR2(30),
  Loc VARCHAR2(30)
  );
  
--Create Table Employee
CREATE TABLE Emp(
  Emp_No NUMBER PRIMARY KEY,
  Ename VARCHAR2(20),
  Job VARCHAR(30),
  Salary NUMBER(10,2),
  Dept_No NUMBER,
  CONSTRAINT FK_emp(Dept_No) REFERENCES Dept(Dept_No)
  );
