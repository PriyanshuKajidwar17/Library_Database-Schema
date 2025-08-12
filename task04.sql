-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2),
    OrderDate DATE
);

-- Insert sample data
INSERT INTO Orders (OrderID, CustomerName, Product, Quantity, Price, OrderDate) VALUES
(1, 'Alice', 'Laptop', 1, 1200.00, '2025-08-01'),
(2, 'Bob', 'Mouse', 2, 25.00, '2025-08-01'),
(3, 'Alice', 'Monitor', 1, 300.00, '2025-08-02'),
(4, 'David', 'Laptop', 1, 1150.00, '2025-08-02'),
(5, 'Bob', 'Keyboard', 1, 45.00, '2025-08-03'),
(6, 'Charlie', 'Monitor', 2, 295.00, '2025-08-03');

-- Aggregate Queries

-- Total revenue
SELECT SUM(Quantity * Price) AS TotalRevenue FROM Orders;

-- Total orders per customer
SELECT CustomerName, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY CustomerName;

-- Average order value per product
SELECT Product, AVG(Price) AS AvgPrice
FROM Orders
GROUP BY Product;

-- Revenue per customer
SELECT CustomerName, SUM(Quantity * Price) AS CustomerRevenue
FROM Orders
GROUP BY CustomerName;

-- Products sold more than once
SELECT Product, COUNT(*) AS OrderCount
FROM Orders
GROUP BY Product
HAVING COUNT(*) > 1;

-- Most expensive order
SELECT MAX(Quantity * Price) AS MaxOrderValue
FROM Orders;
