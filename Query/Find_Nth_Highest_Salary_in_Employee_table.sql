-- You have a table having n no of eomployee details in it, you have to write a stored procedure to find Nth highest salary from that table

-- Table Creation and Insert Scripts
-- CREATE TABLE Employee (
--     ID INT,
--     FirstName VARCHAR(50),
--     LastName VARCHAR(50),
--     Gender VARCHAR(10),
--     Salary INT
-- );

-- -- Insert the records
-- INSERT INTO Employee (ID, FirstName, LastName, Gender, Salary) VALUES
-- (1, 'Ben', 'Hoskins', 'Male', 70000),
-- (2, 'Mark', 'Hastings', 'Male', 60000),
-- (3, 'Steve', 'Pound', 'Male', 45000),
-- (4, 'Ben', 'Hoskins', 'Male', 70000),
-- (5, 'Philip', 'Hastings', 'Male', 45000),
-- (6, 'Mary', 'Lambeth', 'Female', 30000),
-- (7, 'Valarie', 'Vikings', 'Female', 35000),
-- (8, 'John', 'Stanmore', 'Male', 80000);


CREATE OR REPLACE PROCEDURE Find_Nth_Highest_Salary(rank  int)
RETURNS TABLE (id int, Firstname VARCHAR(50), LastName VARCHAR(50), gender VARCHAR(10), salary int)
LANGUAGE SQL
AS
DECLARE
  res RESULTSET DEFAULT (

  with cte as (
select Id, FIRSTNAME, lastname, GENDER, SALARY, dense_rank() over( order by salary desc) as rank from employee
)
select Id, FIRSTNAME, lastname, GENDER, SALARY from cte where rank = :rank
  
  );
BEGIN
  RETURN TABLE(res);
END;


call Find_Nth_Highest_Salary(2);