use company_practice;
show tables;
-- SQL Aggregations Practice
-- COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING

-- Find the total number of employees in the company.
select count(*) from employees;

-- Find the total salary paid to all employees.
select sum(salary) as total_salary from employees;

-- Find the average salary of all employees.
select avg(salary) as avg_salary from employees;

-- Find the minimum salary among all employees.
select min(salary) as min_salary
from employees;

-- Find the department-wise average salary, 
-- but display only departments whose average salary is greater than ₹50,000.
select department, avg(salary) as avg_salary 
from employees
group by department
having avg(salary)>50000;

-- Find the department with the highest total salary.
select department, sum(salary) as total_salary
from employees
group by department
order by total_salary desc
limit 1;

-- Find the second-highest average salary department.
select department, avg(salary) as avg_salary
from employees
group by department
order by avg_salary desc
limit 1, 1;

-- Find departments that have more than 2 employees AND whose average salary is greater than ₹50,000.
select department, count(*) as emp_count, avg(salary) as avg_salary
from employees
group by department
having emp_count>2 and avg_salary>50000;

-- Find the city with the highest average salary, but consider only cities having at least 2 employees.
select city, avg(salary) as avg_salary, count(*) as emp_count
from employees
group by city
having emp_count>=2
order by avg_salary desc
limit 1;

-- Find the department with the lowest average salary among departments having at least 3 employees.
select department, avg(salary) as avg_salary, count(*) as emp_count
from employees
group by department
having emp_count>=3
order by avg_salary asc
limit 1;

-- For each department, find: Number of employees, Total salary, Average salary, Highest salary,Lowest salary
select department, count(*) as emp_count, 
sum(salary) as total_salary, avg(salary) as avg_salary, 
max(salary) as max_salary, min(salary) as min_salary
from employees
group by department;

-- Find departments where:Number of employees is at least 3,Total salary is greater than ₹150,000
-- Average salary is greater than ₹50,000
select department, count(*) as emp_count, sum(salary) as total_salary, avg(salary) as avg_salary
from employees
group by department
having emp_count>=3 and total_salary>150000 and avg_salary>50000;

-- For each city, calculate: Number of employees, Average salary, Total experience
-- But show only cities where: At least 2 employees, Average salary greater than ₹45,000, Total experience greater than 5 years
select city, count(*) as emp_count, avg(salary) as avg_salary, sum(experience) as total_experience
from employees
group by city
having  emp_count>=2 and avg_salary>45000 and total_experience>5;

-- Find the department with the highest salary gap
select department, max(salary) as max_salary, min(salary) as min_salary,  
       max(salary)- min(salary) as salary_gap
from employees
group by department
order by salary_gap desc
limit 1;

-- Find the city with the largest difference between its highest-paid and lowest-paid employee, 
-- but only consider cities with at least 3 employees.
select city, count(*) as emp_count, max(salary) as max_salary, min(salary) as min_salary, 
max(salary)-min(salary) as salary_diff
from employees
group by city
having emp_count>=3
order by salary_diff desc
limit 3;

-- Find the department with the highest average salary among departments that have at least 3 employees.
select department, avg(salary) as avg_salary, count(*)  as emp_count
from employees
group by department
having emp_count>=3
order by avg_salary desc
limit 1;

-- Find the department with the highest total salary among departments whose average salary is greater than ₹45,000.
select department, sum(salary) as total_salary, avg(salary) as avg_salary
from employees
group by department
having avg_salary>45000
order by total_salary desc
limit 1;

-- For each department, calculate the average salary and average experience,
-- but show only departments where: At least 3 employees
-- Average salary > ₹45,000, Average experience > 3 years
select department, avg(salary) as avg_salary, avg(experience) as avg_exp, count(*) as emp_count
from employees
group by department
having emp_count>=3 and avg_salary>45000 and avg_exp>3;
