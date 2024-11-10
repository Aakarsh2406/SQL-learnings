-- You have to find all the manager to manager of a employee from a table

-- CREATE TABLE Employee_Org_chart (
--     EmployeeID INT,
--     EmployeeName VARCHAR(50),
--     ManagerID INT
-- );

-- -- Insert the records
-- INSERT INTO Employee_Org_chart (EmployeeID, EmployeeName, ManagerID) VALUES
-- (1, 'John', 5),
-- (2, 'Mark', 8),
-- (3, 'Steve', 8),
-- (4, 'Tom', 3),
-- (5, 'Lara', 8),
-- (6, 'Simon', 2),
-- (7, 'David', 4),
-- (8, 'Ben', NULL),
-- (9, 'Stacy', 2),
-- (10, 'Sam', 5);



create or replace procedure Get_All_Heirachy_Of_A_Employee_From_Table(EmployeeName varchar(20))
returns table (Employeename Varchar(50), Managername Varchar(50))
language sql
AS

DECLARE rs RESULTSET DEFAULT (with cte as (

select EmployeeID,EmployeeName, ManagerID from Employee_Org_chart where employeename=:EmployeeName

union all  

select  e.* from Employee_Org_chart e
 join cte c 
on e.EmployeeID = c.ManagerID
-- where e.managerid is not  null
)

select c1.Employeename, c2.employeename as Managername from cte c1
join cte c2
on c1.managerid = c2.employeeid
);

BEGIN
return table (rs);
END;

call Get_All_Heirachy_Of_A_Employee_From_Table('David');