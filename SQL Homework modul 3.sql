--Exercise 1 You have to create a report based on the tables Production.Product and Production.ProductCategory. 
--The report should contain the product name and the category name of each product. 


select p.Name as ProductName, c.name as CategoryName
from Production.Product p
join Production.ProductSubCategory s
on p.ProductSubcategoryID=s.ProductSubcategoryID
join Production.ProductCategory c
on c.ProductCategoryID=s.ProductCategoryID


--Exercise 2 Write a query that returns all customers who placed at least one order, with detailed information about each one. 
--The tables are Sales.Customers, Sales.SalesOrderHeader and Sales.OrderDetails.

select c.CustomerID, o.SalesOrderID, d.SalesOrderDetailID,
*
from Sales.SalesOrderHeader o
join Sales.Customer c
on c.CustomerID=o.CustomerID
join Sales.SalesOrderDetail d
on o.SalesOrderID=d.SalesOrderID


--Exercise 3 You have to create a report based on the tables Production.ProductSubcategory and Production.ProductCategory. 
--The report should return every combination between the category name and the subcategory name.

select  cat.name as CategoryName, sub.name SubcategoryName
from  Production.ProductCategory cat
cross join Production.ProductSubcategory sub