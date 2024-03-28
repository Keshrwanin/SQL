Create Database Customers_Orders_Products

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Cust_Name VARCHAR(50),
  Email VARCHAR(100)
)
Select * from Customers
INSERT INTO Customers (CustomerID, Cust_Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com')

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
)

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1)


CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
)

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99)

Select * from Customers
Select * from Products
select * from Orders

---------- TASK 1 ------------------------------
--Q1
Select * from Customers

--Q2
SELECT Cust_Name, email
FROM customers
WHERE Cust_Name LIKE 'J%'

--Q3
Select Orders.OrderID,Orders.ProductName,Orders.Quantity from Orders

--Q4
Select SUM(Quantity) from Orders

--Q5
Select Customers.Cust_Name,Orders.OrderID,Orders.ProductName,Orders.Quantity from Orders
inner join Customers
on Orders.CustomerID=Customers.CustomerID

--Q6
Select * from Products
where price>10

--Q7
Select Customers.Cust_Name,Orders.OrderDate from Customers 
left join Orders
on Customers.CustomerID=Orders.CustomerID
where Orders.OrderDate>'2023-07-05'

--Q8
select * from Products
Select AVG(Products.Price) from Products

SELECT p.*, Avg_table.Avg_price
FROM products p
CROSS JOIN (
    SELECT AVG(price) AS avg_price
    FROM products
) Avg_table

--Q9
Select Customers.Cust_Name, Orders.Quantity from Customers
left join Orders
on Customers.CustomerID=Orders.CustomerID
Order by Quantity DESC

--Q10
Select Distinct Products.ProductName from Products
inner join Orders
on Products.ProductName=Orders.ProductName

-------- TASK 2 -------------------------
--Q1
SELECT top 5 c.CustomerID, c.Cust_Name, SUM(o.quantity) AS Total_quantity
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Cust_Name
ORDER BY Total_quantity DESC

--Q2
SELECT p.*, Avg_table.Avg_price
FROM products p
CROSS JOIN (
    SELECT AVG(price) AS avg_price
    FROM products
) Avg_table

--Q3--	Write a query to retrieve the customers who have not placed any orders.
Select * from Products
Select * from Orders
Select * from Customers

Select Cust_name from Customers
Left join Orders
on Customers.CustomerID=Orders.CustomerID
Where orders.orderID is Null

--Q4	Write a query to retrieve the order details (OrderID, ProductName, Quantity)
--      for orders placed by customers whose names start with 'M'.

SELECT o.OrderID, o.ProductName, o.Quantity
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON p.ProductName = o.ProductName
WHERE c.Cust_Name LIKE 'M%'

--Q5	Write a query to calculate the total revenue generated from all orders.
Select * from Products
Select * from Orders
Select * from Customers

Select Sum(o.quantity*p.price)'Sales' from Orders o
join Products p
on o.ProductName=p.ProductName

--Q6	Write a query to retrieve the customer names along with the total revenue generated from their orders.
Select C.Cust_Name,(o.quantity*p.price)'Sales' from Orders o
join Products p
on o.ProductName=p.ProductName
join Customers c
on o.CustomerID=c.CustomerID

--Q7	Write a query to retrieve the customers who have placed at least one order for each product category.

--Q8	Write a query to retrieve the customers who have placed orders on consecutive days.
SELECT DISTINCT c.Cust_Name
FROM Customers c
JOIN Orders o1 ON c.CustomerID = o1.CustomerID
JOIN Orders o2 ON c.CustomerID = o2.CustomerID
WHERE o1.OrderDate = DATEADD(day, 1, o2.OrderDate)
   OR o1.OrderDate = DATEADD(day, -1, o2.OrderDate)

--Q9	Write a query to retrieve the top 3 products with the highest average quantity ordered.
Select top 3 o.ProductName, AVG(Quantity) as 'Avg_Qty_Order' from Orders o
group by ProductName
order by Avg_Qty_Order

--Q10	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity

------ TASK 3----------------------------------------
--Q1	Write a query to retrieve the customers who have placed orders for all products.
SELECT c.Cust_Name
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Cust_Name
HAVING COUNT(DISTINCT o.ProductName) = (SELECT COUNT(DISTINCT ProductName) FROM Products)

--Q2	Write a query to retrieve the products that have been ordered by all customers.
SELECT p.ProductName
FROM Products p
JOIN Orders o ON p.ProductName = o.ProductName
GROUP BY p.ProductName
HAVING COUNT(DISTINCT o.CustomerID) = (SELECT COUNT(DISTINCT CustomerID) FROM Customers)

--Q3	Write a query to calculate the total revenue generated from orders placed in each month.
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(Quantity * Price) AS TotalRevenue
FROM 
    Orders o
JOIN 
    Products p ON o.ProductName = p.ProductName
GROUP BY 
    YEAR(OrderDate), MONTH(OrderDate)
ORDER BY 
    YEAR(OrderDate), MONTH(OrderDate)

--Q4	Write a query to retrieve the products that have been ordered by more than 50% of the customers.
SELECT p.ProductName FROM Products p
JOIN Orders o ON p.ProductName = o.ProductName
GROUP BY p.ProductName
HAVING COUNT(DISTINCT o.CustomerID) > (SELECT COUNT(*) FROM Customers) * 0.5

--Q5	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
SELECT TOP 5
    c.CustomerID,
    c.Cust_Name,
    SUM(o.Quantity * p.Price) AS Total_Amount_Spent
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    Products p ON o.ProductName = p.ProductName
GROUP BY 
    c.CustomerID, c.Cust_Name
ORDER BY 
    Total_Amount_Spent DESC

--Q6	Write a query to calculate the running total of order quantities for each customer.
SELECT 
    CustomerID,
    OrderID,
    Quantity,
    (SELECT SUM(o2.Quantity) 
     FROM Orders o2 
     WHERE o2.CustomerID = o.CustomerID 
     AND o2.OrderDate <= o.OrderDate) AS running_total
FROM Orders o

--Q7.	Write a query to retrieve the top 3 most recent orders for each customer.
WITH RankedOrders AS (
    SELECT 
        CustomerID,
        OrderID,
        OrderDate,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS OrderRank
    FROM 
        Orders) 
SELECT 
    CustomerID,
    OrderID,
    OrderDate
FROM 
    RankedOrders
WHERE 
    OrderRank <= 3

--Q8.	Write a query to calculate the total revenue generated by each customer in the last 300 days.
SELECT 
    c.CustomerID,
    c.Cust_Name,
    SUM(o.Quantity * p.Price) AS total_revenue_last_300_days
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    Products p ON o.ProductName = p.ProductName
WHERE 
    o.OrderDate >= DATEADD(day, -300, GETDATE())
GROUP BY 
    c.CustomerID, c.Cust_Name

--Q9.	Write a query to retrieve the customers who have placed orders for at least two different product categories.

--Q10.	Write a query to calculate the average revenue per order for each customer.
SELECT 
    o.CustomerID,
    c.Cust_Name,
    SUM(o.Quantity * p.Price) / COUNT(o.OrderID) AS average_revenue_per_order
FROM 
    Orders o
JOIN 
    Products p ON o.ProductName = p.ProductName
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    o.CustomerID, c.Cust_Name

--Q11.	Write a query to retrieve the customers who have placed orders for every month of a specific year.
SELECT 
    c.CustomerID,
    c.Cust_Name
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    YEAR(o.OrderDate) = 2023
GROUP BY 
    c.CustomerID, c.Cust_Name
HAVING 
    COUNT(DISTINCT MONTH(o.OrderDate)) = 12

--Q12.	Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.
SELECT DISTINCT
    c.CustomerID,
    c.Cust_Name
FROM 
    Customers c
JOIN 
    Orders o1 ON c.CustomerID = o1.CustomerID
JOIN 
    Orders o2 ON c.CustomerID = o2.CustomerID
WHERE 
    o1.ProductName = 'Product B' -- Replace 'YourSpecificProduct' with the desired product name
    AND o2.ProductName = 'Product C' -- Replace 'YourSpecificProduct' with the desired product name
    AND DATEDIFF(month, o1.OrderDate, o2.OrderDate) = 1
	
--Q13.	Write a query to retrieve the products that have been ordered by a specific customer at least twice.
SELECT CustomerID, OrderID FROM Orders
WHERE
    CustomerID IN (
        SELECT CustomerID FROM Orders
        GROUP BY CustomerID
        HAVING COUNT(*) >= 2
					)
