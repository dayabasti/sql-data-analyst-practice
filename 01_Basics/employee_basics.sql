use company_practice;
-- exporting csv_file_table frm excel------
show tables;
desc employees;
-- Group_By----------
select sum(salary), department from employees group by department; 
select avg(salary) as Avg_salary, department from employees group by department;
select count(*) as employee, department from employees group by department;
select city, sum(salary) from employees group by city;
select city, avg(salary) as avg_salary from employees group by city;
select department, max(salary) as max_salary from employees group by department;
select department, min(salary) from employees group by department;
select city, count(*) as no_emp from employees group by city;
select department, sum(experience) as total_experience from employees group by department;
select department, city, count(*) as no_emp from employees group by department, city;

-- having---------------
-- Display departments having more than 3 employees.
select department, count(*) as employee_count
from employees
group by department
having count(*)>3;

-- Display departments where the average salary is greater than ₹50,000.
select department, avg(salary) as avg_salary
from employees
group by department
having avg(salary)>50000;

-- Display departments where the total salary is greater than ₹150,000.
select department, sum(salary) as total_salary
from employees
group by department
having sum(salary)>150000;

-- Display departments where the maximum salary is greater than ₹60,000.
select department, max(salary) as max_salary
from employees
group by department
having max(salary)>60000;

-- Display cities having more than 3 employees.
select city, count(*) as employee
from employees
group by city
having count(*)>3;

-- Display cities where the average salary is greater than ₹45,000.
select city, avg(salary) as avg_salry
from employees
group by city
having avg(salary)>45000;

-- Display departments having more than 2 employees and fewer than 5 employees.
select department, count(*) as employee_count
from employees
group by department
having count(*)>2
and count(*)<5;

-- Display departments where total employee experience is greater than 12 years.
select department, sum(experience) as total_experience
from employees
group by department
having sum(experience)>12;

-- ORDER BY + LIMIT

-- Display all employees sorted by salary from highest to lowest.
select * 
from employees
order by salary desc;

-- Display all employees sorted by salary from lowest to highest.
select * from employees
order by salary asc;

-- Display employees sorted by experience from highest to lowest.
select * from employees
order by experience desc;

-- Display employees sorted by experience from lowest to highest.
select * from employees
order by experience asc;

-- Display employees sorted by department alphabetically.
select * from employees
order by department asc;

-- Display the top 3 highest-paid employees.
select * from employees
order by salary desc 
limit 3;

-- Display the employee with the lowest salary.
select * from employees
order by salary asc
limit 1;

-- Display the top 3 employees with the most experience.
select * from employees
order by experience desc
limit 3;

-- Display employees from Delhi, sorted by salary from highest to lowest.
select * from employees
where city='Delhi'
order by salary desc;

-- Display the top 2 highest-paid employees from the IT department.
select * from employees 
where department='IT'
order by salary desc 
limit 2;

-- Display the 2 employees with the lowest salary.
select * from employees
order by salary asc
limit 2;

-- DISTINCT + multiple conditions + BETWEEN + IN + LIKE

-- Display all unique departments.
select distinct department
from employees;

-- Display all unique cities.
select distinct city
from employees;

-- Display employees whose salary is between ₹40,000 and ₹60,000.
select * from employees
where salary between 40000 and 60000;

-- Display employees whose experience is between 2 and 5 years.
select * from employees
where experience between 2 and 5;

-- Display employees who work in either IT or HR
select * from employees
where department='IT' or department='HR';

-- Display employees who are NOT from Delhi.
select * from employees
where city <> 'delhi';

-- Display employees whose name starts with A
select * from employees
where emp_name like 'A%';

-- Display employees whose name ends with n.
select * from employees
where emp_name like '%n';

-- Display employees whose salary is greater than ₹45,000 AND experience is greater than 3 years.
select * from employees 
where salary>45000 and experience >3;

-- Display employees who are from Delhi or Mumbai AND whose salary is greater than ₹40,000.
select * from employees
where (city='Delhi' or city='Mumbai') and salary>40000;

-- Display employees who are NOT in the IT department and have a salary greater than ₹40,000.
select * from employees
where department <> 'IT' and salary>40000;

-- Display employees whose salary is between ₹40,000 and ₹60,000 AND who are from Delhi.
select * from employees
where (salary between 40000 and 60000)
 and city='Delhi';
 
 -- Display employees who work in IT, HR, or Sales.
 select * from employees
 where department in ('It','HR','Sales');
 
 -- Display employees who are NOT in the IT or HR departments.
 select * from employees
 where department not in ('IT','HR');
 
 -- Display employees whose name contains the letter a anywhere in their name.
 select * from employees
 where emp_name like '%a%';
 
 -- Display employees whose salary is NOT between ₹40,000 and ₹60,000.
 select * from employees 
 where salary not between 40000 and 60000;
 
 -- Display employees whose experience is NOT between 2 and 5 years.
 select* from employees
 where experience not between 2 and 5;
 -- Display employees whose department is either IT or Sales AND whose experience is greater than 3 years.
 select * from employees
 where department in ('IT','Sales') and experience >3;
 
 -- Display employees whose name starts with A or R.
 select * from employees 
 where emp_name like 'A%' or emp_name like 'R%';
 
 -- Display employees whose salary is greater than ₹50,000 OR whose experience is greater than 5 years.
 select * from employees
 where salary>50000 or experience >5;