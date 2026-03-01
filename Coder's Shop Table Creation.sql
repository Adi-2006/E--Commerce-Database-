-- Customer Table Created
CREATE TABLE Customer(
customer_id INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(150) UNIQUE,
city VARCHAR (50),
signup_date DATE
);

-- Creating Product Table
CREATE TABLE Product(
product_id INT PRIMARY KEY,
product_name VARCHAR(100) ,
category VARCHAR(50),
price DECIMAL(10,2),
stock INT
);

-- Creating Table Orders
CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_status VARCHAR(30),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Creating Table Order Item
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Creting Table Payment
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY ,
    order_id INT,
    payment_mode VARCHAR(30),
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
