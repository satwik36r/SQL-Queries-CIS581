SELECT InvoiceNumber, InvoiceDate, InvoicDueDate, InvoiceTotal 
FROM Invoices;	

SELECT InvoiceNumber AS Number, InvoiceTotal AS Total, PaymentTotal + CreditTotal AS Credits
          FROM Invoices
          WHERE InvoiceTotal <= 300


SELECT VendorContactLName + ',' + VendorContactFName AS [Full Name]
FROM Vendors
ORDER BY VendorContactLName DESC;


SELECT *FROM Invoices
WHERE ((InvoiceTotal - PaymentTotal + CreditTotal <= 0) AND PaymentDate IS NOT NULL)
     		OR
      		 ((InvoiceTotal - PaymentTotal + CreditTotal > 0) AND PaymentDate IS  NULL)


SELECT VendorName, VendorCity, VendorZipCode, DefaultAccountNo, AccountDescription
FROM Vendors LEFT JOIN GLAccounts
             ON Vendors.DefaultAccountNo = GLAccounts.AccountNo
WHERE AccountDescription = 'Other Equipment'
ORDER BY VendorCity DESC;


SELECT DISTINCT c1.FirstName, c1.FirstName + ',' + c1.LastName AS 'Full Name'
FROM ContactUpdates AS c1 JOIN ContactUpdates AS c2
ON (c1.VendorID <> c2.VendorID) AND (c1.LastName = c2.LastName)
ORDER BY c1.FirstName ASC;


SELECT VendorName, VendorState
	FROM Vendors
	WHERE VendorState = 'CA'
	UNION
	SELECT VendorName, 'Not in CA'
	FROM Vendors
	WHERE VendorState <> 'CA'
	ORDER BY VendorName ASC;


SELECT OrderDetails.ItemID
  FROM Orders LEFT JOIN OrderDetails
               ON OrderDetails.OrderID = Orders.OrderID
  WHERE Orders.ShippedDate IS NULL;


