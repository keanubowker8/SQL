# Part 1: Creating a database
Save all of your instructions in a script file - you will submit this file on Gnomio and github.

Create a database called “Umuzi”.

Create the following tables in the Umuzi database:

- Customers
- Employees
- Orders
- Payments
- Products

Create a primary key for each table with auto-increment (make sure you correctly specify the data types, e.g. the ID field should be int).

Create foreign keys so that every ID in the order table references an existing ID in the tables referenced (e.g., ProductID, EmployeeID, etc).

INSERT the records in the tables below into the table you created in step 2.

Document what information is stored in your database. Be sure to say what information is kept in what table, and which keys link the records between tables.

## Customers Table
|CustomerID (int)|	FirstName (varchar50)|	LastName (varchar50)|	Gender (varchar)|	Address (varchar200)|	Phone (int 10)|	Email (varchar100)|	City (varchar20)|	Country (varchar50)|
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1| 	John| 	Hibert| 	Male| 	284 chaucer st| 	084789657| 	john@gmail.com| 	Johannesburg| 	South Africa| 
| 2| 	Thando| 	Sithole| 	Female| 	240 Sect 1| 	0794445584| 	thando@gmail.com| 	Cape Town| 	South Africa| 
| 3| 	Leon| 	Glen	| Male| 	81 Everton Rd,Gillits| 	0820832830| 	Leon@gmail.com| 	Durban| 	South Africa| 
| 4| 	Charl| 	Muller| 	Male| 	290A Dorset Ecke| 	+44856872553	| Charl.muller@yahoo.com| 	Berlin	| Germany| 
| 5| 	Julia| 	Stein| 	Female| 	2 Wernerring	| +448672445058| 	Js234@yahoo.com| 	Frankfurt| 	Germany| 
## Employees Table
| EmployeeID (int)| 	FirstName (varchar50)| 	LastName (varchar50)| 	Email (varchar100)| 	JobTitle (varchar20)|
| --- | --- | --- | --- | --- |
|1	|Kani|	Matthew|	mat@gmail.com|	Manager|
|2|	Lesly	|Cronje|	LesC@gmail.com	|Clerk|
|3|	Gideon|	Maduku|	m@gmail.com|	Accountant|
## Orders Table
|OrderId (int)|	ProductID (int)|	PaymentID (int)|	FulfilledByEmployeeID (int)|	DateRequired (datetime)|	DateShipped (datetime)	|Status (varchar20)|
| --- | --- | --- | --- | --- | --- | --- |
|1|	1|	1|	2|	05-09-2018|		|Not shipped|
|2|	1|	2|	2|	04-09-2018|	03-09-2018|	Shipped|
|3	|3	|3|	3	|06-09-2018	|	|Not shipped|
## Payments Table
|CustomerId (int)|	PaymentID (int)|	PaymentDate (datetime)|	Amount (decimal)|
| --- | --- | --- | --- |
|1|	1|	01-09-2018|	R150.75|
|5	|2	|03-09-2018|	R150.75|
|4	|3	|03-09-2018	|R700.60|
## Products Table
|ProductId (int)|	ProductName (varchar100)|	Description (varchar300)|	BuyPrice (decimal)|
| --- | --- | --- | --- |
|1|	Harley| Davidson| Chopper|	This replica features working kickstand, front suspension, gear-shift lever|	R150.75|
|2|	Classic Car|	Turnable front wheels, steering function|	R550.75|
|3	|Sports car|	Turnable front wheels, steering function|	R700.60|
# Part 2: Querying a database
1. Save all of your instructions in a script file - you will submit this file on Gnomio and github.

2. SELECT ALL records from table Customers.

3. SELECT records only from the name column in the Customers table.

4. Show the name of the Customer whose CustomerID is 1.

5. UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”.

6. DELETE the record from the Customers table for customer 2 (CustomerID = 2).

7. Select all unique statuses from the Orders table and get a count of the number of orders for each unique status.

8. Return the MAXIMUM payment made on the PAYMENTS table.

9. Select all customers from the “Customers” table, sorted by the “Country” column.

10. Select all products with a price BETWEEN R100 and R600.

11. Select all fields from “Customers” where country is “Germany” AND city is “Berlin”.

12. Select all fields from “Customers” where city is “Cape Town” OR “Durban”.

13. Select all records from Products where the Price is GREATER than R500.

14. Return the sum of the Amounts on the Payments table.

15. Count the number of shipped orders in the Orders table.

16. Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar).

17. Using INNER JOIN create a query that selects all Payments with Customer information.

18. Select all products that have turnable front wheels.
