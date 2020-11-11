------1-------

SELECT x.LastName,y.ShipDate,w.ProductName,w.Description,
z.ItemPrice,z.DiscountAmount,z.Quantity
FROM MyGuitarShop.dbo.Customers as x JOIN MyGuitarShop.dbo.Orders as y
ON x.CustomerID=y.CustomerID JOIN MyGuitarShop.dbo.OrderItems as z
ON y.OrderID=z.OrderID JOIN MyGuitarShop.dbo.Products as w
ON z.ProductID=w.ProductID
ORDER BY x.LastName,y.ShipDate DESC,w.ProductName DESC;

-----2---------

SELECT x.CategoryName,
FROM MyGuitarShop.dbo.Categories as x LEFT JOIN MyGuitarShop.dbo.Products as y
ON x.CategoryID=y.CategoryID
where y.ProductID IS NULL;

--------3-------

SELECT x.EmailAddress,SUM(z.ItemPrice*z.Quantity) AS ItemPriceSUM,
AVG(z.DiscountAmount*z.Quantity) AS DiscountAmountAverage
FROM MyGuitarShop.dbo.Customers as x JOIN MyGuitarShop.dbo.Orders as y
ON x.CustomerID=y.CustomerID JOIN MyGuitarShop.dbo.OrderItems as z
ON y.OrderID=z.OrderID
GROUP BY x.EmailAddress
ORDER BY ItemPriceSum DESC;

--4----------------

SELECT x.EmailAddress,COUNT(y.OrderID) AS NumberOfOrders,
SUM((z.ItemPrice-z.DiscountAmount)*z.Quantity) AS TotalAmount
FROM MyGuitarShop.dbo.Customers as x JOIN MyGuitarShop.dbo.Orders as y
ON x.CustomerID=y.CustomerID JOIN MyGuitarShop.dbo.OrderItems as z
ON y.OrderID=z.OrderID
WHERE ItemPrice>500
GROUP BY x.EmailAddress
ORDER BY x.EmailAddress DESC;

--------5------------


SELECT x.EmailAddress,y.OrderID,
SUM((z.ItemPrice-z.DiscountAmount)*z.Quantity) AS OrderTotalAmount
FROM MyGuitarShop.dbo.Customers as x JOIN MyGuitarShop.dbo.Orders as y
ON x.CustomerID=y.CustomerID JOIN MyGuitarShop.dbo.OrderItems as z
ON y.OrderID=z.OrderID
GROUP BY x.EmailAddress,y.OrderID;

SELECT EmailAddress,MAX(OrderTotal) as LargestOrder
FROM (SELECT x.EmailAddress,y.OrderID,
SUM((z.ItemPrice-z.DiscountAmount)*z.Quantity) AS OrderTotal
FROM MyGuitarShop.dbo.Customers as x JOIN MyGuitarShop.dbo.Orders as y
ON x.CustomerID=y.CustomerID JOIN MyGuitarShop.dbo.OrderItems as z
ON y.OrderID=z.OrderID
GROUP BY x.EmailAddress,y.OrderID) as a
GROUP BY a.EmailAddress;

-------6----------


SELECT x.EmailAddress,y.OrderID,y.OrderDate
FROM MyGuitarShop.dbo.Customers as x JOIN MyGuitarShop.dbo.Orders as y
ON x.CustomerID=y.CustomerID
WHERE y.OrderDate IN (SELECT MAX(OrderDate) FROM MyGuitarShop.dbo.Orders as z 
WHERE x.CustomerID = z.CustomerID);


--------7-------

SELECT ListPrice,
CAST(ListPrice AS DECIMAL(8,2)),
CAST(ListPrice AS INT)
CONVERT(INT,ListPrice),
FROM MyGuitarShop.dbo.Products;

----------------8---------

SELECT CardNumber,LEN(CardNumber) AS CardNumberLength,
RIGHT(CardNumber,6) AS Last6Digits,
('XXXX-XXXX-XX'+RIGHT(CardNumber,6)) AS PrintedFormat
FROM MyGuitarShop.dbo.Orders;

---------9-------------

SELECT OrderID,OrderDate,
dateadd(month, 1, OrderDate) as ApproxShipDate, ShipDate, 
datediff(day,OrderDate,ShipDate) as DaysToShip  
FROM MyGuitarShop.dbo.Orders
where year(OrderDate) = 2016 and month(OrderDate) = 4;

-----------10------------

INSERT INTO MyGuitarShop.dbo.Customers
(EmailAddress,Password,FirstName,LastName)
VALUES ('kriegerrobert@gmail.com','','Krieger','Robert');


SELECT * FROM MyGuitarShop.dbo.Customers
WHERE EmailAddress='kriegerrobert@gmail.com';

--------------11--------------

SELECT * FROM MyGuitarShop.dbo.Customers WHERE EmailAddress = 'kriegerrobert@gmail.com' 

UPDATE MyGuitarShop.dbo.Customers SET Password = 'secret@1234' 
WHERE EmailAddress = 'kriegerrobert@gmail.com'

SELECT * FROM MyGuitarShop.dbo.Customers WHERE EmailAddress = 'kriegerrobert@gmail.com';

















































































