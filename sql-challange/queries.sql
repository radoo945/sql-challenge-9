
select * from public.departments

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no
order by salary desc;

select * from employees
where date_part ('year', hire_date) = 1986;

select departments.dept_name, dept_manager.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager

left join departments
on dept_manager.dept_no = departments.dept_no

left join employees
on dept_manager.emp_no = employees.emp_no;



select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees

left join dept_emp
on employees.emp_no=dept_emp.emp_no

left join departments
on departments.dept_no = dept_emp.dept_no;


select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';


select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees

left join dept_emp 
on  employees.emp_no = dept_emp.emp_no

left join departments
on dept_emp.dept_no = departments.dept_no

where dept_name = 'Sales';


select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees

left join dept_emp 
on  employees.emp_no = dept_emp.emp_no

left join departments
on dept_emp.dept_no = departments.dept_no

where dept_name = 'Sales' or dept_name= 'Development';


select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc;



