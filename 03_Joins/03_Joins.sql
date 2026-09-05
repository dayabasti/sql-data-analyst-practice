use avi;
desc employee;
create table emp_info(
emp_id int,
email varchar(100),
phone varchar(15),
job_title varchar(50));

insert into emp_info values
(1, 'amit@gmail.com', '9876543210', 'Data Analyst'),
(2, 'rahul@gmail.com', '9876543211', 'Software Engineer'),
(3, 'priya@gmail.com', '9876543212', 'HR Executive'),
(4, 'neha@gmail.com', '9876543213', 'Data Analyst'),
(5, 'rohit@gmail.com', '9876543214', 'Sales Executive'),
(6, 'anjali@gmail.com', '9876543215', 'Software Engineer'),
(7, 'vikas@gmail.com', '9876543216', 'Manager');

select * from emp_info;

select emp_id from employee;
UPDATE emp_info
SET emp_id = emp_id + 100;
select * from emp_info;

-- select employees name, department, job title and email
select emp_name, department, job_title, email 
from employee e
inner join emp_info i
on  e.emp_id=i.emp_id;

-- Display the employee name, salary, email, and job title
-- for employees whose salary is greater than ₹50,000.
select emp_name, salary, email, job_title
from employee e
inner join emp_info i
on e.emp_id=i.emp_id
where salary>50000;

-- Display: employee name, department, salary, job title
-- For employees whose details exist in both tables, sort them from highest salary to lowest salary.
select emp_name, department, salary, email, job_title
from employee e
inner join emp_info i
on e.emp_id=i.emp_id
order by e.salary desc;

-- Find the top 3 highest-paid employees who work in the IT department.
-- Display: employee name, salary, email, job title
select emp_name, salary, email, job_title
from employee e
inner join emp_info i 
on e.emp_id=i.emp_id
where e.department='IT'
order by e.salary desc
limit 3;

-- Find the number of employees in each department who have information in emp_info.
select department, count(*) as emp_count
from employee e
inner join emp_info i 
on e.emp_id=i.emp_id
group by e.department;

-- Find departments that have at least 2 employees whose information exists in emp_info.
select department, count(*) as emp_count
from employee e
inner join emp_info i
on e.emp_id=i.emp_id
group by department 
having emp_count>=2;
 
 -- Find the total salary of employees whose information exists in emp_info, for each department.
 select department, sum(salary) as total_salary
 from employee e
 inner join emp_info i
 on e.emp_id=i.emp_id
 group by department;
 
 -- Find departments where the average salary of employees 
 -- whose information exists in emp_info is greater than 50,000.
 select department, avg(salary) as avg_salary
from employee e
 inner join emp_info i
 on e.emp_id=i.emp_id
 group by department
 having avg_salary>50000;
 
 -- Find the highest salary in each department among employees whose information exists in emp_info.
 select department, max(salary) as max_salary
 from employee e
 inner join emp_info i
 on e.emp_id=i.emp_id
 group by department;
 
 -- Find the department with the lowest salary among employees whose information exists in emp_info.
 select department, min(salary) as min_salary
 from employee e
 inner join emp_info i
 on e.emp_id=i.emp_id
 group by department
 order by min_salary asc
 limit 1;
 
 -- Find the employees who have information in emp_info and work in the IT department. Display:
-- emp_name, salary, email, job_title Sort by salary from highest to lowest.
select emp_name, salary, email, job_title
from employee e
inner join emp_info i
on e.emp_id=i.emp_id
where e.department='IT'
order by e.salary desc;

-- Find the average salary of employees in each city whose information exists in emp_info, 
-- but only include employees with salary greater than 40,000.
select city, avg(salary) as avg_salary
from employee e
inner join emp_info i 
on e.emp_id=i.emp_id
where e.salary>40000
group by city;

-- Find cities that have at least 2 employees whose 
-- information exists in emp_info and whose average salary is greater than 45,000.

select city, count(*) as emp_count, avg(salary) as avg_salary
from employee e
inner join emp_info i 
on e.emp_id=i.emp_id
group by city
having avg_salary>45000;

-- Find departments where the total salary of employees 
-- whose information exists in emp_info is greater than 100,000.
select department , sum(salary) as total_salary
from employee e
inner join emp_info i 
on e.emp_id=i.emp_id
group by department
having total_salary>100000;

-- Find the city with the highest average salary among cities 
-- having at least 2 employees whose information exists in emp_info.
select city, avg(salary) as avg_salary, count(*) as emp_count
from employee e
inner join emp_info i 
on e.emp_id=i.emp_id
group by city
having emp_count >=2
order by avg_salary desc
limit 1;  
-- Find all employees from employee, including those who do NOT have matching information in emp_info.
select * from employee e
left join emp_info i
on e.emp_id=i.emp_id;

-- Find employees who do NOT have any information in emp_info.
select e.emp_name , e.department
from employee e
left join emp_info i 
on e.emp_id=i.emp_id
where i.emp_id is null;

-- Find how many employees in each department have matching information in emp_info.
select e.department, count(i.emp_id) as emp_count
from employee e 
left join emp_info i 
on e.emp_id=i.emp_id
group by e.department;

-- Find all departments and the number of employees that do NOT have information in emp_info.
select department, count(*) as missing_count
from employee e
left join emp_info i 
on e.emp_id=i.emp_id
where i.emp_id is null
group by department ;

-- Find the names and cities of employees who do NOT have information in emp_info.
select emp_name , city 
from employee e
left join emp_info i 
on e.emp_id=i.emp_id
where i.emp_id is null;

-- Find all employees whose information exists in emp_info, 
-- including any records in emp_info that don't have a matching employee in employee.
select emp_name, email, job_title
from employee e
right join emp_info i 
on e.emp_id=i.emp_id;

-- Find records in emp_info that do NOT have a matching employee in employee.
select i.email, i.job_title
from employee e
right join emp_info i 
on e.emp_id=i.emp_id
where e.emp_id is null;
