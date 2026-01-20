CREATE TABLE joins.customers (
CustomerId INT AUTO_INCREMENT PRIMARY KEY,
CustomerName VARCHAR(50),
City VARCHAR(50)
);

INSERT INTO joins.customers (CustomerName,City)
VALUES('John Smith','New York'),
('Mary Johnson','Chicago'),
('Peter Adams','Los Angeles'),
('Nancy Miller','Houston'),
('Robert White','Miami');

CREATE TABLE joins.orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Amount INT
);
INSERT INTO joins.orders (OrderID,OrderDate,Amount,CustomerID)
VALUES(101, '2024-10-01', 250, 1),
(102, '2024-10-05', 300, 2),
(103, '2024-10-07', 150, 1),
(104, '2024-10-10', 450, 3),
(105, '2024-10-12', 400, 6);

CREATE TABLE joins.Payments(
PaymentID VARCHAR(50) PRIMARY KEY,
CustomerID INT,
PaymentDate DATE,
Amount INT
);
INSERT INTO joins.Payments (PaymentID, CustomerID, PaymentDate, Amount)
VALUES 
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

CREATE TABLE joins.employees(
EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
EmployeeName VARCHAR(50),
ManagerID INT NULL
);
INSERT INTO joins.employees (EmployeeName,ManagerID)
VALUES ('Alex Green', NULL),
('Brian Lee',1),
('Carol Roy',1),
('David Kim',2),
('Eva Smith',2);

USE joins;
-- Question 1. Retrieve all customers who have placed at least one order.
SELECT *
FROM customers INNER JOIN orders
ON
customers.customerID=orders.customerID;

-- Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.
SELECT *
FROM customers LEFT JOIN orders
ON
customers.customerID=orders.customerID;

-- Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers.
SELECT *
FROM customers RIGHT JOIN orders
ON
customers.customerID=orders.customerID;

-- Question 4. Display all customers and orders, whether matched or not.
SELECT 
    Customers.CustomerID, 
    Customers.CustomerName, 
    Orders.OrderID, 
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT 
    Customers.CustomerID, 
    Customers.CustomerName, 
    Orders.OrderID, 
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;
    
-- Question 5. Find customers who have not placed any orders.
SELECT *
FROM customers LEFT JOIN orders
ON
customers.customerID=orders.customerID
WHERE orderID IS NULL;

-- Question 6. Retrieve customers who made payments but did not place any orders.
SELECT *
FROM payments LEFT JOIN orders
ON
payments.CustomerID = orders.CustomerID
WHERE OrderID IS NULL;

-- Question 7. Generate a list of all possible combinations between Customers and Orders.
SELECT *
FROM customers CROSS JOIN orders;

-- Question 8. Show all customers along with order and payment amounts in one table.
SELECT *
FROM customers LEFT JOIN orders
ON 
customers.customerID= orders.customerID
INNER JOIN Payments ON customers.CustomerID = Payments.CustomerID;

-- Question 9. Retrieve all customers who have both placed orders and made payments.
SELECT *
FROM customers INNER JOIN orders
ON 
customers.customerID= orders.customerID
INNER JOIN Payments ON customers.CustomerID = Payments.CustomerID;
