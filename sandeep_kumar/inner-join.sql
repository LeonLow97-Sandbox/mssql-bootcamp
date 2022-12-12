-- Implicit Join

SELECT Purchasing.PurchaseOrderDetail.PurchaseOrderID,
	   Purchasing.PurchaseOrderDetail.PurchaseOrderDetailID,
	   Purchasing.PurchaseOrderDetail.OrderQty,
	   Purchasing.PurchaseOrderHeader.OrderDate,
	   Purchasing.PurchaseOrderHeader.ShipDate
FROM Purchasing.PurchaseOrderDetail, Purchasing.PurchaseOrderHeader
WHERE Purchasing.PurchaseOrderDetail.PurchaseOrderID 
		= 
	  Purchasing.PurchaseOrderHeader.PurchaseOrderID;

-- Cleaner way
SELECT POD.PurchaseOrderID,
	   POD.PurchaseOrderDetailID,
	   POD.OrderQty,
	   POH.OrderDate,
	   POH.ShipDate
FROM Purchasing.PurchaseOrderDetail POD, Purchasing.PurchaseOrderHeader POH
WHERE POD.PurchaseOrderID 
		= 
	  POH.PurchaseOrderID;

-- INNER JOIN (can also use JOIN)
SELECT POD.PurchaseOrderID,
	   POD.PurchaseOrderDetailID,
	   POD.OrderQty,
	   POH.OrderDate,
	   POH.ShipDate
FROM Purchasing.PurchaseOrderDetail POD -- changing the order of the FROM for the 2 tables doesnt matter
	INNER JOIN
Purchasing.PurchaseOrderHeader POH
ON POD.PurchaseOrderID = POH.PurchaseOrderID;
-- WHERE YEAR(POH.OrderDate) = 2014;

-- INNER JOIN (more than 2 tables)
SELECT P.ProductID, P.Name, PC.ProductCategoryID, PC.Name,
		PSC.ProductSubCategoryID
FROM Production.Product P
	INNER JOIN
Production.ProductSubcategory PSC
ON PSC.ProductSubcategoryID = P.ProductSubcategoryID
	INNER JOIN
Production.ProductCategory PC
ON PC.ProductCategoryID = PSC.ProductCategoryID;




