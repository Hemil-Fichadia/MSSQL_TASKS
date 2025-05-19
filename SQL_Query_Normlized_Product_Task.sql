--Normalized product database tasks

USE PRODUCT_TASK;

--TASK-1 COUNT OF TOTAL PRODUCTS
SELECT COUNT(*) AS TotalProductsInInventory
FROM Product;

--TASK-2 COUNT OF ELECTRONICS PRODUCTS
SELECT * FROM ProductType;

SELECT *
FROM Product product
JOIN ProductType producttype
ON product.ProductTypeID = producttype.ID
WHERE producttype.ProductType = 'ELECTRONICS';

SELECT product.ProductName AS GROCERY_PRODUCTS
FROM Product product
JOIN ProductType producttype
ON product.ProductTypeID = producttype.ID
WHERE producttype.ProductType = 'GROCERY';

SELECT product.ProductName AS BAKERY_PRODUCTS
FROM Product product
JOIN ProductType producttype
ON product.ProductTypeID = producttype.ID
WHERE producttype.ProductType = 'BAKERY';

SELECT product.ProductName AS SANITATION_PRODUCTS
FROM Product product
JOIN ProductType producttype
ON product.ProductTypeID = producttype.ID
WHERE producttype.ProductType = 'SANITATION';

--TASK-3 MAXIMUM DISCOUNTED PRICE
SELECT product.ProductName AS Product_name, brandproductmap.ActualPrice AS Original_Price, branddiscountmap.Discount AS Discount_Percentage
FROM Product product
JOIN BrandProductMapping brandproductmap
ON product.ID = brandproductmap.ProductID
JOIN BrandDiscountMapping branddiscountmap
ON brandproductmap.MappingID = branddiscountmap.BrandProductMappingID;

SELECT product.ProductName AS Product_name, ROUND((brandproductmap.ActualPrice - (brandproductmap.ActualPrice * branddiscountmap.Discount/100)),0) AS DiscountedPrice
FROM Product product
JOIN BrandProductMapping brandproductmap
ON product.ID = brandproductmap.ProductID
JOIN BrandDiscountMapping branddiscountmap
ON brandproductmap.MappingID = branddiscountmap.BrandProductMappingID;


--TASK-4 MINIMUM PRICE OF GROCERY
SELECT product.ProductName AS PRODUCT_NAME, brandproductmap.ActualPrice AS GROCERY_PRICE
FROM Product product
JOIN ProductType producttype
ON product.ProductTypeID = producttype.ID
JOIN BrandProductMapping brandproductmap
ON product.ID = brandproductmap.MappingID
WHERE producttype.ProductType = 'GROCERY';

SELECT MIN(brandproductmap.ActualPrice) AS MINIMUM_GROCERY_PRICE
FROM Product product
JOIN ProductType producttype
ON product.ProductTypeID = producttype.ID
JOIN BrandProductMapping brandproductmap
ON product.ID = brandproductmap.MappingID
WHERE producttype.ProductType = 'GROCERY';


--TASK-5 GET ALL TYPES OF PRODUCTS SOLD BY A BRAND
SELECT DISTINCT(producttype.ProductType) AS AllTypesOfProductsSoldByABrand
FROM Product product
JOIN BrandProductMapping brandproductmapping
ON product.ID = brandproductmapping.ProductID
JOIN ProductType producttype
ON product.ProductTypeID = producttype.ID
JOIN Brand brand
ON brandproductmapping.BrandID = brand.ID
WHERE brand.BrandName = 'BRITANNIA';

SELECT DISTINCT(producttype.ProductType) AS AllTypesOfProductsSoldByABrand
FROM Product product
JOIN BrandProductMapping brandproductmapping
ON product.ID = brandproductmapping.ProductID
JOIN ProductType producttype
ON product.ProductTypeID = producttype.ID
JOIN Brand brand
ON brandproductmapping.BrandID = brand.ID
WHERE brand.BrandName = 'OnePlus';


--TASK-6 GET TOTAL BRAND COUNT
SELECT COUNT(*) AS TotalNumberOfBrands
FROM Brand brand;

--TASK-7 GET MAXIMUM PRICE BY BRAND
SELECT product.ProductName AS ProductName, brand.BrandName AS BrandName, brandproductmapping.ActualPrice AS PriceOfProductsByABrand
FROM Product product
JOIN BrandProductMapping brandproductmapping
ON product.ID = brandproductmapping.ProductID
JOIN Brand brand
ON brandproductmapping.BrandID = brand.ID
WHERE brand.BrandName = 'BRITANNIA';

SELECT MAX(brandproductmapping.ActualPrice) AS PriceOfProductsByABrand
FROM Product product
JOIN BrandProductMapping brandproductmapping
ON product.ID = brandproductmapping.ProductID
JOIN Brand brand
ON brandproductmapping.BrandID = brand.ID
WHERE brand.BrandName = 'BRITANNIA';

--TASK-8 FIND LAST RECORD OF ELECTRONICS PRODUCTTYPE
SELECT TOP(1) *
FROM Product product
JOIN ProductType producttype
ON product.ProductTypeID = producttype.ID
WHERE producttype.ProductType = 'ELECTRONICS'
ORDER BY product.ID DESC;