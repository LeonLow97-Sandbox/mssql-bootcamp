# Udemy - Complete Microsoft SQL Server Masterclass : Beginner to Expert

- [Udemy Course](https://www.udemy.com/course/complete-microsoft-sql-masterclass-beginner-advanced)

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

# `ORDER BY` and `GROUP BY` Clause

- FROM -> WHERE -> SELECT -> ORDER BY

### `ORDER BY`

```sql
-- ORDER BY Clause
-- Syntax: ORDER BY columnName ASC/DESC (ASC is the default order)
-- NULL values are considered lowest values
SELECT JobCandidateId, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY ModifiedDate DESC;

-- Top 3
SELECT TOP 3 JobCandidateId, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY ModifiedDate DESC;

SELECT AddressID, CONCAT(AddressLine1, ' ', AddressLine2, ' ',
			City, ' ', StateProvinceID, ' ', PostalCode) AS FullAddress
FROM Person.Address
ORDER BY AddressID;

SELECT ProductID, Name, StandardCost, ListPrice
FROM Production.Product
WHERE StandardCost > 0 AND ListPrice > 0
ORDER BY 4 DESC; -- sorted based on ListPrice (4th column in SELECT clause)
-- For readability, ORDER BY columnName and not the column number.

-- ORDER BY with a column that is not in the SELECT statament
SELECT BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY BirthDate DESC;

SELECT AddressID, AddressLine1, LEN(AddressLine1) As LengthAddress1
FROM Person.Address
ORDER BY LEN(AddressLine1) ASC;

-- ORDER BY with FETCH & OFFSET
-- OFFSET: identify the starting point to return rows from a result set.
-- FETCH: return a set of number of rows.
-- Syntax: ORDER BY columnList {ASC / DESC}
-- OFFSET offsetCount {ROW | ROWS}
-- FETCH {FIRST | NEXT} fetchCount {ROW | ROWS} ONLY
Select BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY HireDate ASC;

Select BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY HireDate ASC
OFFSET 5 ROWS -- skip the first 5 rows
FETCH NEXT 20 ROWS ONLY; -- fetch 20 records after

-- E.g., Retrieve top 5 most recent hires
Select BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY HireDate DESC
OFFSET 0 ROWS -- skip the first 5 rows
FETCH NEXT 5 ROWS ONLY; -- fetch 20 records after

-- Can also use TOP instead of OFFSET-FETCH to obtain top / bottom results
Select TOP 5 BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY HireDate DESC;

SELECT TOP 2 JobCandidateID, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY ModifiedDate DESC;

-- no ties
SELECT TOP 2 ProductId, Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC;

-- WITH TIES: returns the number of records with the SAME standardCost
SELECT TOP 2 WITH TIES ProductId, Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC;

SELECT TOP 3 WITH TIES SalesOrderID, SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;

-- TOP {percent} PERCENT
SELECT TOP 10 PERCENT SalesOrderID, SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;

-- one record with all the columns
SELECT TOP 1 *
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;
```

# `GROUP BY`

- FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY

```sql
-- GROUP BY Clause
-- To group the records per category
SELECT SalesOrderID, OrderQty
FROM Sales.SalesOrderDetail;

-- GROUP BY with aggregate function sum()
SELECT SalesOrderID, sum(OrderQty) as SumQty
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID; -- grouped based on this

-- duplicate records for GroupName
SELECT *
FROM HumanResources.Department;

SELECT GroupName
FROM HumanResources.Department
GROUP BY GroupName;

SELECT GroupName, COUNT(groupName)
FROM HumanResources.Department
GROUP BY GroupName;

SELECT GroupName, COUNT(*)
FROM HumanResources.Department
GROUP BY GroupName;

-- GROUP BY with ORDER BY
SELECT PayFrequency, SUM(Rate) AS TotalRatePerPayFrequency
FROM HumanResources.EmployeePayHistory
GROUP BY PayFrequency
ORDER BY PayFrequency DESC;

-- GROUP BY with 2 columns with ORDER BY 
SELECT ProductID, Shelf, SUM(Quantity) AS SumPerProductPerShelf
FROM Production.ProductInventory
GROUP BY ProductID, Shelf
ORDER BY Shelf DESC;
```

# `HAVING` Clause

- Mostly used to filter the Records of aggregate function or Records where `GROUP BY` clause is used.
- Order of Execution
	- `SELECT --> FROM --> WHERE --> GROUP BY --> HAVING --> ORDER BY`

# SubQuery

- Query inside another Query
	- Can be applied to `SELECT`, `INSERT`, `UPDATE` and `DELETE` statements.

# Implicit JOIN

- Not recommended (OLD).
- Combines columns from multiple tables
- This type of join is called as **IMPLICIT JOIN** as we are not using the `JOIN` keyword but are implicitly joining columns of the table.

```sql
-- Syntax
SELECT col1, col2, ...
FROM tableA, tableB, ...
WHERE condition
```

# `INNER JOIN`

- Return only matching records from both the tables.

```sql
-- SYNTAX for INNER JOIN
SELECT tblA.col1, tblA.col2, ..., tblB.col1, tblB.col2, ...
FROM tableA tblA
	INNER JOIN -- can also use `JOIN`
tableB tblB
ON tblA.col1 = tblB.col1;
```

# `LEFT JOIN`

- Return all record from Left Table and only the matching records from the Right Table.
- Returns NULL for the other columns on right table if those records are not matched.
- `LEFT OUTER JOIN` is the same as `LEFT JOIN`.

```sql
SELECT tblA.col1, tblA.col2,..., tblB.col1, tblB.col2, ...
FROM tableA tblA
	LEFT JOIN
tableB tblB
ON tblA.col1 = tblB.col1;
```

# `RIGHT JOIN`

- Return all record from Right Table and only the matching records from Left Table.

```sql
SELECT tblA.col1, tblA.col2,..., tblB.col1, tblB.col2, ...
FROM tableA tblA
	RIGHT JOIN
tableB tblB
ON tblA.col1 = tblB.col1;
```

# `FULL JOIN`

- Combination of LEFT and RIGHT JOIN
- If a record is only found in the left table and not found in the right table, it returns NULL values for the records in the right table and returns the records of the left table, and vice versa.
- Same term: `FULL OUTER JOIN`

```sql
SELECT tblA.col1, tblA.col2,..., tblB.col1, tblB.col2, ...
FROM tableA tblA
	FULL JOIN
tableB tblB
ON tblA.col1 = tblB.col1;
```

# `CROSS JOIN`

- Combines each record from one table with each record of another table.
- Number of rows from 1 table multiply by another table number of rows.
- Avoid using this.

```sql
SELECT * FROM table1, table2;
SELECT * FROM table1 CROSS JOIN table2;
```

# `UNION` and `UNION ALL`

- All the SELECT statements which take part should have same number of columns in the same order.
- All columns in each SELECT statement should have compatible data types.
- `UNION/UNION ALL` combines rows from multiple tables.

- `UNION`: Combines multiple SELECT statements and remove the duplicates.
```sql
SELECT col1, col2,... FROM tableA WHERE condition
	UNION
SELECT col1, col2,... FROM tableB WHERE condition;
```

- `UNION ALL`: Combines multiple SELECT statements but do NOT remove the duplicates
```sql
SELECT col1, col2,... FROM tableA WHERE condition
	UNION ALL
SELECT col1, col2,... FROM tableB WHERE condition;
```

# `INTERSECT`

- Combines distinct rows from multiple tables that are common

```sql
SELECT ProductSubCategoryID
FROM Production.Product
	INTERSECT
SELECT ProductSubCategoryID
FROM Production.ProductSubcategory;
```

# `EXCEPT`

- Compares records from multiple tables and returns only distinct rows from 1st query that are not present in other remaining queries.

```sql
SELECT SalesOrderID
FROM Sales.SalesOrderDetail
	EXCEPT
SELECT CustomerID
FROM Sales.Customer;
```

# Numerical Data Types

|Data Type|Description|Storage|Frequency of use|
|:-:|:-:|:-:|:-:|
|bit|A data type that can store a single binary digit (0 or 1).|1 byte|Highly used|
|tinyint|A data type that can store small integers from 0 to 255.|1 byte|Less Used|
|smallint|A data type that can store integers from -32,768 to 32,767.|2 bytes|Highly used|
|int|A data type that can store integers from -2,147,483,648 to 2,147,483,647.|4 bytes|Highly used|
|bigint|A data type that can store large integers from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807.|8 bytes|Less used|
|decimal(t,r)|A data type that can store decimal numbers with a precision of up to t digits and a scale of up to r digits.|5 - 17 bytes|Highly used|
|smallmoney|A data type that can store small monetary values from -214,748.3648 to 214,748.3647.|4 bytes|Less used|
|money|A data type that can store monetary values from -922,337,203,685,477.5808 to 922,337,203,685,477.5807.|8 bytes|Highly used|
|float(n)|A data type that can store floating-point numbers with a precision of up to 7 digits for 4 bytes and 15 digits for 8 bytes.|4 or 8 bytes|Highly used|
|real|A data type that can store floating-point numbers with a precision of up to 7 digits.|4 bytes|Less Used|

# String Data Types

|Data Type|Description|Storage|Frequency of use|
|:-:|:-:|:-:|:-:|
|`char(n)`|A data type that can store fixed-length strings of n characters.|Fixed memory depends on the value of n|Highly used|
|`varchar(n)`|A data type that can store variable-length strings of up to n characters.|2 bytes + number of characters|Highly used|
|`text`|A data type that can store large variable-length strings of up to 2^31-1 characters.|4 bytes + number of characters|Less used|
|`nchar(n)`|A data type that can store fixed-length Unicode strings of n characters.|2 times the fixed length i.e., 2*n bytes|Highly used|
|`nvarchar(n)`|A data type that can store variable-length Unicode strings of up to n characters.|2*n + 2 bytes|Highly used|
|`image`|A data type that can store binary data such as images, documents, etc.|depends on the number of bytes used|Rarely used|

# Data Data Types

|Data Type|Description|Storage|Frequency of use|
|:-:|:-:|:-:|:-:|
|`datetime`|A data type that can store both date and time values.|8 bytes|Highly used|
|`date`|A data type that can store date values.|3 bytes|Highly used|
|`time`|A data type that can store time values.|3 - 5 bytes|Less used|
|`timestamp`|A data type that can store a unique number that gets updated every time a row gets created or modified.|8 bytes|Less used|

# Other Data Types

|Data Type|Description|Frequency of use|
|:-:|:-:|:-:|:-:|
|`uniqueidentifier`|This stores a 16 byte GUID (globally unique identifier)|Highly used|
|`xml`|Stores xml type data|Rarely used|

# Create Database

- `CREATE DATABASE <database_name>`
- `DROP DATABASE <database_name>`

# Create Table

```sql
-- Create table without constraints
CREATE TABLE Stores (
	StoreId INT IDENTITY(1,1), -- autoincrement field (start with 1, increment by 1)
	StoreNumber VARCHAR(50),
	PhoneNumber CHAR(14),
	Email VARCHAR(50),
	Address VARCHAR(120),
	City VARCHAR(40),
	State VARCHAR(10),
	ZipCode INT
);

-- Create table under retail schema
CREATE TABLE retail.Stores (
	StoreId INT IDENTITY(1,1), -- autoincrement field (start with 1, increment by 1)
	StoreNumber VARCHAR(50),
	PhoneNumber CHAR(14),
	Email VARCHAR(50),
	Address VARCHAR(120),
	City VARCHAR(40),
	State VARCHAR(10),
	ZipCode INT
);
```

### Types of Constraints in MS SQL Server

|Constraints|Description|
|:-:|:-:|
|`NOT NULL`|Imposes a rule that a column(s) will not contain NULL values.|
|`UNIQUE`|Imposes a rule that each record of a column on which UNIQUE constraint is applied will NOT contain Unique values.|
|`CHECK`|Imposes a CHECK on a table to contain only those values which passes the condition test.|
|`DEFAULT`|This constraint sets a default value for a column when no value is specified or the value is NULL|
|`PRIMARY KEY`|This constraint uniquely identifies each record in a table and cannot contain NULL values|
|`FOREIGN KEY`|This constraint references a primary key of another table and is used to establish a link between the data in two tables|

### Create Table Constraints

```sql

```











