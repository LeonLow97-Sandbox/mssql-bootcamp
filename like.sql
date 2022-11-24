-- LIKE operator in WHERE
-- Finds records that match a particular pattern
-- '%': To match 0 or more characters
SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee
-- WHERE JobTitle LIKE 'R%'; -- Jobtitles that starts with 'R'
-- WHERE JobTitle LIKE '%Manager%'; -- JobTitle that has the word 'Manager'
WHERE JobTitle LIKE '%Manager'; -- JobTitle that ends with 'Manager';

-- LIKE with [...] operator in WHERE
-- [...]: To match a single character
SELECT * 
FROM Person.StateProvince
-- WHERE StateProvinceCode LIKE 'A[BKL]%'; -- AB, AK, AL
-- WHERE StateProvinceCode LIKE '[IL]A%'; -- IA, LA
WHERE StateProvinceCode LIKE '%[IL][ABCDEFG]%'; -- VIC, IA, QLD

-- LIKE with [start-end] operator in WHERE
-- [start-end]: To match a single character within a particular range
SELECT *
FROM Production.Product
-- WHERE ProductNumber LIKE 'L[IJKLMN]%'; -- this is similar to the one below
WHERE ProductNumber LIKE 'L[I-N]%';

SELECT *
FROM Production.Product
-- WHERE ProductNumber LIKE 'L%';
-- WHERE ProductNumber LIKE 'L[A-Z]-[0-9]%';
WHERE ProductNumber LIKE 'L[I-N]-[135]%';

-- LIKE with Negation Character
-- [^...]: To match a character which is NOT present inside the Square Brackets
-- E.g., [^a-e] will match any letter apart from a,b,c,d,e
SELECT *
FROM Production.Product
WHERE ProductNumber LIKE 'L[^I-N]-[^135]%';

-- LIKE with Underscore
-- '_': To match a single character only
-- E.g., abc_ : will match strings like abcd, abc1, abcf
SELECT * 
FROM Person.StateProvince
-- WHERE StateProvinceCode LIKE 'A[BKL]_';
WHERE Name LIKE 'AL____'; -- Alaska, Allier (4 underscores)

-- Opposite of LIKE is NOT LIKE

-- Escape Single Characters
SELECT * 
FROM Purchasing.Vendor
-- WHERE NAME LIKE '%,%'; -- searching all names that contains a ','
WHERE Name LIKE '%''%'; -- searching a record with single quote Hill's Bicycle Service
-- Single quote is a special character
-- use another single quote to escape that special character '




















