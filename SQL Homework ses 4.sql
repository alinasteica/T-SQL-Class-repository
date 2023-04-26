-- Homework:

-- Problem 1: List all products and their suppliers.
-- Partial result
--ProductID  ProductName              SupplierName
--1          Adjustable Race          Litware, Inc.
--879        All-Purpose Bike Stand   Green Lake Bike Company
--712        AWC Logo Cap             Integrated Sport Products
--2          Bearing Ball          Wood Fitness
--877        Bike Wash - Dissolver    Green Lake Bike Company


select 
a.ProductID, a.Name as ProductName, c.Name as SupplierName
from 
Production.Product a
join Purchasing.ProductVendor b
on a.ProductID=b.ProductID
join Purchasing.Vendor c
on b.businessentityID=c.BusinessEntityID

-- Problem 2: List all orders placed by a specific customer (e.g., CustomerID = 29825) along with the order details.
-- Partial result
--SalesOrderID    OrderDate    ProductID    ProductName    OrderQty    UnitPrice    LineTotal
--43659    2011-05-31 00:00:00.000    776    Mountain-100 Black, 42    1    2024.994    2024.994000
--43659    2011-05-31 00:00:00.000    777    Mountain-100 Black, 44    3    2024.994    6074.982000
--43659    2011-05-31 00:00:00.000    778    Mountain-100 Black, 48    1    2024.994    2024.994000
--43659    2011-05-31 00:00:00.000    771    Mountain-100 Silver, 38    1    2039.994    2039.994000
--43659    2011-05-31 00:00:00.000    772    Mountain-100 Silver, 42    1    2039.994    2039.994000

select
	b.SalesOrderID,
	a.OrderDate,
	b.ProductID,
	c.Name as ProductName,
	b.OrderQty,
	b.UnitPrice,
	b.LineTotal
from
Sales.SalesOrderHeader a
join  Sales.SalesOrderDetail b
on a.SalesOrderID=b.SalesOrderID
join Production.Product c
on b.ProductID=c.ProductID
where a.CustomerID='29825'

-- Problem 3: List all customers and their respective sales territories.
-- Partial result
--CustomerID    FirstName    LastName    TerritoryName
--29485    Catherine    Abel    Southwest
--29486    Kim    Abercrombie    Central
--29487    Humberto    Acevedo    Northeast
--29484    Gustavo    Achong    Southeast
--29488    Pilar    Ackerman    Australia

select
	a.CustomerID,
	b.FirstName,
	b.LastName,
	c.Name as TerritoryName
from 
sales.Customer a
join Person.Person b
on a.PersonID=b.BusinessEntityID
join Sales.SalesTerritory c
on a.TerritoryID=c.TerritoryID



-- Problem 4: List all products with their subcategories and categories.
-- Partial results
-- ProductID    ProductName    SubcategoryName    CategoryName
-- 680    HL Road Frame - Black, 58    Road Frames    Components
-- 706    HL Road Frame - Red, 58    Road Frames    Components
-- 707    Sport-100 Helmet, Red    Helmets    Accessories
-- 708    Sport-100 Helmet, Black    Helmets    Accessories
-- 709    Mountain Bike Socks, M    Socks    Clothing

select
	a.ProductID,
	a.Name as ProductName,
	b.Name as SubcategoryName,
	c.Name as CategoryName
from
Production.Product a
join Production.ProductSubcategory b
on a.ProductSubcategoryID=b.ProductSubcategoryID
join Production.ProductCategory c
on b.ProductCategoryID=c.ProductCategoryID


-- Problem 5: List all vendors and their respective purchase order approvers.
-- Partial result
-- BusinessEntityID    VendorName    FirstName    LastName    EmailAddress
-- 1492    Australia Bike Retailer    Annette    Hill    annette0@adventure-works.com
-- 1492    Australia Bike Retailer    Arvind    Rao    arvind0@adventure-works.com
-- 1492    Australia Bike Retailer    Ben    Miller    ben0@adventure-works.com
-- 1492    Australia Bike Retailer    Eric    Kurjan    eric2@adventure-works.com
-- 1492    Australia Bike Retailer    Erin    Hagens    erin0@adventure-works.com

select
	a.BusinessEntityID,
	a.Name as VendorName,
	c.FirstName,
	c.LastName,
	d.EmailAddress
from Purchasing.Vendor a
join Purchasing.PurchaseOrderHeader b
on a.BusinessEntityID=b.VendorID
join person.Person c
on b.EmployeeID=c.BusinessEntityID
join Person.EmailAddress d
on d.BusinessEntityID=c.BusinessEntityID


