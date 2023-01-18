SELECT ProductSubCategoryID
FROM Production.Product
	INTERSECT
SELECT ProductSubCategoryID
FROM Production.ProductSubcategory;

-- will not work (first select has 2 fields but second select only has 1 field)
SELECT ProductSubCategoryID, ProductID
FROM Production.Product
	INTERSECT
SELECT ProductSubCategoryID
FROM Production.ProductSubcategory;





