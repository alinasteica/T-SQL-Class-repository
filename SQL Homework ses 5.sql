Homework: 20 practical examples of using functions 
(Resources: https://learn.microsoft.com/en-us/sql/t-sql/functions/functions?view=sql-server-ver16)



--1. Using the AVG function to calculate the average value of a column:
use adventureworks2012;
SELECT 
AVG(BONUS) AS 'Average Bonus'
FROM Sales.SalesPerson  

--2. Using the GETDATE function to return the current date and time
SELECT 
GETDATE();

--3. Using the DATEDIFF function to return the difference, in days, between OrderDate and ShipDate for a specific PurchaseOrderID
SELECT
DATEDIFF(DAY, OrderDate,ShipDate) 
FROM PURCHASING.PurchaseOrderHeader
WHERE PurchaseOrderID=4

--4. Using the DATENAME function with MONTH as DATEPART, to return the MONTH of the orders, by PurchaseOrderID

SELECT PurchaseOrderID, DATENAME(MONTH, OrderDate) AS OrderMonth
FROM PURCHASING.PurchaseOrderHeader

--5. Using the SYSDATETIME function, to return the system date and time

SELECT SYSDATETIME();  

--6. Using the CONCAT function, to return the full name for the persons

SELECT 
CONCAT(FirstName,' ', MiddleName,' ', LastName) AS FullName 
FROM Person.Person
where BusinessEntityID=2;

--7. Using the ROUND function, to return the price with only 2 decimals
SELECT 
ROUND(UnitPrice,2)
FROM PURCHASING.PurchaseOrderDetail

--8. Using the CHARINDEX function, to return the position of a specified character

SELECT Name, CHARINDEX('U', Name) AS UPosition FROM PURCHASING.ShipMethod

--9. Using the LEN function, to return the lenght of a column in a table

SELECT LEN(Name) AS CatalogDescription FROM Production.ProductModel;

--10. Using the STUFF function, to hide some characters in a column
SELECT 
	concat (b.FirstName, ' ', b.LastName) FullName,
	stuff(a.NationalIDNumber,1,3,'***') HidedNationalIdNumber
FROM HumanResources.Employee a
join Person.Person b
on a.BusinessEntityID=b.BusinessEntityID

--11.Using DATEADD to add 30 day to the start date of a special offer

SELECT 
	SpecialOfferID,
	Description,
	DATEADD(DAY, 30, StartDate) as OfferExpirationDate
FROM Sales.SpecialOffer;

--12. Using AVG to return the average amount of an order
SELECT AVG (LineTotal) AvgAmtOfAnOrder
FROM Purchasing.PurchaseOrderDetail

--13. Using MAX to return the maximimum tax rate

SELECT MAX(TaxRate)
FROM SALES.SalesTaxRate

--14. 
SELECT 
Name, TaxType, IF(TaxRate<7, "LowTaxRate", "HighTaxRate")
FROM SALES.SalesTaxRate


SELECT 
Name, TaxType, IF(TaxRate<7, "LowTaxRate", "HighTaxRate")
FROM SALES.SalesTaxRate

