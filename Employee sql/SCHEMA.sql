-- CREATING TABLES


-- DEPARTMENT TABLE SCHEMA 
CREATE TABLE Department(
dept_no VARCHAR(10) PRIMARY KEY,
dept_name VARCHAR(255) NOT NULL
);

-- EMPLOYEES TABLE SCHEMA
CREATE TABLE Employees(
emp_no SERIAL PRIMARY KEY,
emp_title_id VARCHAR(255)NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
sex CHAR(1) NOT NULL,
hire_date DATE NOT NULL
);

-- DEPARTMENT EMPLOYEE TABLE SCHEMA
CREATE TABLE Department_Employee(
emp_no SERIAL,
dept_no VARCHAR (10),
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY(dept_no) REFERENCES Department(dept_no)
);

-- DEPARTMENT MANAGER TABLE SCHEMA
CREATE TABLE Department_manager(
dept_no VARCHAR(10),
emp_no SERIAL,
PRIMARY KEY(emp_no,dept_no),
FOREIGN KEY(emp_no)REFERENCES employees(emp_no),
FOREIGN KEY (dept_no)REFERENCES Department(dept_no)
);

-- SALARIES TABLE SCHEMA
CREATE TABLE Salaries(
emp_no SERIAL,
salary INT NOT NULL,
PRIMARY KEY(emp_no, salary),
FOREIGN KEY (emp_no)REFERENCES employees(emp_no)
);

-- TITLES TABLE SCHEMA 
CREATE TABLE Titles(
title_id VARCHAR(5) PRIMARY KEY,
title VARCHAR(255)NOT NULL
);