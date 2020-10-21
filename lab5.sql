SELECT VendorContactLName + ' ' + LEFT(VendorContactFName, 2) + '.' AS Contact,
SUBSTRING (VendorPhone,7,8) AS Phone
FROM Vendors
where LEFT(VendorPhone,4) = '(209'
ORDER BY Contact;
-----SATWIK HOSAMANI---------


SELECT InvoiceNumber,
InvoiceTotal-CreditTotal-PaymentTotal AS Balance
FROM Invoices
WHERE InvoiceTotal-CreditTotal-PaymentTotal > 0 AND
InvoiceDueDate < GETDATE() +12;
------SATWIK HOSAMANI-----


SELECT InvoiceNumber,
InvoiceTotal - CreditTotal - PaymentTotal AS Balance
FROM Invoices
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0 AND
InvoiceDueDate <
CAST(CAST(YEAR(GETDATE()) AS char(4)) + '-' +
CAST(MONTH(GETDATE()) + 1 AS char(2)) + '-01' AS datetime) - 1;




USE AP;
SELECT InvoiceNumber, InvoiceTotal - CreditTotal - PaymentTotal AS Balance, 
RANK() OVER (ORDER BY InvoiceTotal - CreditTotal - PaymentTotal ASC) As BalanceRank FROM Invoices 
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0 AND InvoiceDueDate < GETDATE() + 12;
-------SATWIK HOSAMANI-----
