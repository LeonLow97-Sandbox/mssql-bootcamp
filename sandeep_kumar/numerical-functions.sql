-- Functions

-- Numerical Functions in MS SQL
-- sum() Function
SELECT SUM(StandardCost)
FROM Production.Product;

-- same thing
SELECT SUM(ALL StandardCost)
FROM Production.Product;

-- sum of distinct values only
SELECT SUM(DISTINCT StandardCost)
FROM Production.Product;

-- avg()
SELECT MakeFlag, AVG(StandardCost) AS AvgStdCost
FROM Production.Product
GROUP BY MakeFlag;

SELECT MakeFlag, AVG(ALL StandardCost) AS AvgStdCost
FROM Production.Product
GROUP BY MakeFlag;

SELECT MakeFlag, AVG(DISTINCT StandardCost) AS AvgStdCost
FROM Production.Product
GROUP BY MakeFlag;

-- count()
-- counts the number of rows in the table
SELECT COUNT(*)
FROM Production.Product;

-- counts the number of NON-NULL rows in that column
SELECT COUNT(color)
FROM Production.Product
WHERE color IS NOT NULL;

SELECT MakeFlag, COUNT(StandardCost) AS CountStdCost
FROM Production.Product
GROUP BY MakeFlag;

SELECT MakeFlag, COUNT(DISTINCT StandardCost) AS CountStdCost
FROM Production.Product
GROUP BY MakeFlag;

-- max()
SELECT MakeFlag, MAX(StandardCost) AS MaxStdCost
FROM Production.Product
GROUP BY MakeFlag
ORDER BY MAX(StandardCost);

-- min()
SELECT MIN(StandardCost)
FROM Production.Product
WHERE StandardCost > 0;

-- abs()
SELECT ABS(-12345.45);

-- round up to the nearest integer value
SELECT StandardCost, CEILING(StandardCost)
FROM Production.Product
WHERE StandardCost > 0;

-- round down to the nearest integer value
SELECT StandardCost, FLOOR(StandardCost)
FROM Production.Product
WHERE StandardCost > 0;

-- random value
SELECT RAND();

SELECT RAND() + 3;
SELECT RAND()*5 + 3; -- >= 3 and < 8

SELECT CEILING(RAND() * 5 + 3); -- >= 3 and <= 8

-- rounded to 2 decimal places
SELECT ROUND(345.678, 2); -- 345.680
SELECT ROUND(345.67856, 3); -- 345.67900







