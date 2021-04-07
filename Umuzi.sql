CREATE DATABASE Umuzi;

USE Umuzi;

CREATE TABLE Customers (
  CustomerID SERIAL PRIMARY KEY,
  FirstName varchar(50) DEFAULT NULL,
  LastName varchar(50) DEFAULT NULL,
  Gender varchar(45) DEFAULT NULL,
  Address varchar(200) DEFAULT NULL,
  Phone bigint DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  City varchar(20) DEFAULT NULL,
  Country varchar(50) DEFAULT NULL
);

INSERT INTO Customers VALUES (1,'Lerato','Mabitso','Male','284 chaucer st',84789657,'john@gmail.com','Johannesburg','South Africa'),
(2, 'Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa'),
(3,'Leon','Glen','Male','81 Everton Rd,Gillits',820832830,'Leon@gmail.com','Durban','South Africa'),
(4,'Charl','Muller','Male','290A Dorset Ecke',44856872553,'Charl.muller@yahoo.com','Berlin','Germany'),
(5,'Julia','Stein','Female','2 Wernerring',448672445058,'Js234@yahoo.com','Frankfurt','Germany');


CREATE TABLE Employees (
  EmployeeID SERIAL PRIMARY KEY,
  FirstName varchar(50) DEFAULT NULL,
  LastName varchar(50) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  JobTitle varchar(20) DEFAULT NULL
);

INSERT INTO Employees VALUES (1,'Kani','Matthew','mat@gmail.com','Manager'),
(2,'Lesly','Cronje','LesC@gmail.com','Clerk'),
(3,'Gideon','Maduku','m@gmail.com','Accountant');


CREATE TABLE Payments (
  CustomerID int DEFAULT NULL,
  PaymentID SERIAL PRIMARY KEY,
  PaymentDate timestamp DEFAULT NULL,
  Amount numeric(10,2) DEFAULT NULL
);

INSERT INTO Payments VALUES (1,1,'2018-09-01 00:00:00',150.75),
(4,3,'2018-09-03 00:00:00',700.60),
(5,2,'2018-09-03 00:00:00',150.70);


CREATE TABLE Products (
  ProductID SERIAL PRIMARY KEY,
  ProductName varchar(100) DEFAULT NULL,
  Description varchar(300) DEFAULT NULL,
  BuyPrice numeric(10,2) DEFAULT NULL
);



INSERT INTO Products VALUES (1,'Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75),
(2,'Classic Car','Turnable front wheels, steering function',550.75),
(3,'Sports car','Turnable front wheels, steering function',700.60);


CREATE TABLE Orders
(
	OrderID SERIAL PRIMARY KEY,
	ProductID int REFERENCES Products(ProductID),
	PaymentID int REFERENCES Payments(PaymentID),
	FulfilledByEmployeeID int REFERENCES Employees(EmployeeID),
	DateRequired timestamp,
	DateShipped timestamp,
	Status varchar(20)
);

INSERT INTO Orders VALUES (1,1,1,2,'2018-09-05 00:00:00',NULL,'Not shipped'),
(2,1,2,2,'2018-09-04 00:00:00','2018-09-03 00:00:00','Shipped'),
(3,3,3,3,'2018-09-06 00:00:00',NULL,'Not shipped');

SELECT * FROM Customers;

SELECT FirstName, LastName FROM Customers;

SELECT FirstName, LastName FROM Customers WHERE CustomerID = 1;

UPDATE Customers
SET FirstName = 'Lerato', LastName= 'Mabitso'
WHERE CustomerID = 1;

DELETE FROM Customers WHERE CustomerID IN(2);

SELECT COUNT(DISTINCT Status) FROM Orders;

SELECT MAX(Amount) FROM Payments;

SELECT * FROM Customers ORDER BY Country;

SELECT * FROM Products WHERE BuyPrice BETWEEN 100 AND 900;

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