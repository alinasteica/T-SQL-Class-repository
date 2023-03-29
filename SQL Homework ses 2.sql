--1.Retrieve the top 10 most expensive products in the'Product' table

SELECT TOP 10
ProductID, Name, ListPrice
FROM [AdventureWorks2012].[Production].[Product]
ORDER BY ListPrice desc

--2.Find the total number of products for each product subcategory

SELECT ProductSubcategoryID, count(*) TotNmbOfProducts
FROM [AdventureWorks2012].[Production].[Product] 
GROUP BY ProductSubcategoryID
ORDER BY ProductSubcategoryID

--3.List all products that have a standard cost between $100 si $500

SELECT 
ProductID, Name, StandardCost
FROM [AdventureWorks2012].[Production].[Product] 
WHERE StandardCost BETWEEN 100 AND 500
ORDER BY StandardCost

--4.Retrieve the top 5 product subcategories with the highest average list price

SELECT 
TOP 5
ProductSubcategoryID, AVG(ListPrice) AVGListPrice
FROM [AdventureWorks2012].[Production].[Product] 
GROUP BY ProductSubcategoryID
ORDER BY AVGListPrice desc


--5.Find the total number of discontinued products

SELECT 
COUNT(*) NmbOfDiscountinuedProducts
FROM [AdventureWorks2012].[Production].[Product] 
WHERE DiscontinuedDate IS NOT NULL