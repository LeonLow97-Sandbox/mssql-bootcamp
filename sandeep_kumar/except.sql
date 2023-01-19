SELECT SalesOrderID
FROM Sales.SalesOrderDetail
	EXCEPT
SELECT CustomerID
FROM Sales.Customer;