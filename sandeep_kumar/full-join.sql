-- FULL JOIN: Combination of LEFT JOIN and RIGHT JOIN

SELECT C.CustomerID, PCC.BusinessEntityID, C.StoreID, PCC.CreditCardID
FROM Sales.Customer C
	FULL JOIN
Sales.PersonCreditCard PCC
ON C.CustomerID = PCC.BusinessEntityID;


































