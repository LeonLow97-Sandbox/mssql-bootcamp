-- RIGHT JOIN: Return all record from Right Table and only the matching records from Left Table.

SELECT CustomerID, StoreID
FROM Sales.Customer
WHERE CustomerID IN (703, 705, 709);

SELECT C.CustomerID, PCC.BusinessEntityID, C.StoreID, PCC.CreditCardID
FROM Sales.Customer C
	RIGHT JOIN
Sales.PersonCreditCard PCC
ON C.CustomerID = PCC.BusinessEntityID;

-- Similar to LEFT JOIN if we swap the tables

SELECT C.CustomerID, PCC.BusinessEntityID, C.StoreID, PCC.CreditCardID
FROM Sales.PersonCreditCard PCC
	LEFT JOIN
Sales.Customer C 
ON C.CustomerID = PCC.BusinessEntityID;

























