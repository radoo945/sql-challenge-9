-- Import CSVs and add to SQL Tables, run each table to make sure they were imported correctly
SELECT * FROM "Department";
SELECT * FROM "Dept_emp";
SELECT * FROM "Employees";
SELECT * FROM "Titles";
SELECT * FROM "Dept_manager";
SELECT * FROM "Salaries";

-- List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" AS e
INNER JOIN "Salaries" AS s ON
e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM "Department" as d
LEFT JOIN "Dept_manager" as m 
ON d.dept_no = m.dept_no
LEFT JOIN "Employees" as e
ON e.emp_no = m.emp_no
;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" as e
INNER JOIN "Dept_emp" as de
ON e.emp_no = de.emp_no
INNER JOIN "Department" as d
ON d.dept_no = de.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Department" as d
INNER JOIN "Dept_emp" as de
ON d.dept_no = de.dept_no
INNER JOIN "Employees" as e
ON e.emp_no = de.emp_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Department" as d
INNER JOIN "Dept_emp" as de
ON d.dept_no = de.dept_no
INNER JOIN "Employees" as e
ON e.emp_no = de.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name, count(emp_no) AS last_name_frequency
FROM "Employees"
GROUP BY last_name
ORDER BY last_name_frequency DESC;