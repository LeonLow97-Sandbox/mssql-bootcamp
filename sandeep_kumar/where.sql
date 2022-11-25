-- WHERE Clause
SELECT BusinessEntityID, NationalIDNumber, BirthDate
FROM HumanResources.Employee
-- WHERE MaritalStatus = 'S';
-- WHERE BirthDate > '1985-01-20';
WHERE year(BirthDate) > '1985';

-- Comparison Operators in WHERE
SELECT StateProvinceID, StateProvinceCode, CountryRegionCode
FROM Person.StateProvince
-- WHERE CountryRegionCode <> 'US';
-- WHERE CountryRegionCode != 'US';
-- WHERE StateProvinceCode <> CountryRegionCode;
-- WHERE StateProvinceID <= 30;
WHERE StateProvinceID >= 30;

-- Arithmetic Operators
- +, -, *, /
SELECT StandardCost, ListPrice, StandardCost + ListPrice AS SumListPriceCost -- used alias
FROM Production.Product
-- WHERE StandardCost > 0;
-- WHERE StandardCost + ListPrice > 0;
WHERE ListPrice - StandardCost > 10;

SELECT ProductID, Name, ReorderPoint, StandardCost
FROM Production.Product
-- WHERE ReorderPoint * StandardCost > 3
WHERE ReorderPoint / StandardCost > 3 AND StandardCost <> 0; -- ensure StandardCost is not 0, otherwise will have error

-- Logical Operators
-- AND, OR, NOT
SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel 
FROM Production.Product
-- WHERE ProductID < 600 AND StandardCost > 50 AND SafetyStockLevel BETWEEN 50 AND 1200;
-- WHERE ProductID < 600 OR StandardCost > 50;
-- WHERE ProductID = 1 OR ProductID = 10 OR ProductID = 15 OR ProductID = 20;
WHERE (ProductID = 800 OR ProductID < 600) AND StandardCost > 50 AND SafetyStockLevel BETWEEN 500 AND 1200;
-- If 'OR' and 'AND' operators are present in the WHERE clause, SQL processes the 'AND' operator first.
-- Can also use parenthesis to wrap the expressions.

SELECT ProductID, Name
FROM Production.Product
-- WHERE NOT ProductID = 4;
WHERE NOT Name = 'Adjustable Price';

-- Concatenation Operator in WHERE and SELECT
-- '+' operator to combine strings
-- If there are NULL values, the concatenation will be NULL.
SELECT Title, FirstName, MiddleName, LastName,
	Title + ' ' + FirstName + ' ' + MiddleName + ' ' + LastName AS FullName
FROM Person.Person
WHERE Title + ' ' + FirstName + ' ' + MiddleName + ' ' + LastName = 'Ms. Gail A Erickson';

-- concat() function
-- CONCAT(string1, string2, string3, ...)
-- Accepts NULL values and removes them.
SELECT Title, FirstName, MiddleName, LastName,
	CONCAT(Title, ' ', Firstname, ' ', MiddleName, ' ' + LastName) 
	AS FullName
FROM Person.Person;

-- CONCAT_WS(separator, string1, string2)
-- Adds 2 or more strings together with a separator
SELECT FirstName, BusinessEntityID, 
		CONCAT(FirstName, BusinessEntityID, '@', 
			CONCAT_WS('.','adventure-works','com')) AS PersonEmail,
		CONCAT_WS('.', 'adventure-works', 'com') AS domain -- adventure-works.com
FROM Person.Person;

-- NULL value in WHERE
-- `IS NULL`: Has missing value
-- `IS NOT NULL`: Does not have missing values
SELECT ProductId, Name, Color
FROM Production.Product
-- WHERE Color IS NULL;
WHERE Color IS NOT NULL;

-- BETWEEN operator in WHERE
-- `BETWEEN`: To SELECT matching values within a range (inclusive)
-- `NOT BETWEEN`: To SELECT matching values NOT within a range
SELECT ProductId, Name, Color
FROM Production.Product
-- WHERE ProductId >= 1 AND ProductId <= 500
WHERE ProductId BETWEEN 1 AND 500;

-- Be careful of using BETWEEN when comparing dates
SELECT PurchaseOrderID, ModifiedDate
FROM Purchasing.PurchaseOrderDetail
-- WHERE ModifiedDate BETWEEN '2014-02-02' AND '2015-08-12'; -- excludes 2015-08-12 12:25:46.470
WHERE ModifiedDate BETWEEN '2014-02-02' AND '2015-08-13';
-- WHERE ModifiedDate NOT BETWEEN '2014-02-02' AND '2015-08-13';

-- `CAST`: convert one data type to another
-- E.g., convert date to datetime: 1969-01-29 to 1969-01-29 00:00:00.000
SELECT BusinessEntityID, CAST(BirthDate AS datetime) AS BirthDateTime
FROM HumanResources.Employee;

-- CAST converts data type from lower to higher level
SELECT CAST('2020-06-12' AS datetime);
SELECT CAST(1.234 AS INT); -- 1
SELECT CAST(1.834 AS INT); -- 1

-- CAST from datetime to date in the query
-- It only compares the date (ignores the timestamp) because it is now date type.
SELECT PurchaseOrderID, ModifiedDate
FROM Purchasing.PurchaseOrderDetail
WHERE CAST(ModifiedDate AS DATE) BETWEEN '2014-02-02' AND '2015-08-13';

-- IN operator in WHERE
-- `IN`: SELECT matching values within a fixed set of values
-- `NOT IN`: SELECT matching values NOT within a fixed set of values
SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel
FROM Production.Product
WHERE ProductID IN (1, 10, 15, 20); -- "ProductId is 1 or 10 or 15 or 20"

SELECT * FROM Person.StateProvince
-- WHERE StateProvinceCode IN ('AK','AZ','CO','MB','IA'); -- only 5 outputs
WHERE StateProvinceCode NOT IN ('AK','AZ','CO','MB','IA');















