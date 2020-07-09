-- Data Engineering --
-- Drop Tables if Existing. Do not change the order.
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--Creating tables and constraints based on ERD
CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(2) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_managers(
	dept_no VARCHAR(10),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	title_id INT NOT NULL,
	title VARCHAR(20) NOT NULL,
	FOREIGN KEY (title_id) REFERENCES employees(emp_title)
);
-- Validate table creations from schema
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--Import csv data to tables