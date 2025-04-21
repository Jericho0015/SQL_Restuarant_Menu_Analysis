# Restaurant Order Analysis
For SQL Restaurant Order Analysis project, I worked with a sample restaurant dataset to analyze customer orders, popular menu items, peak order times, and sales performance. I wrote complex SQL queries to filter, join, and group data from multiple tables, and window functions for deeper insights. The goal was to help the restaurant identify trends and optimize their menu and operations. 

-- Objective 1 --
_Explore the items table:-_
First objective is to better understand the items table by finding the number of rows in the table, the least and most expensive items, and the item prices within each category.

-- Objective 2 --
_Explore the orders table:-_
Second objective is to better understand the orders table by finding the date range, the number of items within each order, and the orders with the highest number of items.

-- Objective 3 --
_Analyze customer behavior:-_
Final objective is to combine the items and orders tables, find the least and most ordered categories, and dive into the details of the highest spend orders.

**SQL QUERIES**

SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *  FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;

SELECT item_name, category, COUNT(order_details_id) AS num_purchases 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category;

