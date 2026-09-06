use avi;
-- SQL SELF JOIN Practice
-- Employee Manager Relationship
CREATE TABLE employee_manager (
    emp_id INT,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee_manager VALUES
(101, 'Amit', 104),
(102, 'Rahul', 104),
(103, 'Priya', 105),
(104, 'Neha', 106),
(105, 'Rohit', 106),
(106, 'Vikas', NULL);

SELECT *
FROM employee_manager;

-- Display each employee's name along with their manager's name.
select e.emp_name as emp_name,
       m.emp_name as manager 
from employee_manager as e
left join employee_manager as m
on e.manager_id=m.emp_id;

-- find only employees who have a manager.
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employee_manager AS e
LEFT JOIN employee_manager AS m
ON e.manager_id = m.emp_id
WHERE e.manager_id IS NOT NULL;  

--  find employees who report to the same manager   
select e1.emp_name as employee1,
e2.emp_name as employee2,
m.emp_name as manager
from employee_manager e1
join employee_manager e2
on e1.manager_id=e2.manager_id
and e1.emp_id<e2.emp_id
join employee_manager m
on e1.manager_id=m.emp_id;

-- Find employees who report directly to Neha.
select e.emp_name as employee, m.emp_name as manager
from employee_manager e
join employee_manager m
on e.manager_id=m.emp_id
where m.emp_name ='Neha';

-- Find pairs of employees who have the same manager and whose employee IDs are different.
select e1.emp_name as emp1, e2.emp_name as emp2, e1.manager_id as manger_id
from employee_manager e1
join employee_manager e2
on e1.manager_id=e2.manager_id
and e1.emp_id<e2.emp_id;

-- Find the manager who manages the highest number of employees.
select m.emp_name as manager, count(*) as emp_count
from employee_manager e
join employee_manager m
on e.manager_id=m.emp_id
group by m.emp_name
order by emp_count desc
limit 2;

-- Find every manager and the number of employees reporting to them, 
-- including managers who currently have zero employees reporting to them.
select m.emp_name as manager_name, count(e.emp_id) as emp_count
from employee_manager m
left join employee_manager e
on m.emp_id=e.manager_id
group by m.emp_name;

-- Find employees who are managers themselves.
select distinct m.emp_name as mangers
from employee_manager m
join employee_manager e
on m.emp_id=e.manager_id;