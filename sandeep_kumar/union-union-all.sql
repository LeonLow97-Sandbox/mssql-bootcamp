use AdventureWorks2019;

-- UNION and UNION ALL

SELECT PurchaseOrderID -- int
FROM Purchasing.PurchaseOrderDetail
	UNION
SELECT PurchaseOrderID -- int
FROM Purchasing.PurchaseOrderHeader;

SELECT PurchaseOrderDetailID -- int
FROM Purchasing.PurchaseOrderDetail
	UNION
SELECT TaxAmt -- money (same data type as int)
FROM Purchasing.PurchaseOrderHeader
ORDER BY PurchaseOrderDetailID ASC;

-- Multiple UNION 
SELECT BusinessEntityID
FROM HumanResources.Employee
	UNION
SELECT BusinessEntityID
FROM Person.Person
	UNION
SELECT BusinessEntityID
FROM Purchasing.ProductVendor
	UNION
SELECT CustomerID
FROM Sales.Customer
	UNION
SELECT BusinessEntityID
FROM Sales.SalesPerson;

-- Using another data type (nvarchar)
SELECT NationalIDNumber
FROM HumanResources.Employee
	UNION
SELECT FirstName
FROM Person.Person;

SELECT FirstName + MiddleName + LastName AS FullName
FROM Person.Person
	UNION
SELECT Name
FROM Purchasing.Vendor
ORDER BY FullName; -- order by in first select

-- UNION ALL: does not remove duplicates
--  to sort the results, use ORDER BY
d
SELECT PurchaseOrderID
FROM Purchasing.PurchaseOrderDetail
	UNION ALL
SELECT PurchaseOrderID
FROM Purchasing.PurchaseOrderHeader
ORDER BY PurchaseOrderID DESC;






