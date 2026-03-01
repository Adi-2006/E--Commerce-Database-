# 🗄️ E-Commerce Database Design & SQL Practice (PostgreSQL)

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blue?style=for-the-badge&logo=postgresql)
![SQL](https://img.shields.io/badge/Concepts-Database%20Design-orange?style=for-the-badge)
![Practice](https://img.shields.io/badge/Type-SQL%20Practice-success?style=for-the-badge)

---

## 📘 Project Overview

Today, I revised **Database Creation & SQL Concepts** by designing a complete **E-Commerce Database System** using **PostgreSQL**.

The database was created and managed using **pgAdmin 4**, where tables were designed following real-world relational database principles.

This project focuses on:

- Database Design  
- Table Relationships  
- Constraints Usage  
- Relational Mapping  
- SQL Join Understanding  

The database simulates a **real-world online shopping system**.

---

## 🛠️ Database Creation Tool

- PostgreSQL
- pgAdmin 4 (Database Management Tool)

The database schema, tables, and relationships were created using **pgAdmin 4 Query Tool**.

---

# 🏗️ Database Schema Design

The system contains **5 relational tables**:

- Customer  
- Product  
- Orders  
- Order_Items  
- Payment  

---

## 👤 Customer Table

### Purpose
Stores customer registration details.

### Columns

| Column | Description |
|--------|------------|
| customer_id | Unique customer identifier |
| name | Customer name |
| email | Customer email |
| city | Customer city |
| signup_date | Registration date |

### Constraints Used
- PRIMARY KEY → Ensures unique customer identification
- UNIQUE(email) → Prevents duplicate email entries

---

## 📦 Product Table

### Purpose
Stores product inventory information.

### Columns

| Column | Description |
|--------|------------|
| product_id | Unique product ID |
| product_name | Product name |
| category | Product category |
| price | Product price |
| stock | Available quantity |

### Constraint
- PRIMARY KEY ensures product uniqueness.

---

## 🧾 Orders Table

### Purpose
Stores order details placed by customers.

### Columns

| Column | Description |
|--------|------------|
| order_id | Unique order ID |
| customer_id | Customer reference |
| order_date | Order date |
| order_status | Order state |

### Constraint
- FOREIGN KEY(customer_id) creates relationship between **Customer → Orders**

---

## 🛒 Order_Items Table

### Purpose
Handles multiple products inside one order.

### Columns

| Column | Description |
|--------|------------|
| order_item_id | Unique item ID |
| order_id | Order reference |
| product_id | Product reference |
| quantity | Quantity purchased |

### Constraints
- FOREIGN KEY(order_id) → Links Orders table  
- FOREIGN KEY(product_id) → Links Product table  

This enables **Many-to-Many Relationship** between Orders and Products.

---

## 💳 Payment Table

### Purpose
Stores payment transaction details.

### Columns

| Column | Description |
|--------|------------|
| payment_id | Unique payment ID |
| order_id | Order reference |
| payment_mode | Payment method |
| amount | Paid amount |
| payment_date | Payment date |

### Constraint
- FOREIGN KEY(order_id) ensures valid payment mapping.

---

# 🔗 Table Relationships

Customer → Orders → Order_Items ← Product  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;↓  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Payment  

✔ One Customer → Many Orders  
✔ One Order → Multiple Products  
✔ One Order → One Payment  

---

# 🧱 Table Creation Queries (PostgreSQL)

```sql
-- Customer Table
CREATE TABLE Customer(
customer_id INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(150) UNIQUE,
city VARCHAR (50),
signup_date DATE
);

-- Product Table
CREATE TABLE Product(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2),
stock INT
);

-- Orders Table
CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
order_status VARCHAR(30),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Order Items Table
CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Payment Table
CREATE TABLE Payment (
payment_id INT PRIMARY KEY,
order_id INT,
payment_mode VARCHAR(30),
amount DECIMAL(10,2),
payment_date DATE,
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
```
---
## ⚠️ Challenges Faced During Implementation

While creating this database, I encountered some practical issues:

- Foreign Key dependency errors when tables were created in the wrong order.  
- Case-sensitivity issues in PostgreSQL table naming.  
- Constraint mismatch while referencing parent tables.  
- Syntax errors due to missing commas or incorrect datatype usage.  
- Understanding correct relationship flow between `Orders` and `Order_Items` tables.  

These challenges helped improve my debugging and database design understanding.

---

## 🔍 SQL Concepts Practiced

- INNER JOIN  
- LEFT JOIN  
- RIGHT JOIN  
- FULL JOIN  
- Foreign Keys  
- Relational Database Design  
- Table Relationships  

---

## 🎯 Learning Outcome

Through this revision, I strengthened my understanding of:

- Real-world Database Modeling  
- Data Integrity using Constraints  
- SQL Relationships  
- Query Logic using Joins  
- Backend Data Structure Understanding  

---

## 🛠️ Tech Stack

- PostgreSQL  
- SQL  
- pgAdmin 4  
- Relational Database Concepts  

---

## 🤝 Let's Connect

🔗 **LinkedIn:** ["Connect Me ! "](https://www.linkedin.com/in/dwivediaditya4093/)

---

⭐ If you found this useful, consider giving this repository a star!
