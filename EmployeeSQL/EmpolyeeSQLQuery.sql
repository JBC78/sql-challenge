select * from departments;	-- working
select * from dept_emp;		-- working
select * from dept_manager;	-- working
select * from employees;	-- working
select * from salary; 		-- working
select * from titles; 		-- working

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary
from employees
left join salary on employees.emp_no = salary.emp_no

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees
	where hire_date between '01/01/1986' and '12/31/1986'

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dept_manager.dept_no, departments.dept_name, employees.first_name, employees.last_name
from dept_manager
inner join departments on dept_manager.dept_no = departments.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees 
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
order by employees.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select last_name ,first_name,sex from employees 
	where first_name = 'Hercules' and
    last_name like 'B%' -- % Finds any values that starts with "B"
	
-- List all employees in the Sales department, including their employee number, last name, first name, and department name
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
	where departments.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments
join dept_emp on departments.dept_no=dept_emp.dept_no
join employees on dept_emp.emp_no=employees.emp_no
	where departments.dept_name in ('Sales','Development')

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*)
FROM employees
GROUP BY last_name 
ORDER BY COUNT(*) DESC