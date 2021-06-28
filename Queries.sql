SELECT * FROM Customers;

SELECT FirstName, LastName FROM Customers;

SELECT FirstName, LastName FROM Customers WHERE ID = 1;

UPDATE Customers
SET FirstName = 'Lerato', LastName= 'Mabitso'
WHERE ID = 1;

DELETE FROM Customers WHERE ID IN(2);

SELECT COUNT(Status), Status FROM Orders GROUP BY Status;

SELECT MAX(Amount) FROM Payments;

SELECT * FROM Customers ORDER BY Country;

SELECT * FROM Products WHERE BuyPrice BETWEEN 100 AND 600;

SELECT * FROM Customers WHERE  Country ='Germany' AND City ='Berlin';

SELECT * FROM Customers WHERE  City ='Cape Town' OR City ='Durban';

SELECT *
FROM Products
WHERE BuyPrice > 500;


SELECT
    SUM(Amount)
FROM
    Payments;
    

SELECT Orders.Status, COUNT(Status) FROM Orders WHERE Status IN ('Shipped') GROUP BY Orders.Status;


SELECT CAST(AVG(BuyPrice) AS DECIMAL(10,2)) AS Average_Rands, CAST(AVG(BuyPrice / 12.0) AS DECIMAL(10,2)) AS Average_Dollars FROM Products;

    
SELECT *
FROM Payments
INNER JOIN Customers
ON Payments.ID = Customers.ID;


SELECT * FROM Products WHERE Description LIKE '%Turnable front wheels%';