Use ProductOrders;
Select Top 5 Artist,sum(unitPrice) As TotalEarnings
FROM Items
Group By Artist
Order By TotalEarnings ASC;


USE AP;
SELECT Vendors.VendorName, count(InvoiceID) as InvoiceCount, AVG(InvoiceTotal) as
InvoiceAverage
from Invoices Join Vendors
On Invoices.VendorID = Vendors.VendorID
Group BY VendorName
Order By InvoiceCount DESC;


Use AP;
Select GLAccounts.AccountDescription , count(InvoiceID) as LineItemCount,sum(InvoiceLineItemAmount) as
LineItemSum
From InvoiceLineItems Join GLAccounts
On InvoiceLineItems.AccountNo=GLAccounts.AccountNO
Group by AccountDescription
Having Count(InvoiceID) >2
Order by LineItemCount DESC;



SELECT AccountNo, sum(InvoiceLineitemAmount) AS LineitemSum
FROM InvoiceLineItems
Group BY AccountNo WITH ROLLUP;




Use Ap;
SELECT VendorName,
COUNT(DISTINCT InvoiceLineItems.AccountNo) AS NumberOfAccounts
FROM Vendors JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID
JOIN InvoiceLineItems
ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
GROUP BY VendorName
HAVING COUNT(DISTINCT InvoiceLineItems.AccountNo) > 2
ORDER BY VendorName;



SELECT Distinct InvoiceLineItems.AccountNo
FROM InvoiceLineItems JOIN GLAccounts
ON InvoiceLineItems.AccountNo=GLAccounts.AccountNo
AND InvoiceLineItemAmount > (SELECT AVG(InvoiceLineItemAmount) FROM InvoiceLineItems
WHERE InvoiceLineItemAmount <> 0)
GROUP BY InvoiceLineItems.AccountNo;



USE AP;
SELECT SUM(InvoiceMIN) AS SumOfMINimums
FROM (SELECT VendorID, MIN(InvoiceTotal) AS InvoiceMIN
FROM Invoices
WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
GROUP BY VendorID) AS MINInvoice;



USE AP;
SELECT VendorID,VendorCity, VendorState, VendorZipCode
FROM Vendors
WHERE VendorCity + VendorZipCode NOT IN
(SELECT VendorCity + VendorZipCode
FROM Vendors
Group BY VendorCity + VendorZipCode
HAVING COUNT(*) > 1 ) ORDER BY VendorCity DESC, VendorState ASC;
