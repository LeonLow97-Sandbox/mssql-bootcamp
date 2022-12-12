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

SELECT PurchaseOrderID, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice < 
	(SELECT AVG(ListPrice)
	FROM Production.Product
	);






































