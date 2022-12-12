-- DateAdd(): Adds Date or time to another Date.
/*
- year,y,yyyy,yy
- quarter,q,qq
- month, m, mm
- day, d, dd
- hour, hh
- minute, mi, n
- second, ss, s
- millisecond, ms
*/

-- Add 3 years or 3 quarters
SELECT ProductID, SellStartDate, 
DATEADD(yyyy, 3, SellStartDate) AS NewSellStartDate,
DATEADD(q, 3, SellStartDate) AS NewSellStartDate
FROM Production.Product;

-- DateDiff(date-part, date1, date2): Returns the difference of 2 dates or date time.
SELECT ProductID, SellStartDate, SellEndDate, DATEDIFF(yyyy, SellStartDate, SellEndDate) AS DiffDate
FROM Production.Product
WHERE SellEndDate IS NOT NULL;

-- DatePart(date-interval, date-field): Returns a part of the date as Integer.
SELECT ProductID, SellStartDate, 
DATEPART(yyyy, SellStartDate) AS ExtractYear,
DATEPART(MONTH, SellStartDate) AS ExtractMonth
FROM Production.Product;

-- YEAR(), MONTH(), DAY()
SELECT ProductID, SellStartDate, 
YEAR(SellStartDate) AS ExtractYear,
MONTH(SellStartDate) AS ExtractMonth,
DAY(SellStartDate) AS ExtractDay
FROM Production.Product;

-- Datename(date-interval, dateField): Returns a part of the date as String.
-- Instead of 05, it return May.
SELECT ProductID, SellStartDate, DATENAME(MONTH, SellStartDate) AS ExtractMonth
FROM Production.Product;

-- eomonth(): Returns the last date of the month from a specific date.
SELECT ProductID, SellStartDate, EOMONTH(SellStartDate) AS EndOfMonth
FROM Production.Product;

-- CURRENT_TIMESTAMP: Returns the current system date with time (without Time Zone).
-- DEFAULT CURRENT_TIMESTAMP;
SELECT CURRENT_TIMESTAMP; -- 2022-12-12 13:55:13.660

-- GETDATE(): Returns the current system's date with time from the server. CURRENT_TIMESTAMP is the ANSI SQL alternative for the getdate() function and both will give the same result.
SELECT GETDATE(); -- 2022-12-12 13:55:35.520

-- SysDateTime(): Returns the current system's date with time from the server (with more precision than getdate()).
SELECT SYSDATETIME(); -- 2022-12-12 13:55:54.0302253

-- SYSDATETIMEOFFSET(): Returns the current system date with time (with Time Zone).
SELECT SYSDATETIMEOFFSET(); -- 2022-12-12 13:56:07.6865247 +08:00

-- isDate(): Returns a Boolean value of 1 if the expression is a valid date/time/datetime else returns a Boolean value of 0.
SELECT SellStartDate, ISDATE(SellStartDate)
FROM Production.Product;
SELECT ISDATE(1) AS booleanValue; -- 0

-- isNull(a,b): Check whether an expression is a NULL value or not. <br> Returns b if a is NULL else return a itself.
SELECT ISNULL(NULL, 'ABC'); -- ABC
SELECT ISNULL('123', 'ABC'); -- 123
SELECT ISNULL(' ', 5);

SELECT Color, ISNULL(Color, 'Null Value') AS CheckForNull
FROM Production.Product;

-- isNumeric(): Check if an expression contains a Numeric value or not. <br> Returns the Boolean value 1(True) & 0(False).
SELECT StandardCost, 
ISNUMERIC(StandardCost) AS TestNumeric, -- returns 1 if true
ISNUMERIC(Color) AS TestColor -- returns 0
FROM Production.Product;

-- Coalesce(val1, val2,...,valn): Returns the first Non-NULL value from the list.
SELECT COALESCE(NULL, NULL, 'Welcome', NULL, 'SQL'); -- Welcome
SELECT COALESCE(NULL, NULL, NULL, NULL, 'SQL'); -- SQL

SELECT Title, MiddleName, COALESCE(Title, MiddleName) AS FirstNonNull
FROM Person.Person;

-- NULLIF(expression1, expression2): Returns NULL if both the expressions are equal.
SELECT NULLIF(10,10); -- NULL
SELECT NULLIF(10,12); -- 10

-- convert(todatatype, expression): Convert to another data type.
SELECT StandardCost, 
CONVERT(INT, StandardCost) AS ConvertedType,
CONVERT(NVARCHAR(20), StandardCost) AS ConvertedType2
FROM Production.Product;

-- IIF(): Takes 3 arguments and tests the first argument. 
-- If it is true, then displays the 2nd argument else displays the 3rd argument.
SELECT ProductID, StandardCost, ListPrice, 
	IIF(ListPrice >= StandardCost, 'Profit', 'Loss') AS TestCondition
FROM Production.Product;
