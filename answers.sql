-- Question 1 : Achieving 1NF (First Normal Form)
-- Transform ProductDetail table to 1NF by separating products into individual rows

-- Create a new table to hold the normalized data
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert normalized data into the new table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');


-- Question 2 : Achieving 2NF (Second Normal Form)
-- Remove partial dependencies by creating two tables: OrderDetails and Customers

-- Create a new table to hold order details (without CustomerName)
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product)
);

-- Create a new table to hold customer details (separate customer info)
CREATE TABLE Customers (
    OrderID INT,
    CustomerName VARCHAR(100),
    PRIMARY KEY (OrderID)
);

-- Insert data into OrderDetails_2NF
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES 
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- Insert data into Customers table
INSERT INTO Customers (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');
