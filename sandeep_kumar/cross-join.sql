-- 290 rows
SELECT COUNT(*) 
FROM HumanResources.Employee;

-- 16 rows
SELECT COUNT(*)
FROM HumanResources.Department;

-- 290 * 16 = 4640
SELECT *
FROM HumanResources.Employee, HumanResources.Department;

-- returns the same result
SELECT *
FROM HumanResources.Employee CROSS JOIN HumanResources.Department;