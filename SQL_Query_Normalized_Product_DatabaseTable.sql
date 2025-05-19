--Product table normalization

-- 1. ProductType (Id, ProductType)

-- 1 Electronic
-- 2 Grocery
-- 3 Bakery


-- 2. BrandName (Id, BrandName)

-- 1 LG
-- 2 Panasonic
-- 3 Britania
-- 4 Balaji
-- 5 Amul
-- 6 Lays


-- 3. Product (Id, ProductName, ProductTypeId)

-- 1. AC 1
-- 2. TV 1
-- 3. Wafers 2



-- 3. BrandProductMapping (MappingId,ProductId,BrandId,ActualPrice)

-- 1 1 2
-- 2 1 1
-- 3 3 4 , 10
-- 4 3 6 , 20

-- BrandDiscountMapping (MappingId, BrandProductMappingId, Discount(%),startdate, enddate NULLABLE)
-- 1 4 5% '16-May', '20-May'
-- 2 3 2% '16-May', NULL

USE PRODUCT_TASK;

DROP TABLE Product;

-- 1. ProductType (Id, ProductType)

-- 1 Electronic
-- 2 Grocery
-- 3 Bakery

CREATE TABLE ProductType
(
	[ID] INT PRIMARY KEY IDENTITY(1, 1),
	[ProductName] VARCHAR(100),
	[ProductType] VARCHAR(100)
)

ALTER TABLE ProductType
DROP COLUMN ProductName;

-- 2. BrandName (Id, BrandName)

-- 1 LG
-- 2 Panasonic
-- 3 Britania
-- 4 Balaji
-- 5 Amul
-- 6 Lays

CREATE TABLE Brand
(
	[ID] INT PRIMARY KEY IDENTITY(1, 1),
	[BrandName] VARCHAR(100)
)


SELECT * FROM ProductType;
--ELECTRONICS
INSERT INTO ProductType (ProductType)
VALUES ('ELECTRONICS');
--GROCERY
INSERT INTO ProductType (ProductType)
VALUES ('GROCERY');
--BAKERY
INSERT INTO ProductType (ProductType)
VALUES ('BAKERY');
--SANITATION
INSERT INTO ProductType (ProductType)
VALUES ('SANITATION');

--Balaji
INSERT INTO Brand (BrandName)
VALUES ('Balaji');
--Balaji
INSERT INTO Brand (BrandName)
VALUES ('Britannia');
--Jaguar
INSERT INTO Brand (BrandName)
VALUES ('Doon');
--
INSERT INTO Brand (BrandName)
VALUES ('Aeroplane');
--Balaji
INSERT INTO Brand (BrandName)
VALUES ('Apollo');
--Balaji
INSERT INTO Brand (BrandName)
VALUES ('Perryware');
--Balaji
INSERT INTO Brand (BrandName)
VALUES ('Samsung');
--Balaji
INSERT INTO Brand (BrandName)
VALUES ('Redmi');

INSERT INTO Brand (BrandName)
VALUES ('OnePlus');

INSERT INTO Brand (BrandName)
VALUES ('SONY');

SELECT * FROM Brand;

-- 3. Product (Id, ProductName, ProductTypeId)

-- 1. AC 1
-- 2. TV 1
-- 3. Wafers 2

CREATE TABLE Product
(
	[ID] INT PRIMARY KEY IDENTITY,
	[ProductName] VARCHAR(100),
	[ProductTypeID] INT,
	FOREIGN KEY (ProductTypeID) REFERENCES ProductType(ID)
);

SELECT * FROM Brand;

INSERT INTO Brand (BrandName)
VALUES ('OnePlus');

INSERT INTO Brand
VALUES ('Lenovo');


SELECT * FROM ProductType;
SELECT * FROM Product;

--Product-1
INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Wafer', 1);

UPDATE Product
SET ProductTypeID = 2
WHERE ProductTypeID = 1;

--Product-2
INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Goodday', 3);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Prima-Sink', 4);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('OnePlus-7', 1);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Galaxy-S25-Ultra', 1);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Jim-Jam', 3);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Milk', 2);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Tea', 2);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Wheat', 2);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Cake', 3);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Rice', 2);

INSERT INTO Product(ProductName, ProductTypeID)
VALUES ('Jet-spray', 4);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Bidet', 4);

INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Wireless-Bullets', 1);


INSERT INTO Product (ProductName, ProductTypeID)
VALUES ('Legion-Pro-5i', 1);


SELECT * FROM Product;

INSERT INTO Brand(BrandName)
VALUES ('Jaguar');

INSERT INTO Brand (BrandName)
VALUES ('Amul');


CREATE TABLE BrandProductMapping
(
	[MappingID] INT PRIMARY KEY IDENTITY(1, 1),
	[ProductID] INT,
	FOREIGN KEY (ProductID) REFERENCES Product(ID),
	[BrandID] INT,
	FOREIGN KEY (BrandID) REFERENCES Brand(ID)
);


ALTER TABLE BrandProductMapping
ADD ActualPrice INT;

TRUNCATE TABLE BrandProductMapping;

SELECT * FROM BrandProductMapping;



INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (1, 1, 20);

SELECT * FROM Product;
SELECT * FROM Brand;

--execute from here 
INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (2, 2, 30);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (3, 13, 30000);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (4, 9, 40000);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (5, 7, 140000);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (6, 2, 40);


INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (7, 14, 32);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (8, 2, 680);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (9, 4, 3000);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (10, 2, 90);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (11, 3, 5000);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (12, 6, 1500);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (13, 6, 2500);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (14, 9, 2000);

INSERT INTO BrandProductMapping (ProductID, BrandID, ActualPrice)
VALUES (15, 12, 180000);

SELECT * FROM BrandProductMapping;

-- BrandDiscountMapping (MappingId, BrandProductMappingId, Discount(%),startdate, enddate NULLABLE)
-- 1 4 5% '16-May', '20-May'
-- 2 3 2% '16-May', NULL

SELECT * FROM Product;
SELECT * FROM Brand;

CREATE TABLE BrandDiscountMapping
(
	[MappingID] INT PRIMARY KEY IDENTITY,
	[BrandProductMappingID] INT,
	FOREIGN KEY (BrandProductMappingID) REFERENCES BrandProductMapping(MappingID),
	[Discount] INT,
	CONSTRAINT CK_BrandProductMapping_Discount CHECK (Discount BETWEEN 0 AND 100),
	[StartDate] DATE,
	[EndDate] DATE NULL
);

SELECT * FROM BrandProductMapping;
SELECT * FROM Product;

UPDATE Product
SET ProductName = 'Salted-Wafer'
WHERE ProductName = 'Wafer';

--Product-1
INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (1, 20, '2025-05-16', null);

SELECT * FROM BrandDiscountMapping;

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (2, 12, '2025-05-16', '2025-06-16');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (3, 25, '2025-05-16', '2025-07-16');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (4, 30, '2025-05-16', '2025-05-31');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (5, 15, '2025-05-16', '2025-06-22');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (6, 25, '2025-05-16', '2025-05-23');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (7, 5, '2025-05-16', '2025-06-22');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (8, 20, '2025-05-16', '2025-05-26');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (9, 18, '2025-05-16', '2025-07-16');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (10, 20, '2025-05-16', '2025-07-17');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (11, 20, '2025-05-16', '2025-07-18');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (12, 25, '2025-05-16', '2025-06-12');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (13, 15, '2025-05-16', '2025-07-13');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (14, 22, '2025-05-16', '2025-08-15');

INSERT INTO BrandDiscountMapping (BrandProductMappingID, Discount, StartDate, EndDate)
VALUES (15, 30, '2025-05-16', '2025-06-16');


SELECT * FROM BrandDiscountMapping;