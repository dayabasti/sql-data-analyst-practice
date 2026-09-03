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
-- 