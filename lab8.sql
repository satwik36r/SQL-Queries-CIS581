-------------1----------
CREATE VIEW InvoiceBasic
AS
SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM Vendors JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID;

SELECT *
FROM InvoiceBasic
WHERE VendorName LIKE '[A-C]%'
ORDER BY InvoiceTotal ASC;

----------------2--------


CREATE VIEW Top10PaidInvoices
AS
SELECT TOP 10 VendorName,
 MAX(InvoiceDate) AS LastInvoice,
 SUM(InvoiceTotal) AS SumOfInvoices
FROM Vendors JOIN Invoices
 ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceTotal - CreditTotal - PaymentTotal = 0
GROUP BY VendorName
ORDER BY SUM(InvoiceTotal) DESC;

SELECT *
FROM Top10PaidInvoices;

------------3-----------------

CREATE VIEW VendorAddress
AS
SELECT VendorID, VendorAddress1 + ' ' + ISNULL(VendorAddress2, '') AS
AddressInformation, VendorCity, VendorState, VendorZipCode
FROM Vendors;

SELECT *
FROM VendorAddress;


SELECT *
FROM VendorAddress
WHERE VendorID = 7;

--------------4--------


USE AP;
SELECT *
FROM sys.foreign_keys;


-----------5----------


USE AP;
-- declare name and datatype of the available
DECLARE @TotalInvoiceDue money;
-- set the variable
SELECT @TotalInvoiceDue =
 SUM(InvoiceTotal - CreditTotal - PaymentTotal)
FROM Invoices
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0;
IF @TotalInvoiceDue < 45000
 BEGIN
 PRINT 'Balance due is ' + CAST(@TotalInvoiceDue as NVARCHAR(9)) + '.'
 SELECT VendorName, InvoiceNumber, InvoiceDueDate,
 InvoiceTotal - CreditTotal - PaymentTotal AS Balance
 FROM Invoices JOIN Vendors
 ON Invoices.VendorID = Vendors.VendorID
 WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
 ORDER BY InvoiceDueDate DESC
 END
ELSE
 PRINT 'Balance due is more than $45,000.00.';



 ------------6-----------





 USE AP;
SELECT VendorName,LastInvoiceDate, InvoiceTotal
FROM Invoices JOIN
(SELECT VendorID, MAX(InvoiceDate) AS LastInvoiceDate
FROM Invoices
GROUP BY VendorID) AS LastInvoice
ON (Invoices.VendorID = LastInvoice.VendorID AND
Invoices.InvoiceDate = LastInvoice.LastInvoiceDate)
JOIN Vendors
ON Invoices.VendorID = Vendors.VendorID
ORDER BY VendorName, LastInvoiceDate;



USE AP;
IF OBJECT_ID('tempdb..#LastInvoice') IS NOT NULL
 DROP TABLE #LastInvoice;
SELECT VendorID, MAX(InvoiceDate) AS LastInvoiceDate
INTO #LastInvoice
FROM Invoices
GROUP BY VendorID;
SELECT VendorName, LastInvoiceDate, InvoiceTotal
FROM Invoices JOIN #LastInvoice
 ON (Invoices.VendorID = #LastInvoice.VendorID AND
 Invoices.InvoiceDate = #LastInvoice. LastInvoiceDate)
JOIN Vendors
 ON Invoices.VendorID = Vendors.VendorID
ORDER BY VendorName, LastInvoiceDate;



----------7-------------


USE AP;
IF OBJECT_ID('FirstInvoice_V') IS NOT NULL
 DROP VIEW FirstInvoice_V;
GO
CREATE VIEW FirstInvoice_V
AS
SELECT VendorID, MIN(InvoiceDate) AS FirstInvoiceDate
FROM Invoices
GROUP BY VendorID;


SELECT *
FROM FirstInvoice_V;



SELECT Invoices.VendorID, VendorName, FirstInvoiceDate, InvoiceTotal
FROM Invoices JOIN FirstInvoice_V
ON (Invoices.VendorID = FirstInvoice_V.VendorID AND
Invoices.InvoiceDate = FirstInvoice_V.FirstInvoiceDate)
JOIN Vendors
ON Invoices.VendorID = Vendors.VendorID
ORDER BY VendorName, FirstInvoiceDate;


-----------8-------------


DECLARE @TableName varchar(128);
SELECT @TableName = MIN(name)
FROM sys.tables
WHERE name <> 'dtproperties' AND name <> 'sysdiagrams';
EXEC ('SELECT COUNT(*) AS CountOf' + @TableName +
 ' FROM ' + @TableName + ';');

 

