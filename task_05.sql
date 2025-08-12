-- Drop tables if they already exist
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers
INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'Australia');

-- Insert sample data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2025-08-01', 250.00),
(102, 1, '2025-08-05', 150.00),
(103, 2, '2025-08-07', 300.00),
(104, 5, '2025-08-08', 400.00); -- Order with non-existent customer

-- INNER JOIN: Only matching records
SELECT 
    Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM 
    Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN: All customers, with matching orders if available
SELECT 
    Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM 
    Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN: All orders, with matching customers (MySQL only)
-- SQLite doesn't support RIGHT JOIN directly. Use this workaround:
-- Flip the LEFT JOIN
SELECT 
    Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM 
    Orders
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID;

-- FULL OUTER JOIN: Simulated using UNION (for SQLite/MySQL)
SELECT 
    Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM 
    Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT 
    Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM 
    Orders
LEFT JOIN Customers ON Customers.CustomerID = Orders.CustomerID;
