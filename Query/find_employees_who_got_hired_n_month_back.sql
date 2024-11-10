-- You have find all employee from a table who got hired with provided month interval.

-- CREATE TABLE Employees_hiring (
--     ID INT PRIMARY KEY IDENTITY,
--     FirstName NVARCHAR(50),
--     LastName NVARCHAR(50),
--     Gender NVARCHAR(50),
--     Salary INT,
--     HireDate DATETIME
-- );


-- INSERT INTO Employees_hiring (FirstName, LastName, Gender, Salary, HireDate) VALUES
--     ('Mark', 'Hastings', 'Male', 60000, '5/10/2014'),
--     ('Steve', 'Pound', 'Male', 45000, '4/20/2014'),
--     ('Ben', 'Hoskins', 'Male', 70000, '5/5/2014'),
--     ('Philip', 'Hastings', 'Male', 45000, '3/11/2014'),
--     ('Mary', 'Lambeth', 'Female', 30000, '3/10/2014'),
--     ('Valarie', 'Vikings', 'Female', 35000, '12/9/2014'),
--     ('John', 'Stanmore', 'Male', 80000, '2/22/2014'),
--     ('Able', 'Edward', 'Male', 5000, '1/22/2014'),
--     ('Emma', 'Nan', 'Female', 5000, '11/14/2014'),
--     ('Jd', 'Nosin', 'Male', 6000, '1/10/2013'),
--     ('Todd', 'Heir', 'Male', 7000, '2/14/2013'),
--     ('San', 'Hughes', 'Male', 7000, '3/15/2013'),
--     ('Nico', 'Night', 'Male', 6500, '6/14/2013'),
--     ('Martin', 'Jany', 'Male', 5500, '5/23/2013'),
--     ('Mathew', 'Mann', 'Male', 4500, '6/23/2013'),
--     ('Baker', 'Barn', 'Male', 3500, '7/23/2013');



with cte as(
    select ID, FIRSTNAME, LASTNAME, GENDER, SALARY, 
    datediff(month,hiredate,getdate()) as Diff 
    from employees_hiring)

    select * from cte where diff between 1 and 3;

