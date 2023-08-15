--1. List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name,last_name,hire_date FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT dept_managers.dept_no, departments.dept_name, dept_managers.emp_no, employees.last_name, employees.first_name,
FROM dept_managers
LEFT JOIN departments
ON dept_managers.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_managers.emp_no = employees.emp_no
ORDER BY emp_no

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
order by emp_no;

--List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins with the letter B

SELECT first_name,last_name,sex FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--List each employee in the Sales department, 
--including their employee number, last name, and first name

SELECT employees.emp_no, employees.last_name, employees.first_name,
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development')


-- 8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;
