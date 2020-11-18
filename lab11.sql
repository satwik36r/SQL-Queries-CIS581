---------1------
------JUST CHECK THIS ONCE I HAVE DOUBT--------

USE AP;
CREATE ROLE PaymentEntry;

GRANT UPDATE 
ON AP.dbo.Invoices
TO PaymentEntry;

GRANT UPDATE 
ON AP.dbo.Vendors
TO PaymentEntry;


GRANT UPDATE,INSERT 
ON AP.dbo.InvoiceLineItems 
TO PaymentEntry;
 
-----OR ------------


USE AP;
CREATE ROLE PaymentEntry;

GRANT UPDATE 
ON AP.dbo.Invoices, AP.dbo.Invoices
TO PaymentEntry;


GRANT UPDATE,INSERT 
ON AP.dbo.InvoiceLineItems 
TO PaymentEntry;

------------------
---------2--------

USE AP;
CREATE LOGIN Fall2020 WITH PASSWORD = '123456',
DEFAULT_DATABASE = AP;

CREATE USER Robert FOR LOGIN Fall2020;

ALTER ROLE PaymentEntry ADD MEMBER Robert;

-----------3------
------HAS TO BE DONE USING MANAGEMENT STUDIO---------
---------------

-------------4---------

USE AP;
GO 
CREATE SCHEMA SatwikHosamani;

GO 
ALTER SCHEMA SatwikHosamani TRANSFER dbo.ContactUpdates;

ALTER USER Robert WITH DEFAULT_SCHEMA = SatwikHosamani;

GRANT SELECT, UPDATE, INSERT, DELETE, EXECUTE
ON SCHEMA :: SatwikHosamani TO Robert;

