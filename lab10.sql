IF EXISTS (SELECT * FROM sys.triggers
        WHERE object_id = OBJECT_ID('Invoices_UPDATE_Shipping'))
DROP TRIGGER [dbo].[Invoices_UPDATE_Shipping];
GO
BEGIN TRAN;
UPDATE Invoices
SET Vendor9ID = 123
WHERE VendorID = 122;
DELETE Vendors
WHERE VendorID = 122;
UPDATE Vendors
SET VendorName = 'FedEp'
WHERE VendorID = 123;
COMMIT TRAN;


SELECT * FROM Vendors WHERE VendorID=122;

SELECT * FROM Vendors WHERE VendorID=123;


---------------2----------------


BEGIN TRAN;
INSERT InvoiceArchive
SELECT x.*
FROM Invoices as x LEFT JOIN InvoiceArchive as y
ON x.InvoiceID = y.InvoiceID
WHERE (x.InvoiceTotal-x.CreditTotal-x.PaymentTotal)=0
AND y.InvoiceID IS NULL

DELETE Invoices
WHERE InvoiceID IN (SELECT InvoiceID
			FROM InvoiceArchive);
COMMIT TRAN;


SELECT * FROM Invoices

SELECT * FROM InvoiceArchive;

SELECT * FROM Invoices JOIN InvoiceArchive 
ON Invoices.InvoiceID = InvoiceArchive.InvoiceID;
