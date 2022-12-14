use AdventureWorks2019;

-- SubQuery

-- SubQuery is always performed first before MainQuery.
SELECT BusinessEntityID, NationalIDNumber, JobTitle, HireDate
FROM HumanResources.Employee
WHERE BusinessEntityID IN
	(SELECT BusinessEntityID
		FROM HumanResources.EmployeeDepartmentHistory
		WHERE BusinessEntityID <= 100
	)
ORDER BY JobTitle;

-- 3rd maximum value of unit price
SELECT MIN(UnitPrice)
FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice IN
	(SELECT TOP 3 UnitPrice
	 FROM Purchasing.PurchaseOrderDetail
	 GROUP BY UnitPrice
	 ORDER BY UnitPrice DESC
	 );

-- Finding Unit Price that are below the average of ListPrice of another table.
SELECT PurchaseOrderID, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice < 
	(SELECT AVG(ListPrice)
	FROM Production.Product
	);

-- EXISTS Operator: To check if a particular record exists (returns true or false)
-- Example: Check 

SELECT *
FROM HumanResources.Employee;

SELECT * 
FROM HumanResources.Department;

SELECT BusinessEntityId, JobTitle
FROM HumanResources.Employee
WHERE EXISTS
	(SELECT DepartmentID
	 FROM HumanResources.Department
	 WHERE Name = 'Sales'
	);

SELECT BusinessEntityId, JobTitle
FROM HumanResources.Employee
WHERE EXISTS
	(SELECT DepartmentID
	 FROM HumanResources.Department
	 WHERE Name = 'Sales'
	) AND JobTitle LIKE '%Sales%';

-- NESTING Of Subquery
SELECT DISTINCT ProductSubcategoryID
FROM Production.Product
WHERE ProductSubCategoryID IN
	(SELECT ProductSubcategoryID
	 FROM Production.ProductSubcategory
	 WHERE ProductCategoryID IN
		(SELECT ProductCategoryID
		 FROM Production.ProductCategory
		 WHERE Name LIKE '%Bikes%'
		 )
	);

-- Using Subquery as an expression

SELECT * FROM Purchasing.PurchaseOrderDetail;

SELECT PurchaseOrderId, TaxAmt, 
	(SELECT SUM(OrderQty)
	 FROM Purchasing.PurchaseOrderDetail POD
	 WHERE POD.PurchaseOrderID = POH.PurchaseOrderID
	 GROUP BY POD.PurchaseOrderID
	 ) AS SumOrderQty
FROM Purchasing.PurchaseOrderHeader POH
ORDER BY POH.PurchaseOrderID;

-- Using SubQuery with FROM clause
-- Example: Find the average of minUnitPrice (temporary column)
SELECT AVG(minUnitPrice) as avgMinUnitPricePerOrder
FROM
	(SELECT PurchaseOrderID, MIN(UnitPrice) AS minUnitPrice
	FROM Purchasing.PurchaseOrderDetail
	GROUP  BY PurchaseOrderID
	) AS minUnitPricePerOrder;

-- ANY Operator: Returns TRUE if any of the value in SubQuery meets the condition
-- ALL Operator: Reutrns TRUE if all the values in SubQuery meets the condition

















































