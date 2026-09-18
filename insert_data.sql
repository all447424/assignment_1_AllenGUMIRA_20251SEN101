-- CUSTOMERS
INSERT INTO customers VALUES (1, 'Alice Uwase', 'Kigali');
INSERT INTO customers VALUES (2, 'Brian Mugisha', 'Musanze');
INSERT INTO customers VALUES (3, 'Claudine Mukamana', 'Huye');
INSERT INTO customers VALUES (4, 'David Niyonzima', 'Rubavu');
INSERT INTO customers VALUES (5, 'Eric Habimana', 'Kigali');


-- PRODUCTS
INSERT INTO products VALUES (1, 'Rice 5kg', 'Groceries', 8500.00);
INSERT INTO products VALUES (2, 'Sugar 2kg', 'Groceries', 2500.00);
INSERT INTO products VALUES (3, 'Cooking Oil 1L', 'Groceries', 3000.00);
INSERT INTO products VALUES (4, 'Milk 1L', 'Dairy', 1500.00);
INSERT INTO products VALUES (5, 'Cheese 500g', 'Dairy', 4500.00);
INSERT INTO products VALUES (6, 'Soap Bar', 'Household', 1000.00);
INSERT INTO products VALUES (7, 'Toothpaste', 'Personal Care', 2000.00);
INSERT INTO products VALUES (8, 'Shampoo', 'Personal Care', 5000.00);


-- ORDERS
INSERT INTO orders VALUES (1, 1, '2026-08-01');
INSERT INTO orders VALUES (2, 2, '2026-08-02');
INSERT INTO orders VALUES (3, 3, '2026-08-03');
INSERT INTO orders VALUES (4, 1, '2026-08-05');
INSERT INTO orders VALUES (5, 4, '2026-08-07');
INSERT INTO orders VALUES (6, 5, '2026-08-08');
INSERT INTO orders VALUES (7, 2, '2026-08-10');
INSERT INTO orders VALUES (8, 3, '2026-08-12');
INSERT INTO orders VALUES (9, 1, '2026-08-15');
INSERT INTO orders VALUES (10, 4, '2026-08-16');
INSERT INTO orders VALUES (11, 5, '2026-08-18');
INSERT INTO orders VALUES (12, 2, '2026-08-20');
INSERT INTO orders VALUES (13, 3, '2026-08-22');
INSERT INTO orders VALUES (14, 1, '2026-08-25');
INSERT INTO orders VALUES (15, 5, '2026-08-28');


-- ORDER ITEMS
INSERT INTO order_items VALUES (1, 1, 1, 2);
INSERT INTO order_items VALUES (2, 1, 4, 3);

INSERT INTO order_items VALUES (3, 2, 2, 4);
INSERT INTO order_items VALUES (4, 2, 6, 2);

INSERT INTO order_items VALUES (5, 3, 3, 2);
INSERT INTO order_items VALUES (6, 3, 5, 1);

INSERT INTO order_items VALUES (7, 4, 1, 1);
INSERT INTO order_items VALUES (8, 4, 7, 2);

INSERT INTO order_items VALUES (9, 5, 8, 1);
INSERT INTO order_items VALUES (10, 5, 6, 3);

INSERT INTO order_items VALUES (11, 6, 4, 4);
INSERT INTO order_items VALUES (12, 6, 2, 2);

INSERT INTO order_items VALUES (13, 7, 1, 3);
INSERT INTO order_items VALUES (14, 7, 3, 2);

INSERT INTO order_items VALUES (15, 8, 5, 2);
INSERT INTO order_items VALUES (16, 8, 7, 1);

INSERT INTO order_items VALUES (17, 9, 8, 2);
INSERT INTO order_items VALUES (18, 9, 4, 3);

INSERT INTO order_items VALUES (19, 10, 2, 5);
INSERT INTO order_items VALUES (20, 10, 6, 4);

INSERT INTO order_items VALUES (21, 11, 1, 2);
INSERT INTO order_items VALUES (22, 12, 3, 3);
INSERT INTO order_items VALUES (23, 13, 5, 1);
INSERT INTO order_items VALUES (24, 14, 7, 3);
INSERT INTO order_items VALUES (25, 15, 8, 2);
