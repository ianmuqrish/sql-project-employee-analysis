-- 1. Combine the menu_items and order_details tables into a single table
SELECT*
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

-- 2. What are the least and most ordered items, and what categories are they from?
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases;


-- 3. What are the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spent
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5;

-- 4. View the details for the highest spend order. What insights can you gather?
SELECT category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

-- Insights
-- Order 440 is the highest-spending order and contains items from 4 categories. The customer ordered the most items from the Italian category, suggesting a strong preference.
-- This behavior may reflect a group order or a high-value customer. Consider offering discounts or bundles for Italian dishes to encourage repeat purchases.

-- 5. View details for the top 5 highest spend orders, and what patterns emerge?
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;

-- Insights
-- The top 5 highest-spending orders include a mix of multiple categories, suggesting customers tend to order from more than one cuisine in large orders.
-- Asian and Italian dishes appear most frequently, showing they are popular choices in high-value orders.
-- Most of the orders include 3 or more items, which may indicate group dining or sharing behavior.
-- Cross-category ordering (e.g., Italian + Mexican) is common, suggesting that menu variety is valuable to customers placing larger orders.