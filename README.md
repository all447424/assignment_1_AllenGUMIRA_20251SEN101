# Sunrise Supermarket - PL/SQL Assignment One

## Student Information

**Name:** GUMIRA Allen 
**Student ID:** 20251SEN101 

## Database Used

Oracle SQL / PL/SQL

## Business Scenario

Sunrise Supermarket sells products to customers who place orders containing one or more items. The database is used to understand customers, products, orders, and sales trends over time.

## What I Did

I created a supermarket database containing four related tables:

- Customers
- Products
- Orders
- Order Items

I populated the database with:

- 5 customers
- 8 products
- 4 product categories
- 15 orders
- 25 order items
- Orders across multiple dates

## JOIN Queries

### 1. Customer Orders

This query uses an INNER JOIN between the customers and orders tables to display each order with the customer's name, city, and order date.

### 2. Order Items and Products

This query joins order_items and products to display the product name, category, price, and quantity for each order item.

### 3. Customers With or Without Orders

This query uses a LEFT JOIN to display all customers, including customers who have not placed an order.

## CTE Query

The CTE calculates each customer's total spending using:

**Quantity × Product Price**

It then compares each customer's spending with the average spending and returns customers whose total spending is above average.

## Window Function Queries

### 1. Customer Spending Rank

The RANK() window function ranks customers according to their total spending, with the highest spending receiving the first rank.

### 2. Customer Order Number

The ROW_NUMBER() function numbers each customer's orders according to the date they were placed.

### 3. Running Revenue Total

A window function calculates the running total of supermarket revenue over time based on order dates.

### 4. Days Between Orders

The LAG() function retrieves the previous order date for each customer. The difference between the current and previous order dates shows the number of days between orders.

## Business Interpretation

The queries help Sunrise Supermarket understand customer purchasing behavior, identify customers with higher spending, examine product sales, and observe revenue trends over time.

## Challenges and Resolutions

One challenge was understanding how the tables are related. I resolved this by using primary keys and foreign keys between customers, orders, products, and order_items.

Another challenge was understanding CTEs and window functions. I resolved this by breaking the queries into smaller steps and using functions such as RANK(), ROW_NUMBER(), and LAG().

## How to Run

1. Create the tables using `create_tables.sql`.
2. Insert the sample data using `insert_data.sql`.
3. Run the analysis queries using `queries.sql`.

The SQL files should be executed in the correct order.

## Files

- `create_tables.sql` - Creates the database tables.
- `insert_data.sql` - Inserts the sample supermarket data.
- `queries.sql` - Contains the JOIN, CTE, and window-function queries.
