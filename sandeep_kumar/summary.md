# `SELECT`

|Functionality|Code Example|
|-------------|------------|
|Use the WHERE clause to filter the results of a SELECT statement|`SELECT BusinessEntityID, NationalIDNumber, BirthDate FROM HumanResources.Employee WHERE MaritalStatus = 'S';`|
|Use comparison operators in the WHERE clause|`SELECT StateProvinceID, StateProvinceCode, CountryRegionCode FROM Person.StateProvince WHERE CountryRegionCode <> 'US';`|
|Use arithmetic operators in the WHERE clause|`SELECT StandardCost, ListPrice, StandardCost + ListPrice AS SumListPriceCost FROM Production.Product WHERE ListPrice - StandardCost > 10;`|
|Use logical operators in the WHERE clause|`SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel FROM Production.Product WHERE (ProductID = 800 OR ProductID < 600) AND StandardCost > 50 AND SafetyStockLevel BETWEEN 500 AND 1200;`|
|Use the CONCAT and CONCAT_WS functions in the WHERE clause|`SELECT Title, FirstName, MiddleName, LastName, CONCAT(Title, ' ', Firstname, ' ', MiddleName, ' ' + LastName) AS FullName FROM Person.Person;`|
|Use the IS NULL function in the WHERE clause|`SELECT ProductId, Name, Color FROM Production.Product WHERE Color IS NOT NULL;`|
|Use the BETWEEN operator in the WHERE clause|`SELECT ProductId, Name, Color FROM Production.Product WHERE ProductId BETWEEN 1 AND 500;`|

# `LIKE`

|Functionality|Code Example|
|-------------|------------|
|Use the LIKE operator in the WHERE clause to find records that match a particular pattern|`SELECT BusinessEntityID, JobTitle FROM HumanResources.Employee WHERE JobTitle LIKE 'R%';`|
|Use the '%' wildcard to match 0 or more characters in the LIKE operator |`SELECT BusinessEntityID, JobTitle FROM HumanResources.Employee WHERE JobTitle LIKE '%Manager%';`|
|Use the '[...]' operator to match a single character in the LIKE operator |`SELECT * FROM Person.StateProvince WHERE StateProvinceCode LIKE 'A[BKL]%';`|
|Use the '[start-end]' operator to match a single character within a particular range in the LIKE operator|`SELECT * FROM Production.Product WHERE ProductNumber LIKE 'L[I-N]-[135]%';`|
|Use the negation character '[^...]' to match a character which is not present inside the square brackets in the LIKE operator|`SELECT * FROM Production.Product WHERE ProductNumber LIKE 'L[^I-N]-[^135]%';`|
|Use the underscore '_' to match a single character only in the LIKE operator|`SELECT * FROM Person.StateProvince WHERE Name LIKE 'AL____';`|
|Use the NOT LIKE operator to find records that don't match a particular pattern|`SELECT * FROM Purchasing.Vendor WHERE Name NOT LIKE '%,%';`|
|Use Escape Single Characters in the LIKE operator|`SELECT * FROM Purchasing.Vendor WHERE Name LIKE '%''%';`|

# `ORDER BY` | `GROUP BY` | `OFFSET-FETCH`

|Functionality|Code Example|
|-------------|------------|
|Use the ORDER BY clause to sort the result set based on a specific column|`SELECT JobCandidateId, ModifiedDate FROM HumanResources.JobCandidate ORDER BY ModifiedDate DESC;`|
|Use the TOP clause to limit the number of rows returned in the result set|`SELECT TOP 3 JobCandidateId, ModifiedDate FROM HumanResources.JobCandidate ORDER BY ModifiedDate DESC;`|
|Use the OFFSET-FETCH clause to retrieve a specific range of rows from a result set|`Select BusinessEntityID, NationalIDNumber, HireDate FROM HumanResources.Employee ORDER BY HireDate ASC OFFSET 5 ROWS FETCH NEXT 20 ROWS ONLY;`|
|Use the GROUP BY clause to group the rows in the result set based on one or more columns|`SELECT SalesOrderID, sum(OrderQty) as SumQty FROM Sales.SalesOrderDetail GROUP BY SalesOrderID;`|

# Numerical Functions



# Date Functions

| Function Name | Description | Example |
|---------------|-------------|---------|
| DateAdd       | Adds Date or time to another Date | `DATEADD(yyyy, 3, SellStartDate)` |
| DateDiff      | Returns the difference of 2 dates or date time | `DATEDIFF(yyyy, SellStartDate, SellEndDate)` |
| DatePart      | Returns a part of the date as Integer | `DATEPART(yyyy, SellStartDate)` |
| YEAR, MONTH, DAY | Returns the year, month, and day of a date respectively | `YEAR(SellStartDate)` |
| DATENAME | Returns a part of the date as String | `DATENAME(MONTH, SellStartDate)` |
| EOMONTH | Returns the last date of the month from a specific date | `EOMONTH(SellStartDate)` |
| CURRENT_TIMESTAMP | Returns the current system date with time (without Time Zone) | `SELECT CURRENT_TIMESTAMP` |
| GETDATE | Returns the current system's date with time from the server | `SELECT GETDATE()` |
| SYSDATETIME | Returns the current system's date with time from the server (with more precision than getdate()) | `SELECT SYSDATETIME()` |
| SYSDATETIMEOFFSET | Returns the current system date with time (with Time Zone) | `SELECT SYSDATETIMEOFFSET()` |
| ISDATE | Returns a Boolean value of 1 if the expression is a valid date/time/datetime else returns a Boolean value of 0 | `ISDATE(SellStartDate)` |
| ISNULL | Check whether an expression is a NULL value or not | `ISNULL(NULL, 'ABC')` |
| ISNUMERIC | Check if an expression contains a Numeric value or not | `ISNUMERIC(StandardCost)` |
| COALESCE | Returns the first Non-NULL value from the list | `COALESCE(NULL, NULL, 'Welcome', NULL, 'SQL')` |

# String Functions

| Function Name | Description | Example |
|---------------|-------------|---------|
| CHARINDEX() | Returns the position of a substring from a specific position in a string | `SELECT CHARINDEX(''D'', ''DAD'');` |'
UNION
| CONCAT() | Concatenates two or more strings together | SELECT CONCAT(''Hello'','' World''); |'
UNION
| DATALENGTH() | Returns the number of bytes used including the leading and trailing spaces | SELECT DATALENGTH(''Hello World''); |'
UNION
| FORMAT() | Formats input string to a particular format | SELECT FORMAT(20200616, ''####-##-##''); |'
UNION
| LEFT() | Select fixed number of characters from the left | SELECT LEFT(''Hello World'', 5); |'
UNION
| RIGHT() | Select fixed number of characters from the right | SELECT RIGHT(''Hello World'', 5); |'
UNION
| LEN() | To calculate the length of a string | SELECT LEN(''Hello World''); |'
UNION
| LOWER() | Converts to lowercase | SELECT LOWER(''Hello World''); |'
UNION
| UPPER() | Converts to uppercase | SELECT UPPER(''Hello World''); |'
UNION
| TRIM() | Trims whitespaces | SELECT TRIM(''    Hello World     ''); |'
UNION
| PATINDEX() | Displays the position of the first occurrence of a pattern in input string | SELECT PATINDEX(''%World%'', ''Hello World''); |'
UNION
| REPLACE() | Replaces all occurrences of a substring by another substring inside the main string | SELECT REPLACE(''Hello World'', ''World'', ''Earth''); |'
UNION
| REPLICATE() | Repeats a string a particular number of times | SELECT REPLICATE(''Hello World'', 3); |'
UNION
| REVERSE() | Reverses the string while displaying the result | SELECT REVERSE(''Hello World''); |'
UNION
| SUBSTRING() | Extracts a substring(some characters) from the main string | SELECT SUBSTRING(''Hello World'', 7, 5); |'
UNION
| STR() | Returns a number as a string while displaying the result | SELECT STR(123); |'



