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