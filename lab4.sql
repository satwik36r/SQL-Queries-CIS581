Use AP; SELECT INTO InvoiceCopy From Invoices; SELECT INTO VendorCopy FROM Vendors;


Select * from AP.dbo.InvoiceCopy;
INSERT INTO AP.dbo.InvoiceCopy (VendorID, InvoiceTotal, TermsID, InvoiceNumber, PaymentTotal, InvoiceDueDate, InvoiceDate, CreditTotal) VALUES ('2','$401.40','3','CM-007-700','$2.99','09/01/15','08/24/15','$5.99')


USE AP; SELECT * FROM VendorCopy where DefaultAccountNo = 572;
USE AP; UPDATE VendorCopy SET DefaultAccountNo= 542 WHERE DefaultAccountNo = 572;
USE AP; Select *VendorCopy wherer DefaultAccountNo = 542;

USE AP; SELECT VendorCopy.VendorID, VendorCopy.DefaultTermsID, InvoiceCopy.TermsID FROM VendorCopy JOIN InvoiceCopy ON VendorCopy.VendorID = InvoiceCopy.VendorID and VendorCopy.DefaultTermsID = '2'

USE AP; UPDATE InvoiceCopy SET TermsID = 5 WHERE VendorID IN (SELECT VendorID FROM VendorCopy WHERE DefaultTermsID = 2);

USE AP; SELECT VendorCopy.VendorID, VendorCopy.DefaultTermsID, InvoiceCopy.TermsID FROM VendorCopy JOIN InvoiceCopy ON VendorCopy.VendorID = InvoiceCopy.VendorID and VendorCopy.DefaultTermsID = '2'

USE AP; SELECT VendorID,VendorName,VendorState FROM VendorCopy
WHERE VendorState='NY';
USE AP; DELETE VendorCopy WHERE VendorState='NY';
USE AP; SELECT VendorID,VendorName,VendorState FROM VendorCopy
WHERE VendorState='NY';


USE AP; SELECT VendorCity FROM VendorCopy WHERE VendorCity NOT IN (SELECT DISTINCT VendorCity From VendorCopy JOIN InvoiceCopy ON VendorCopy.VendorID = InvoiceCopy.VendorID); SELECT COUNT (*) FROM VendorCopy;

--------------DELETING UNIQUE CITIES-------DELETE VendorCopy WHERE VEndorCity NOt IN (SELECT DISTINCT VendorCity FROM VendorCopy JOIN InvoiceCopy ON VendorCopy.VendorID = InvoiceCopy.VendorID);

-------------After Deletion-------USE AP; SELECT VendorCity FROM VendorCopy WHERE VendorCity NOT IN (SELECT DISTINCT VendorCity From VendorCopy JOIN InvoiceCopy ON VendorCopy.VendorID = InvoiceCopy.VendorID); SELECT COUNT(*) FROM VendorCopy;

USE AP; SELECT CAST (InvoiceTotal AS DECIMAL(17,4)) AS FIRST_COLUMN, CAST (InvoiceTotal AS VARCHAR) AS SECOND_COLUMN, CONVERT(DECIMAL (17,4),InvoiceTotal) AS THIRD_COLUMN, CONVERT (VARCHAR, InvoiceTotal,2) AS FOURTH_COLUMN FROM Invoices;

USE AP; SELECT CAST(InvoiceDate AS VARCHAR) AS FIRST_COLUMN, CONVERT(VARCHAR,InvoiceDate,2) AS SECOND_COLUMN, CONVERT(VARCHAR,InvoiceDate,10) AS THIRD_COLUMN, CAST(InvoiceDate AS REAL) AS FOURTH_COLUMN FROM Invoices;