-- SELECT Statemenet
-- Syntax: SELECT * FROM DatabaseName.SchemaName.TableName
SELECT * FROM Person.Password;
SELECT * FROM Person.Person;

-- SELECT specific columns
SELECT BusinessEntityID, FirstName, MiddleName, LastName FROM Person.Person;

-- All rows in one column become 'FirstName'
SELECT 'FirstName' From Person.Person;

-- SELECT DISTINCT statement
-- Select Unique Records
-- Syntax: SELECT DISTINCT From Col1, Col2 FROM SchemaName.TableName
SELECT DISTINCT JobTitle FROM HumanResources.Employee;
SELECT DISTINCT OrganizationLevel FROM HumanResources.Employee;
SELECT DISTINCT Title, Suffix FROM Person.Person;

-- Case with SELECT
-- Syntax: CASE(expression1, value1, expression2, value2, ... expressionN, valueN)
Select NationalIDNumber, HireDate, VacationHours,
-- FROM HumanResources.Employee;
CASE
WHEN VacationHours > 70 THEN 'Vacation hours over limit'
WHEN VacationHours BETWEEN 40 and 70 THEN 'Vacation hours average' -- inclusive
ELSE 'Vacation houors within limit'
END AS VacationHourLimit
FROM HumanResources.Employee;




