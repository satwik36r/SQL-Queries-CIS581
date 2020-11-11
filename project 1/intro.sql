SELECT (LastName+', '+EmailAddress) AS FullName
FROM MyGuitarShop.dbo.Customers
WHERE LastName LIKE 'A%'OR LastName LIKE 'B%'OR LastName LIKE 'C%'OR LastName LIKE 'D%'OR LastName LIKE 'E%'OR LastName LIKE 'F%'OR LastName LIKE 'G%'OR LastName LIKE 'H%' 
ORDER BY LastName DESC;


SELECT OrderID, OrderDate,ShipDate
FROM MyGuitarShop.dbo.Orders
WHERE OrderDate IS NOT NULL;
