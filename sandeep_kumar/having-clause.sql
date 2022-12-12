-- HAVING Clause
-- Mostly used to filter the Records of aggregate function or 
-- Records where `GROUP BY` clause is used.

SELECT MAX(StandardCost) -- MAX() an aggregate function
FROM Production.Product
HAVING MAX(StandardCost) > 0; -- cannot use HAVING clause

SELECT DueDate, SUM(OrderQty) AS TotalOrderPerDueDate
FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate) > 2011 AND MONTH(DueDate) < 9 -- YEAR() and MONTH() are not aggregate functions
GROUP BY DueDate
ORDER BY DueDate DESC;

SELECT DueDate, SUM(OrderQty) AS TotalOrderPerDueDate
FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate) > 2011 AND MONTH(DueDate) < 9
GROUP BY DueDate
HAVING SUM(OrderQty) < 6000
ORDER BY DueDate DESC;































