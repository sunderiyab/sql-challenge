CREATE TABLE departments (
    dept_no varchar
    dept_name varchar(40) NOT NULL
);

CREATE TABLE departments (
    dept_no char(4) NOT NULL,
    dept_name varchar(40) NOT NULL
);

CREATE TABLE employees (
    emp_no int NOT NULL,
    birth_date date NOT NULL,
    first_name varchar(14) NOT NULL,
    last_name varchar(16) NOT NULL,
    gender char(1) NOT NULL,
    hire_date date NOT NULL
);

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no char(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);

CREATE TABLE dept_manager (
    dept_no char(4) NOT NULL,
    emp_no int NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);

CREATE TABLE titles (
    emp_no int NOT NULL,
    title varchar(50) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);
