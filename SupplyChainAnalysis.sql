-- Supply Chain and Inventory Analysis

CREATE DATABASE SupplyChainDB;

USE SupplyChainDB;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    stock_quantity INT,
    reorder_level INT,
    unit_price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    order_quantity INT,
    order_date DATE,
    delivery_date DATE,
    delivery_status VARCHAR(30),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Product Data

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 10, 15, 55000),
(2, 'Mouse', 'Accessories', 50, 20, 500),
(3, 'Keyboard', 'Accessories', 8, 10, 1200),
(4, 'Monitor', 'Electronics', 5, 8, 12000),
(5, 'Printer', 'Electronics', 25, 10, 15000);

-- Insert Order Data

INSERT INTO Orders VALUES
(101, 1, 5, '2026-01-01', '2026-01-05', 'Delivered'),
(102, 2, 10, '2026-01-02', '2026-01-04', 'Delivered'),
(103, 3, 4, '2026-01-03', '2026-01-10', 'Delayed'),
(104, 4, 3, '2026-01-04', '2026-01-08', 'Delivered'),
(105, 5, 2, '2026-01-05', '2026-01-12', 'Delayed');

-- 1. Display All Products

SELECT * FROM Products;

-- 2. Find Low Stock Products

SELECT *
FROM Products
WHERE stock_quantity < reorder_level;

-- 3. Total Stock Available

SELECT SUM(stock_quantity) AS Total_Stock
FROM Products;

-- 4. Total Orders

SELECT COUNT(*) AS Total_Orders
FROM Orders;

-- 5. Delivery Status Analysis

SELECT delivery_status, COUNT(*) AS Total
FROM Orders
GROUP BY delivery_status;

-- 6. Product-wise Order Quantity

SELECT p.product_name,
       SUM(o.order_quantity) AS Total_Ordered
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
GROUP BY p.product_name;

-- 7. Delayed Orders

SELECT *
FROM Orders
WHERE delivery_status = 'Delayed';

