USE restaurant_db;

-- 1. View the menu_items table --
SELECT * FROM menu_items;

-- 2. Find the number of items on the menu --
SELECT COUNT(*) FROM menu_items;

-- 3. What are the least and most expensive items on the Menu? --
SELECT * FROM menu_items
ORDER BY Price;

SELECT * FROM menu_items
ORDER BY Price DESC;

-- 4. How many Italian dishes are on the menu? --
SELECT COUNT(*) FROM menu_items
WHERE category ='Italian';

SELECT * FROM menu_items
WHERE category ='Italian';

-- 5. What are the least and most expensive Italian dishes on the Menu? --
SELECT * FROM menu_items
WHERE category = 'Italian'
ORDER BY price;

SELECT * FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

-- 6. How many dishes are in each Category? --
SELECT category, COUNT(menu_item_id) AS num_items
FROM menu_items
GROUP BY category;

-- 7. What is the Average dish price within each Category? -- 
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category;


-- ORDER DETAILS TABLE --
-- 1. View the order_details table
SELECT * FROM order_details;

SELECT COUNT(*) FROM order_details;

-- 2. What is the Date Range of Table?
SELECT * FROM order_details 
ORDER BY order_date;

SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- 3. How many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) FROM order_details;

-- 4. How many items were ordered within this date range?
SELECT COUNT(*) FROM order_details;

-- 5. Which orders had the most number of Items?
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- 6. How many orders had more than 12 items?
SELECT COUNT(*) FROM
(SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;


-- Analyzing Customer Behavior --
-- 1. Combine menu_items and order_details tables in single table
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT * 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;
    
-- 2. What were the least and most ordered items? What categories were they in?
SELECT item_name, category, COUNT(order_details_id) AS num_purchases 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
    
-- 4. View the details of highest spend order. What insights can you gather from menu?
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
    
-- 5. View the details of Top 5 highest spend orders. What insights can you gather from it? 
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;


