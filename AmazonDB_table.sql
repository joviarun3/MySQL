-- Step 1: Create the database
CREATE DATABASE AmazonDB;
-- CREATE DATABASE IF NOT EXISTS AmazonDB;

-- Step 2: Use the database
USE AmazonDB;

-- Step 3: Create table for Users
CREATE TABLE Users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(150) UNIQUE NOT NULL,
	registered_date DATE NOT NULL,
    membership ENUM ('Basic', 'Prime') DEFAULT 'Basic' -- Enum restricts a column entries to a predefined set of string values. Defaukt is basic, but use can change to prime as well. Only these two entries
);

-- Step 4: Create table for products
CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL, -- Total numbers is 10 with 2 decimal digits
    category VARCHAR(100) NOT NULL,
    stock INT NOT NULL
    );

-- Step 5: Create table for orders
CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
    );

-- Step 6: Create table for order details   
CREATE TABLE OrderDetails(
	order_details_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
 );   

SELECT * FROM Users;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM OrderDetails;

-- enter the values in table
INSERT INTO Users (name, email, registered_date, membership) VALUES
('Alice Johnson', 'alice.j@example.com', '2024-01-15', 'Prime'),
('Bob Smith', 'bob.s@example.com', '2024-02-01', 'Basic'),
('Charlie Brown', 'charlie.b@example.com', '2024-03-10', 'Prime'),
('Daisy Ridley', 'daisy.r@example.com', '2024-04-12', 'Basic');   
  
INSERT INTO products (name, price, category, stock) VALUES
('Echo Dot', 49.99, 'Electronics', 120),
('Kindle Paperwhite', 129.99, 'Books', 50),
('Fire Stick', 39.99, 'Electronics', 80),
('Yoga Mat', 19.99, 'Fitness', 200),
('Wireless Mouse', 24.99, 'Electronics', 150);

INSERT INTO Orders (user_id, order_date, total_amount) VALUES
(1, '2024-05-01', 79.98),
(2, '2024-05-03', 129.99),
(1, '2024-05-04', 49.99),
(3, '2024-05-05', 24.99);

INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 1, 1),
(4, 5, 1);
