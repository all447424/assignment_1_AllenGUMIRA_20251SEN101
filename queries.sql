-- =========================================================
-- SUNRISE SUPERMARKET - REQUIRED SQL QUERIES
-- =========================================================


-- =========================================================
-- JOIN QUERY 1
-- List every order with the customer's name, city and date.
-- Uses INNER JOIN between orders and customers.
-- =========================================================

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_date
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_date;


-- =========================================================
-- JOIN QUERY 2
-- List every order item with product name, category,
-- price and quantity.
-- Uses JOIN between order_items and products.
-- =========================================================

SELECT
    oi.order_item_id,
    p.product_name,
    p.category,
    p.price,
    oi.quantity
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY oi.order_item_id;


-- =========================================================
-- JOIN QUERY 3
-- List ALL customers and their orders, including customers
-- who have no orders.
-- Uses LEFT JOIN.
-- =========================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date;


-- =========================================================
-- CTE QUERY
-- Calculate each customer's total spending and return
-- customers whose spending is above the average.
-- Spending = quantity × price.
-- =========================================================

WITH customer_totals AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COALESCE(SUM(oi.quantity * p.price), 0) AS total_spend
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id
    LEFT JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spend
FROM customer_totals
WHERE total_spend > (
    SELECT AVG(total_spend)
    FROM customer_totals
)
ORDER BY total_spend DESC;


-- =========================================================
-- WINDOW QUERY 1
-- Rank customers by total amount spent.
-- Highest spending customer gets rank 1.
-- =========================================================

WITH customer_totals AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COALESCE(SUM(oi.quantity * p.price), 0) AS total_spend
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id
    LEFT JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spend,
    RANK() OVER (ORDER BY total_spend DESC) AS spending_rank
FROM customer_totals
ORDER BY spending_rank;


-- =========================================================
-- WINDOW QUERY 2
-- Number each customer's orders in the order they were placed.
-- ROW_NUMBER starts at 1 for each customer.
-- =========================================================

SELECT
    customer_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_number
FROM orders
ORDER BY customer_id, order_date;


-- =========================================================
-- WINDOW QUERY 3
-- Show a running total of revenue over time.
-- Revenue = quantity × product price.
-- =========================================================

SELECT
    o.order_date,
    SUM(oi.quantity * p.price) AS daily_revenue,
    SUM(SUM(oi.quantity * p.price)) OVER (
        ORDER BY o.order_date
    ) AS running_total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY o.order_date
ORDER BY o.order_date;


-- =========================================================
-- WINDOW QUERY 4
-- For customers with more than one order, show the number
-- of days between the current order and previous order.
-- LAG() gets the previous order date.
-- =========================================================

WITH order_history AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        LAG(order_date) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS previous_order_date,
        COUNT(*) OVER (
            PARTITION BY customer_id
        ) AS customer_order_count
    FROM orders
)
SELECT
    customer_id,
    order_id,
    order_date,
    previous_order_date,
    order_date - previous_order_date AS days_between_orders
FROM order_history
WHERE customer_order_count > 1
ORDER BY customer_id, order_date;
