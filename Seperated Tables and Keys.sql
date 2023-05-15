DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id CHAR(5),
    birth_date DATE NOT NULL,
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE dept_manager (
    dept_no CHAR(4),
    emp_no INTEGER PRIMARY KEY
);

CREATE TABLE titles (
    title_id CHAR(5) PRIMARY KEY,
    title VARCHAR(35) NOT NULL
);

CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(35) NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INTEGER,
    dept_no CHAR(4),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
    emp_no INTEGER PRIMARY KEY,
    salary INTEGER NOT NULL
);

-- Add foreign key constraints
ALTER TABLE employees ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);
ALTER TABLE dept_manager ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_manager ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_emp ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_emp ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE salaries ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);