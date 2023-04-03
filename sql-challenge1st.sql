--adding the primary keys to each tables and selecting it to make sure

alter table departments 
add constraint pk_departments primary key (dept_no);
select *
from departments

alter table dept_emp
add constraint pk_dept_emp primary key (emp_no, dept_no); 
select *
from dept_emp

alter table dept_manager
add constraint pk_dept_manager primary key (dept_no, emp_no);

alter table employees
add constraint pk_employees primary key (emp_no);

alter table salaries
add constraint pk_salaries primary key (emp_no, salary);

alter table titles
add constraint pk_titles primary key (title_id);

select *
from titles

-- adding the foreign keys to those tables 

alter table dept_emp 
add constraint fk_dept_emp_dept_no foreign key (dept_no) references departments (dept_no);

ALTER TABLE dept_emp 
ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE salaries 
ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE titles 
ADD CONSTRAINT fk_titles_emp_title_id FOREIGN KEY (title_id) REFERENCES titles(title_id);

--List the employee number, last name, first name, sex, and salary of each employee.
select e.first_name, e.last_name, e.hire_date, e.sex, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date between '01/01/1986' and '12/31/1986'


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

select d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name 
from departments d
join dept_manager dm on d.dept_no = dm.dept_no
join employees e on dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select de.emp_no, de.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name 
from dept_emp de
join employees e on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no;



--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.


select first_name, last_name, sex 
from employees
where first_name = 'Herculus' and last_name like 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.


select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;













































