--1 
CREATE VIEW OrderItemProductsDetails AS 
SELECT x.OrderID, x.OrderDate, x.TaxAmount, x.ShipDate, y.ItemPrice, y.DiscountAmount, 
(y.ItemPrice-y.DiscountAmount) AS FinalPrice, y.Quantity, 
((y.ItemPrice-y.DiscountAmount) * y.Quantity) AS ItemTotal, z.ProductName, z.Description
FROM MyGuitarShop.dbo.Orders x JOIN MyGuitarShop.dbo.OrderItems y 
ON x.OrderID = y.OrderID JOIN MyGuitarShop.dbo.Products z 
ON y.ProductID = z.ProductID;





--2
SELECT * FROM Top5BestSelling;

CREATE VIEW Top5BestSelling AS 
SELECT TOP 5 ProductName, COUNT(Quantity) OrderCount, 
SUM(Quantity*ItemPrice) AS OrderTotal 
FROM OrderitemProducts 
GROUP BY ProductName 
ORDER BY OrderCount DESC;

--3
CREATE PROCEDURE spUpdateProductDiscount 
( 
@ProductID int, 
@DiscountPercent int 
) 
AS 
BEGIN

BEGIN TRY 
BEGIN TRANSACTION; 
UPDATE Products set DiscountPercent = @DiscountPercent where ProductID = @ProductID; 
COMMIT TRANSACTION;
END TRY

BEGIN CATCH
IF @DiscountPercent < 0 
ROLLBACK TRANSACTION;
PRINT 'DiscountPercent must be positive'; 
END CATCH 
END
GO


--4
DECLARE @a INT; 
DECLARE @b INT; 
DECLARE @count INT; 
DECLARE @answer varchar(100);

SET @a = 15; 
SET @b = 30; 
SET @count = 1; 
SET @answer = 'Common Factors of 15 and 30' + CHAR(13);

WHILE(@count < @a) 
BEGIN 
	IF(@a % @count = 0 AND @a % @count = 0) 
		SET @answer = CONCAT (@answer,@count, CHAR(13), CHAR(10)); 
		SET @count+=1; 
END 
	SELECT @answer;

--5


USE MyGuitarShop;
GO
CREATE FUNCTION fnDiscountPrice (@ItemID INT) 
RETURNS INT 
BEGIN 
RETURN (SELECT (ItemPrice - DiscountAmount) AS Discount_Price 
		FROM MyGuitarShop.dbo.OrderItems 
		WHERE ItemID = @ItemID);
END;
GO
PRINT 'Discount price: $' + CONVERT(varchar, dbo.fnDiscountPrice(3),1);


USE MyGuitarShop;
GO 
CREATE FUNCTION ItemTotal(@ItemID INT) 
RETURNS MONEY 
BEGIN
RETURN ( SELECT SUM(dbo.fnDiscountPrice(ItemID) * Quantity) 
		 FROM OrderItems 
		 WHERE ItemID = @ItemID); 
END; 
GO 
PRINT 'Total Amount is $' + Convert (Varchar, dbo.ItemTotal(6));

































