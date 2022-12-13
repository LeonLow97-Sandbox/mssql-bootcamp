-- LEFT JOIN: Return all record from Left Table and only the matching records from the Right Table.

SELECT BusinessEntityID
FROM Sales.PersonCreditCard
ORDER BY BusinessEntityID ASC;

SELECT CustomerID
FROM Sales.Customer
ORDER BY CustomerID ASC;

SELECT C.CustomerID, PCC.BusinessEntityID, C.StoreID, PCC.CreditCardID
FROM Sales.Customer C
	LEFT OUTER JOIN
Sales.PersonCreditCard PCC
ON C.CustomerID = PCC.BusinessEntityID;

-- LEFT JOIN on PersonID (Having many NULL values on the left table)

SELECT C.PersonID, PCC.BusinessEntityID, C.StoreID, PCC.CreditCardID
FROM Sales.Customer C
	LEFT OUTER JOIN
Sales.PersonCreditCard PCC
ON C.PersonID = PCC.BusinessEntityID
WHERE C.PersonID IS NOT NULL;

