# 🍽️ SQL Sales Analysis – Menu & Orders Project

This SQL project analyzes a fictional restaurant's sales performance using two tables: `menu_items` and `order_details`. Inspired by Maven Analytics' beginner SQL case study.

---

## 📌 Objective

Use SQL to answer business questions about menu performance and order behavior, such as:
- Which order had the most items?
- What are the least and most expensive Italian dishes on the menu?
- What is the average dish price wihthin each category?

---

## 🗂️ Files in This Repository

1. `01_menu_items_queries.sql` – queries focused only on menu items
2. `02_order_details_queries.sql` – queries analyzing order details
3. `03_combined_queries.sql` – joins and analysis combining both tables

---

## 🛠️ Tools Used

- MySQL
- SQL (SELECT, JOIN, GROUP BY, ORDER BY, aggregate functions)

---

## 💡 Sample Query

```sql
select item_name, category, count(order_details_id) as num_purchases
from order_details od
left join menu_items mi
on od.item_id = mi.menu_item_id
group by item_name, category
order by num_purchases;


