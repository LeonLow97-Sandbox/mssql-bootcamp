-- create table with 1 primary key
CREATE TABLE retail.SinglePKStoreProds
(
	StoreID INT PRIMARY KEY,
	StoreName VARCHAR(40) NOT NULL,
	ProdID INT NOT NULL
);

-- giving a key name to the composite key
CREATE TABLE retail.StoreProds
(
	StoreID INT,
	StoreName VARCHAR(40) NOT NULL,
	ProdID INT NOT NULL,
	Threshold SMALLINT,
	CONSTRAINT PK_StoreProds PRIMARY KEY (StoreID, ProdID)
);






