CREATE DATABASE PRODUCT_TASK;

USE PRODUCT_TASK;


--CREATE TABLE
CREATE TABLE Product
(
	[ProductID] INT PRIMARY KEY IDENTITY,
	[ProductType] VARCHAR(50),
	[BrandName] VARCHAR(100),
	[Price] DECIMAL,
	[DiscountedPrice] DECIMAL
);

TRUNCATE TABLE Product;

SELECT * FROM Product;

--1st value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('ELECTRONICS', 'SONY', 10000, 9900);

--2nd value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('ELECTRONICS', 'SONY', 10000, 9900);

--3rd value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('ELECTRONICS', 'REDMI', 15000, 14000);

--4th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('ELECTRONICS', 'SAMSUNG', 20000, 19000);

--5th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('BAKERY', 'BRITANNIA', 100, 90);

--6th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('BAKERY', 'BRITANNIA', 500, 470);

--7th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('BAKERY', 'BRITANNIA', 200, 180);

--8th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('GROCERY', 'DOON', 3000, 2800);

--9th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('GROCERY', 'AEROPLANE', 4000, 3899);

--10th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('MEIDCAL', 'APOLLO', 6000, 5000);

--11th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('MEIDCAL', 'APOLLO', 20000, 19000);

--12th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('SANITATION', 'JAGUAR', 40000, 38770);

--13th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('SANITATION', 'JAGUAR', 30000, 27800);

--14th value
INSERT INTO Product (ProductType, BrandName, Price, DiscountedPrice)
VALUES ('SANITATION', 'PERRYWARE', 20000, 19950);


SELECT * FROM Product;

UPDATE Product
SET ProductType = 'MEDICAL'
WHERE ProductType = 'MEIDCAL'

UPDATE Product
SET Price = 12000, DiscountedPrice = 11000
WHERE ProductID = 1;

UPDATE Product
SET BrandName = 'OnePlus'
WHERE ProductID = 1;

SELECT * FROM Product;
--TASKS
--TASK-1 COUNT OF TOTAL PRODUCTS
SELECT COUNT(*) AS TotalProducCount
FROM Product AS TotalProducts;

--TASK-2 COUNT OF ELECTRONICS PRODUCTS
SELECT COUNT(*) TotalElectronicProducts
FROM Product  product
WHERE product.ProductType = 'ELECTRONICS';

--TASK-3 FIND MAXIMUM DISOUNTED PRICE
SELECT MAX(product.DiscountedPrice) AS MaximumDiscountedPrice
FROM Product product;


--TASK-4 MINIMUM PRICE OF GROCERY
SELECT MIN(product.Price) AS MinimumGroceryPrice
FROM Product product
WHERE product.ProductType = 'GROCERY'

UPDATE Product
SET ProductType = 'GROCERY'
WHERE ProductID = 7;

--TASK-5 GET PRODUCTTYPE BY BRANDNAME
SELECT DISTINCT(product.ProductType) AS ProductTypesOfABrand
FROM Product product
WHERE product.BrandName = 'BRITANNIA'

--TASK-6 GET TOTAL BRAND COUNT
SELECT DISTINCT(product.BrandName) AS TotalUniqueBrandsInProductList
FROM Product product

--TASK-7 GET MAXIMUM PRICE BY BRAND
SELECT MAX(product.Price) AS MaximumPriceOfABrand
FROM Product product
WHERE product.BrandName = 'BRITANNIA'

SELECT * FROM Product;

UPDATE Product
SET BrandName = 'SAMSUNG'
WHERE ProductID = 3;

SELECT MAX(product.Price) AS MaximumPriceOfABrand
FROM Product product
WHERE product.BrandName = 'SAMSUNG';

SELECT product.BrandName, MAX(product.Price) AS MaximumPriceByBrand
FROM Product product
GROUP BY product.BrandName
ORDER BY MaximumPriceByBrand DESC;

--TASK-8 FIND LAST RECORD OF ELECTRONIS PRODUCTTYPE
SELECT TOP(1) *
FROM Product product
WHERE product.ProductType = 'ELECTRONICS'
ORDER BY product.ProductID DESC;

SELECT TOP(1) *
FROM Product product
WHERE product.ProductType = 'GROCERY'
ORDER BY product.ProductID DESC;

SELECT TOP(1) *
FROM Product product
WHERE product.ProductType = 'MEDICAL'
ORDER BY product.ProductID DESC;


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

