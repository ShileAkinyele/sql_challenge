-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
emp_no,
last_name,
first_name,
sex,
(SELECT salary FROM salaries WHERE emp_no=employees.emp_no)AS salary
FROM 
Employees;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
first_name,
last_name,
hire_date
FROM employees
WHERE
EXTRACT(YEAR FROM hire_date)=1986;


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
department_manager.dept_no,
department.dept_name,
department_manager.emp_no AS manager_emp_no,
employees.last_name AS manager_last_name,
employees.first_name AS manager_first_name
FROM 
Department_manager
JOIN
department ON department_manager.dept_no=department.dept_no
JOIN
employees ON department_manager.emp_no=employees.emp_no
;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
employees.emp_no,
employees.last_name,
employees.first_name,
department_employee.dept_no AS department_number,
department.dept_name AS department_name
FROM
employees
JOIN
department_employee ON employees.emp_no=department_employee.emp_no
JOIN
department ON department_employee.dept_no=department.dept_no
;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
first_name,
last_name,
sex
FROM
employees
WHERE
first_name='Hercules' AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT
employees.emp_no,
employees.last_name,
employees.first_name
FROM 
employees
JOIN
department_employee ON employees.emp_no=department_employee.emp_no
JOIN
department ON department_employee.dept_no=department.dept_no
WHERE
department.dept_name= 'Sales'
;


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT
employees.emp_no,
employees.last_name,
employees.first_name
FROM 
employees
JOIN
department_employee ON employees.emp_no=department_employee.emp_no
JOIN
department ON department_employee.dept_no=department.dept_no
WHERE
department.dept_name IN ('Sales','Development')
;


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT
last_name,
COUNT(*) AS number_employees
FROM
employees
GROUP BY
last_name
ORDER BY
number_employees DESC, last_name
;