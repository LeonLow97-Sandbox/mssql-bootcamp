# 

## Shortcut Commands

- Press F5 to execute statement.

## Restore Database 

- Locate the `.bak` file (database).
- In MSSQL, right click databases and restore database.

## Check Connection Name and SQL Server

```sql
-- View the Current Connection Name
SELECT @@SERVERNAME;

-- View the Installed Version of Microsoft SQL
SELECT @@VERSION;
```

# SELECT Statement

### SELECT

```sql
-- SELECT Statemenet
-- Syntax: SELECT * FROM DatabaseName.SchemaName.TableName
SELECT * FROM Person.Password;
SELECT * FROM Person.Person;

-- SELECT specific columns
SELECT BusinessEntityID, FirstName, MiddleName, LastName FROM Person.Person;

-- All rows in one column become 'FirstName'
SELECT 'FirstName' From Person.Person;
```

### SELECT DISTINCT

```sql
-- SELECT DISTINCT statement
-- Select Unique Records
-- Syntax: SELECT DISTINCT From Col1, Col2 FROM SchemaName.TableName
SELECT DISTINCT JobTitle FROM HumanResources.Employee;
SELECT DISTINCT OrganizationLevel FROM HumanResources.Employee;
SELECT DISTINCT Title, Suffix FROM Person.Person;
```

### CASE with SELECT

- The `CASE` expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement).
- When condition is true, it stops reading and returns the result. 
- If there is no `ELSE` part and no conditions aree true, it returns `NULL`.

```sql
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
```

# Filter the Records

- `WHERE`, `AND`, `OR`, `NOT`, `CONCAT()`, `CONCAT_WS()`, `IS NULL`, `IS NOT NULL`, `BETWEEN`, `NOT BETWEEN`, `CAST`, `IN`, `NOT IN`

### `WHERE` Clause

```sql
-- WHERE Clause
SELECT BusinessEntityID, NationalIDNumber, BirthDate
FROM HumanResources.Employee
-- WHERE MaritalStatus = 'S';
-- WHERE BirthDate > '1985-01-20';
WHERE year(BirthDate) > '1985';
```

### Comparison Operators in `WHERE`

|Comparison Operators|Description|
|:-:|:-:|
|`=`|Equal To|
|`<>` or `!=`|Not Equal To|
|`>`|Greather Than|
|`>=`|Greater Than or Equal To|
|`<`|Less Than|
|`<=`|Less Than or Equal To|

```sql
-- Comparison Operators in WHERE
SELECT StateProvinceID, StateProvinceCode, CountryRegionCode
FROM Person.StateProvince
-- WHERE CountryRegionCode <> 'US';
-- WHERE CountryRegionCode != 'US';
-- WHERE StateProvinceCode <> CountryRegionCode;
-- WHERE StateProvinceID <= 30;
WHERE StateProvinceID >= 30;
```

### Arithmetic Operators in `WHERE`

```sql
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
```

### Logical Operators

```sql
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
```

### Concatenation Operator in WHERE and SELECT (`+`, `concat()`, `concat_ws()`)

```sql
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
```

### NULL value (`IS NULL`, `IS NOT NULL`)

```sql
-- NULL value in WHERE
-- `IS NULL`: Has missing value
-- `IS NOT NULL`: Does not have missing values
SELECT ProductId, Name, Color
FROM Production.Product
-- WHERE Color IS NULL;
WHERE Color IS NOT NULL;
```

### `BETWEEN` operator and `CAST`

```sql
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
```

### `IN` operator

```sql
-- IN operator in WHERE
-- `IN`: SELECT matching values within a fixed set of values
-- `NOT IN`: SELECT matching values NOT within a fixed set of values
SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel
FROM Production.Product
WHERE ProductID IN (1, 10, 15, 20); -- "ProductId is 1 or 10 or 15 or 20"

SELECT * FROM Person.StateProvince
-- WHERE StateProvinceCode IN ('AK','AZ','CO','MB','IA'); -- only 5 outputs
WHERE StateProvinceCode NOT IN ('AK','AZ','CO','MB','IA');
```

# Matching a Pattern

- `LIKE`

```sql
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
```

### Escape Special character (`'`)

- Escaping single quote (`'`) special character

```sql
-- Escape Single Characters
SELECT * 
FROM Purchasing.Vendor
-- WHERE NAME LIKE '%,%'; -- searching all names that contains a ','
WHERE Name LIKE '%''%'; -- searching a record with single quote Hill's Bicycle Service
-- Single quote is a special character
-- use another single quote to escape that special character '
```








