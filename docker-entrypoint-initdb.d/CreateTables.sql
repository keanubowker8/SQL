-- Database: shop

--DROP DATABASE shop;

CREATE DATABASE shop
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_South Africa.1252'
    LC_CTYPE = 'English_South Africa.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE Customers
(
	CustomerID SERIAL PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Gender VARCHAR(6),
	Address VARCHAR(200),
	Phone VARCHAR(15),
	Email VARCHAR(100),
	City VARCHAR(20),
	Country VARCHAR(50)
);

CREATE TABLE Employees
(
	EmployeesID SERIAL PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Email VARCHAR(100),
	JobTitle VARCHAR(20)
);


CREATE TABLE Orders
(
	OrderID SERIAL PRIMARY KEY,
	ProductID SMALLINT,
	PaymentID SMALLINT,
	FulfilledByEmployeeID SMALLINT,
	DateRequired TIMESTAMP,
	DateShipped TIMESTAMP,
	Status VARCHAR(20)
);


CREATE TABLE Payments
(
	CustomerID SMALLINT,
	PaymentID SERIAL PRIMARY KEY,
	PaymentDate TIMESTAMP,
	Amount numeric(9,2)
);

CREATE TABLE Products
(
	ProductID SERIAL PRIMARY KEY,
	ProductName VARCHAR(100),
	Description VARCHAR(300),
	BuyPrice numeric(9,2)
);


-- Add foreign key (ProductID) to Orders table from Products table
ALTER TABLE Orders ADD FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

-- Add foreign key (PaymentID) to Orders table from Payments table
ALTER TABLE Orders ADD FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID);

-- Add foreign key (FulfilledByEmployeeID) to Orders table Employees table
ALTER TABLE Orders ADD FOREIGN KEY (FulfilledByEmployeeID) REFERENCES Employees(EmployeesID);

-- Add foreign key (CustomerID) to Payments table from Customers table
ALTER TABLE Payments ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

-- Inserting records into the tables created

-- Inserting records for Customers table
INSERT INTO Customers (FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES ('John', 'Hibert', 'Male', '284 chaucer st', '084789657', 'john@gmail.com', 'Johannesburg', 'South Africa');

INSERT INTO Customers (FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES ('Thando', 'Sithole', 'Female', '240 Sect 1', '0794445584', 'thando@gmail.com', 'Cape Town', 'South Africa');

INSERT INTO Customers (FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES ('Leon', 'Glen', 'Male', '81 Everton Rd,Gillits', '0820832830', 'Leon@gmail.com', 'Durban', 'South Africa');

INSERT INTO Customers (FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES ('Charl', 'Muller', 'Mal', '290A Dorset Ecke', '+44856872553', 'Charl.muller@yahoo.com', 'Berlin', 'Germany');

INSERT INTO Customers (FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES ('Julia', 'Stein', 'Female', '2 Wernerring', '+448672445058', 'Js234@yahoo.com', 'Frankfurt', 'Germany');

-- Inserting records for Employees table
INSERT INTO Employees (FirstName, LastName, Email, JobTitle)
VALUES ('Kani', 'Matthew', 'mat@gmail.com', 'Manager');

INSERT INTO Employees (FirstName, LastName, Email, JobTitle)
VALUES ('Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk');

INSERT INTO Employees (FirstName, LastName, Email, JobTitle)
VALUES ('Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

-- Inserting records for Payments table
INSERT INTO Payments (CustomerID, PaymentDate, Amount)
VALUES (1, '2018-09-01', 150.75);

INSERT INTO Payments (CustomerID, PaymentDate, Amount)
VALUES (5, '2018-09-03', 150.75);

INSERT INTO Payments (CustomerID, PaymentDate, Amount)
VALUES (4, '2018-09-03', 700.60);

-- Inserting records for Products table
INSERT INTO Products (ProductName, Description, BuyPrice)
VALUES ('Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75);

INSERT INTO Products (ProductName, Description, BuyPrice)
VALUES ('Classic Car', 'Turnable front wheels, steering function', 550.75);

INSERT INTO Products (ProductName, Description, BuyPrice)
VALUES ('Sports car', 'Turnable front wheels, steering function', 700.60);

-- Inserting records for Orders table
INSERT INTO Orders (ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, DateShipped, Status)
VALUES (1, 1, 2, '2018-09-05', NULL, 'Not shipped');

INSERT INTO Orders (ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, DateShipped, Status)
VALUES (1, 2, 2, '2018-09-04', '2018-09-03', 'Shipped');

INSERT INTO Orders (ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, DateShipped, Status)
VALUES (3, 3, 3, '2018-09-06', NULL, 'Not shipped');