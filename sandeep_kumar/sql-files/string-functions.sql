-- String Functions

-- CHARINDEX(): In a string, this will return the position of a substring from a specific position.
-- CHARINDEX(subStr, mainString, startPosition) startPosition default = 1
SELECT CHARINDEX('D', 'DAD'); -- 1
SELECT CHARINDEX('D', 'DAD', 2); -- 3 (start from 'A')

SELECT Name, CHARINDEX('Cr', Name)
FROM Production.Product
WHERE Name LIKE '%Cr%';

-- CONCAT()
-- CONCAT_WS()

-- DATALENGTH(): returns the number of bytes used including the leading and trailing spaces
SELECT FirstName, DATALENGTH(FirstName) As NumberOfBytes
FROM Person.Person
GROUP BY FirstName;

-- FORMAT(): formats input stirng to a particular format
SELECT FORMAT(20200616, '####-##-##'); -- 2020-06-16
SELECT FORMAT(20200616, '####/##/##'); -- 2020/06/16

-- LEFT(): select fixed number of characters from the left
-- LEFT(MainString, Count)
SELECT FirstName, LEFT(FirstName, 3) AS ExtractNameFromLeft
FROM Person.Person;

-- RIGHT(): select fixed number of characters from the right
SELECT FirstName, RIGHT(FirstName, 2) AS ExtractNameFromRight
FROM Person.Person;

-- LEN(): To calculate the length of a string.
SELECT FirstName, LEN(FirstName) AS ExtractLengthOfName
FROM Person.Person;

-- LOWER(): converts to lowercase.
SELECT FirstName, LOWER(FirstName) as LowerFName
FROM Person.Person;

-- UPPER(): converts to uppercase.
SELECT FirstName, UPPER(FirstName) as LowerFName
FROM Person.Person;

-- TRIM(): trims whitespaces
SELECT LTRIM('          Trim Left Side');
SELECT RTRIM('Trim Right Side      ');
SELECT TRIM('    Trim Both The Sides     ');

-- patindex(): Displays the position of the first occurrence of a pattern in input string.
SELECT NAME, PATINDEX('%Ball%', Name)
FROM Production.Product
WHERE NAME LIKE '%Ball%';

-- Underscore represents any character
SELECT NAME, PATINDEX('%Cr_nk%', Name) -- "Crank"
FROM Production.Product
WHERE NAME LIKE '%Cr%';

-- replace(): Replaces all occurrences of a substring by another substring inside the main string.
SELECT LoginID, REPLACE(LoginID, 'adventure-works','aw') AS ReplacedString
FROM HumanResources.Employee;

-- replicate(): Repeats a string a particular number if times.
-- REPLICATE(String, Count)
SELECT FirstName, REPLICATE(FirstName, 5) AS ReplicateFName
FROM Person.Person;

-- reverse(): Reverses the string while displaying the result
SELECT FirstName, REVERSE(FirstName) AS ReverseFName
FROM Person.Person;

-- substring(): Extracts a substring(some characters) from the main string
-- SUBSTRING (MainString, StartingPosition, Length);
SELECT TOP 100 LastName, SUBSTRING(LastName, 3, 5) AS ReverseFName
FROM Person.Person
ORDER BY LastName;

-- str(): Returns a number as a string while displaying the result
SELECT ProductID, STR(ProductID) 
FROM Production.Product;







