-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS ProductsSampleDB;
USE ProductsSampleDB;

-- Create Products table
CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,  -- Unique ID for each product, auto-incremented
    Name VARCHAR(100),                         -- Product name
    Price DECIMAL(10, 2),                      -- Product price with two decimal places
    Stock INT                                  -- Stock quantity available for the product
);

-- Insert data into Products table
INSERT INTO Products (Name, Price, Stock)
VALUES 
('Product A', 120.00, 30),
('Product B', 90.00, 60),
('Product C', 150.00, 10),
('Product D', 200.00, 40);

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each customer, auto-incremented
    Name VARCHAR(100),                         -- Customer's name
    City VARCHAR(100)                          -- City where the customer resides
);

-- Insert data into Customers table
INSERT INTO Customers (Name, City)
VALUES 
('John Doe', 'New York'),
('Jane Smith', 'Los Angeles'),
('Alex Johnson', 'New York'),
('Michael Brown', 'Chicago');

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,    -- Unique ID for each order, auto-incremented
    CustomerID INT,                            -- ID of the customer who placed the order
    OrderDate DATE,                            -- Date when the order was placed
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  -- Foreign key linking to Customers table
);

-- Insert data into Orders table
INSERT INTO Orders (CustomerID, OrderDate)
VALUES 
((SELECT CustomerID FROM Customers WHERE Name = 'John Doe'), '2024-10-01'),
((SELECT CustomerID FROM Customers WHERE Name = 'Jane Smith'), '2024-09-25'),
((SELECT CustomerID FROM Customers WHERE Name = 'John Doe'), '2024-08-15'),
((SELECT CustomerID FROM Customers WHERE Name = 'Alex Johnson'), '2024-07-30');

-- Create Sales table
CREATE TABLE IF NOT EXISTS Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,     -- Unique ID for each sale, auto-incremented
    ProductID INT,                             -- ID of the product sold
    TotalAmount DECIMAL(10, 2),               -- Total amount for the sale
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)  -- Foreign key linking to Products table
);

-- Insert data into Sales table
INSERT INTO Sales (ProductID, TotalAmount)
VALUES 
((SELECT ProductID FROM Products WHERE Name = 'Product A'), 120.00),
((SELECT ProductID FROM Products WHERE Name = 'Product B'), 90.00),
((SELECT ProductID FROM Products WHERE Name = 'Product C'), 300.00),
((SELECT ProductID FROM Products WHERE Name = 'Product A'), 240.00);
