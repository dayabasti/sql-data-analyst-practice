use company_practice;
----exporting csv_file_table frm excel------
show tables;
desc employees;
----------Group_By----------
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