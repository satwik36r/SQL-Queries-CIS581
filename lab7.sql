CREATE DATABASE Shopping;

USE Shopping;
CREATE TABLE Customers
(CustomerID int NOT NULL IDENTITY PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Phone varchar(50) NULL);

CREATE TABLE Products
(ProductID int NOT NULL IDENTITY PRIMARY KEY,
ProductName varchar(50) NOT NULL,
ProductCost money NOT NULL DEFAULT 0 CHECK (ProductCost >= 0));

CREATE Table CustomerGroups
(CustomerID int REFERENCES Customers(CustomerID),
ProductID int REFERENCES Products(ProductID));


USE Shopping;
CREATE CLUSTERED INDEX IX_CustomerGroups_ProductID
ON CustomerGroups(ProductID)
CREATE INDEX IX_CustomerGroups_CustomerID
ON CustomerGroups(CustomerID);

USE Shopping;
ALTER TABLE Customers
ADD BillsPaid bit NOT NULL DEFAULT 0;


USE Shopping;
DROP TABLE CustomerGroups;
CREATE Table CustomerGroups
(CustomerID int REFERENCES Customers(CustomerID),
ProductID int REFERENCES Products(ProductID),
UNIQUE(CustomerID, ProductID));

  
