-- 1. Retrieve Products Based on Price and Stock. 

-- Write a query to retrieve all products 
-- from a table called Products where the price is greater than 100 and stock is less than 50.

SELECT * 
FROM Products
WHERE Price > 100 
AND Stock < 50;

-- 2. Join Two Tables Using Orders and Customers tables

-- Write a query to find all orders placed by customers who live in "New York." 
-- Display the customer’s name, order ID, and order date.

SELECT c.Name as CustomerName, o.OrderID, o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.City = 'New York';

-- 3. Total Sales for Each Product

-- Write a query to calculate the total sales for each product by 
-- summing the TotalAmount from the Sales table, grouped by ProductID.

SELECT ProductID, SUM(TotalAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

-- 4. Find Frequent Customers

-- Write a query to find customers who have placed more than 5 orders. 
-- Display the customer’s name.

SELECT c.Name as CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING COUNT(o.OrderID) >= 5;