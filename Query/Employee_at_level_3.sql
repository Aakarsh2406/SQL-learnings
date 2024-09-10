create or replace table Employees
(
Emp_ID int,
Name varchar(255) collate 'en-ci',
mangerid int
)
;

insert into Employees values(1,'Aditya', null);
insert into Employees values(2,'Aakarsh', 1);
insert into Employees values(3,'Abhishek', 2);
insert into Employees values(4,'Jatin', null);
insert into Employees values(5,'Prakhar', 4);
insert into Employees values(6,'Ayushi', 5);


WITH cte AS (
    SELECT emp_id 
    FROM employees 
    WHERE mangerid IS NULL
),
cte1 AS (
    SELECT e.* 
    FROM employees e
    JOIN cte ON e.mangerid = cte.emp_id
)
SELECT e.* 
FROM cte1 as c
inner join employees e
on
e.mangerid = c.emp_id ;
