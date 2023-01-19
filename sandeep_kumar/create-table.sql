CREATE TABLE Stores (
	StoreId INT IDENTITY(1,1), -- autoincrement field (start with 1, increment by 1)
	StoreNumber VARCHAR(50),
	PhoneNumber CHAR(14),
	Email VARCHAR(50),
	Address VARCHAR(120),
	City VARCHAR(40),
	State VARCHAR(10),
	ZipCode INT
);

-- Create table under retail schema
CREATE TABLE retail.Stores (
	StoreId INT IDENTITY(1,1), -- autoincrement field (start with 1, increment by 1)
	StoreNumber VARCHAR(50),
	PhoneNumber CHAR(14),
	Email VARCHAR(50),
	Address VARCHAR(120),
	City VARCHAR(40),
	State VARCHAR(10),
	ZipCode INT
);

-- Create table with NOT NULL constraint
CREATE TABLE retail.NotNullStores (
	StoreId INT IDENTITY,
	StoreNumber VARCHAR(50) NOT NULL,
	PhoneNumber CHAR(14) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Address VARCHAR(120) NOT NULL,
	City VARCHAR(40) NOT NULL,
	State VARCHAR(10) NOT NULL,
	ZipCode INT NOT NULL
);

-- Create table with CHECK constraint
CREATE TABLE CheckItems (
	ItemId INT IDENTITY,
	ItemName VARCHAR(255) NOT NULL UNIQUE,
	MinQty INT CHECK(MinQty >= 10)
);

-- Multiple constraints with CHECK
CREATE TABLE CheckItems1 (
	ItemId INT IDENTITY,
	ItemName VARCHAR(255) NOT NULL UNIQUE,
	MinQty INT,
	CONSTRAINT CHK_CheckItems1_MinQty CHECK (MinQty >= 10
		AND ItemName <> 'General Store')
);

-- Create table with UNIQUE constraint
CREATE TABLE retail.UniqueStores (
	StoreId INT IDENTITY,
	StoreNumber VARCHAR(50) NOT NULL UNIQUE,
	PhoneNumber CHAR(14) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Address VARCHAR(120) NOT NULL,
	City VARCHAR(40) NOT NULL,
	State VARCHAR(10) NOT NULL,
	ZipCode INT NOT NULL,
	UNIQUE(PhoneNumber), -- can also add here too
	UNIQUE (City, ZipCode) -- multiple unique constraints
);

-- Create UNQIUE constraint with key name for constraint
CREATE TABLE retail.UniqueStores1 (
	StoreId INT IDENTITY,
	StoreNumber VARCHAR(50) NOT NULL,
	PhoneNumber CHAR(14) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Address VARCHAR(120) NOT NULL,
	City VARCHAR(40) NOT NULL,
	State VARCHAR(10) NOT NULL,
	ZipCode INT NOT NULL,	
	CONSTRAINT UK_UniqueStores_StoreId_StoreNumber UNIQUE (StoreId, StoreNumber)
);

-- Create table with DEFAULT constraint
CREATE TABLE retail.DefaultItems (
	ItemId INT IDENTITY,
	ItemName VARCHAR(255) NOT NULL DEFAULT 'General Stores',
	MinQty INT
);

CREATE TABLE retail.DefaultStores (
	StoreId INT NOT NULL,
	StoreName VARCHAR(255) NOT NULL,
	StoreOrderDate DATETIME DEFAULT GETDATE()
);











