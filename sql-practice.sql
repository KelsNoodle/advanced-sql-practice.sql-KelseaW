-- Select everything
select * from customers;

-- Select everything from orders
select * from orders;

-- Select customers first name and last name, join them to orders to get results of customers that have placed an order
SELECT customers.first_name, customers.last_name, orders.total_amount FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;

-- Select all customers with first name, order date, create an order total amount for each customer, and return all customers
SELECT customers.first_name, orders.order_date, orders.total_amount FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

-- Select everything from orders attached to a valid customer id
SELECT * FROM orders WHERE customer_id IN (SELECT id FROM customers);

-- Select every customer that has placed an order
SELECT * FROM customers WHERE id IN (SELECT customer_id FROM orders);

-- Select customer id, order date, create an order total amount for each customer that were made on the same date
SELECT customer_id, order_date, SUM(total_amount) AS total_spent
FROM orders GROUP BY customer_id, order_date;

-- Select customer id, sum their order total, aggregate customer id but only include results if the total amount is greater than 200
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders GROUP BY customer_id HAVING total_spent > 200;
