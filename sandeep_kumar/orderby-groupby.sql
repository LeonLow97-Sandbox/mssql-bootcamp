-- FROM -> WHERE -> SELECT -> ORDER BY

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

-- FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY






















