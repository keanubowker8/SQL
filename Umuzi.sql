DROP DATABASE Umuzi;



CREATE DATABASE Umuzi;

USE Umuzi;

CREATE TABLE Customers (
  CustomerID int(11) NOT NULL AUTO_INCREMENT,
  FirstName varchar(50) DEFAULT NULL,
  LastName varchar(50) DEFAULT NULL,
  Gender varchar(45) DEFAULT NULL,
  Address varchar(200) DEFAULT NULL,
  Phone bigint(20) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  City varchar(20) DEFAULT NULL,
  Country varchar(50) DEFAULT NULL,
  PRIMARY KEY (CustomerID)
);

INSERT INTO Customers VALUES (1,'Lerato','Mabitso','Male','284 chaucer st',84789657,'john@gmail.com','Johannesburg','South Africa'),
(3,'Leon','Glen','Male','81 Everton Rd,Gillits',820832830,'Leon@gmail.com','Durban','South Africa'),
(4,'Charl','Muller','Male','290A Dorset Ecke',44856872553,'Charl.muller@yahoo.com','Berlin','Germany'),
(5,'Julia','Stein','Female','2 Wernerring',448672445058,'Js234@yahoo.com','Frankfurt','Germany');


CREATE TABLE Employees (
  EmployeeID int(11) NOT NULL AUTO_INCREMENT,
  FirstName varchar(50) DEFAULT NULL,
  LastName varchar(50) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  JobTitle varchar(20) DEFAULT NULL,
  PRIMARY KEY (EmployeeID)
);

INSERT INTO Employees VALUES (1,'Kani','Matthew','mat@gmail.com','Manager'),
(2,'Lesly','Cronje','LesC@gmail.com','Clerk'),
(3,'Gideon','Maduku','m@gmail.com','Accountant');


CREATE TABLE Payments (
  CustomerID int(11) NOT NULL AUTO_INCREMENT,
  PaymentID int(11) DEFAULT NULL,
  PaymentDate datetime DEFAULT NULL,
  Amount decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (CustomerID)
);

INSERT INTO Payments VALUES (1,1,'2018-09-01 00:00:00',150.75),
(4,3,'2018-09-03 00:00:00',700.60),
(5,2,'2018-09-03 00:00:00',150.70);



CREATE TABLE Products (
  ProductID int(11) NOT NULL AUTO_INCREMENT,
  ProductName varchar(100) DEFAULT NULL,
  Description varchar(300) DEFAULT NULL,
  BuyPrice decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (ProductID)
);



INSERT INTO Products VALUES (1,'Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75),
(2,'Classic Car','Turnable front wheels, steering function',550.75),
(3,'Sports car','Turnable front wheels, steering function',700.60);


CREATE TABLE Orders (
  OrderID int(11) NOT NULL AUTO_INCREMENT,
  ProductID int(11) DEFAULT NULL,
  PaymentID int(11) DEFAULT NULL,
  FulfilledByEmployeeID int(11) DEFAULT NULL,
  DateRequired datetime DEFAULT NULL,
  DateShipped datetime DEFAULT NULL,
  Status varchar(20) DEFAULT NULL,
  PRIMARY KEY (OrderID),
  KEY ProductID (ProductID),
  KEY FulfilledByEmployeeID (FulfilledByEmployeeID),
  CONSTRAINT Orders_ibfk_1 FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
  CONSTRAINT Orders_ibfk_2 FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
  CONSTRAINT Orders_ibfk_3 FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
  CONSTRAINT Orders_ibfk_4 FOREIGN KEY (FulfilledByEmployeeID) REFERENCES Employees (EmployeeID)
);

INSERT INTO Orders VALUES (1,1,1,2,'2018-09-05 00:00:00',NULL,'Not shipped'),
(2,1,2,2,'2018-09-04 00:00:00','2018-09-03 00:00:00','Shipped'),
(3,3,3,3,'2018-09-06 00:00:00',NULL,'Not shipped');

SELECT * FROM Customers;

SELECT FirstName FROM Customers;

SELECT * FROM Customers WHERE CustomerID IN (1);

UPDATE Customers
SET FirstName = 'Lerato', LastName= 'Mabitso'
WHERE CustomerID = 1;

DELETE FROM Customers WHERE CustomerID IN(2);

SELECT COUNT(DISTINCT Status) FROM Orders;

SELECT MAX(Amount) FROM Payments;

SELECT * FROM Customers ORDER BY Country;

SELECT *
FROM Products
WHERE BuyPrice BETWEEN 100 AND 900;

SELECT * FROM Customers WHERE  Country ='Germany' AND City ='Berlin';

SELECT * FROM Customers WHERE  City ='Cape Town' OR City ='Durban';

SELECT *
FROM Products
WHERE BuyPrice > 500;


SELECT
    SUM(Amount)
FROM
    Payments;
    

SELECT COUNT(Status) FROM Orders WHERE Status IN ('Shipped');


SELECT 
    AVG(BuyPrice) AS Price_Rands,AVG(BuyPrice)*12 AS Price_Dollars 
FROM 
    Products;
    
SELECT *
FROM Payments
INNER JOIN Customers
ON Payments.CustomerID = Customers.CustomerID;


SELECT * FROM Products WHERE Description LIKE '%Turnable front wheels%';

