USE restaurant_db
select * from menu_items
-- number of items in the menu
select count(*) as no_items from menu_items
-- most expensive item
select * from menu_items
order by price desc;
-- number of Italian dishes 
select count(category) as number_of from menu_items
where category = 'Italian'
-- most expensive italian dish
select * from menu_items
where category = 'Italian'
order by price desc;
-- how many dishes in each category
select category, count(item_name) as number_of_dishes from menu_items
group by category;
-- average dish price within each category
select category, avg(price) as avg from menu_items
group by category


select * from order_details;
-- date range of the table
select min(order_date) as min_date, max(order_date) as max_date from order_details;
-- how many orders made within this date range
select count(distinct order_id) as num from order_details;
-- how many dishes ordered in this date range
select count(*) from order_details;
-- which order had the most number of items
select order_id, count(item_id) as num_items from order_details
group by order_id;
-- orders with the most number of items
select order_id, count(item_id) as num_items from order_details
group by order_id
order by num_items desc;
-- how many order had more than 12 items
select count(*) from 
(select order_id,count(item_id) as num_items from order_details
group by order_id
having num_items > 12) as num_orders



select * from menu_items;
select * from order_details;
-- combining both tables into a single table
select * from order_details od left join menu_items mi
         on od.item_id = mi.menu_item_id;
-- least and most ordered items? what category?
select item_name, category, count(order_details_id) as num_buys from order_details od left join menu_items mi
         on od.item_id = mi.menu_item_id
         group by item_name, category
         order by num_buys;
-- top 5 orders that spent the most money
select order_id, sum(price) as money_spent from order_details od left join menu_items mi
         on od.item_id = mi.menu_item_id
         group by order_id
         order by money_spent desc
         limit 5;
-- details of highest spent order
select category, count(item_id) as num_items from order_details od left join menu_items mi
         on od.item_id = mi.menu_item_id
         where order_id = 440
         group by category;
-- details of top 5 highest spent order
select category, count(item_id) as num_items from order_details od left join menu_items mi
         on od.item_id = mi.menu_item_id
         where order_id in (440, 2075, 1957, 330, 2675)
         group by category;
-- most ordered category of dish
select category, count(item_id) as num_items from order_details od left join menu_items mi
         on od.item_id = mi.menu_item_id
         group by category
         order by num_items desc;
-- most revenue generating dish by category
select category, sum(price) as total_rev from order_details od left join menu_items mi
         on od.item_id = mi.menu_item_id
         group by category
         order by total_rev desc;
-- Revenue by each dish
select item_id, item_name, category, sum(price) as total_rev from order_details od left join menu_items mi
         on od.item_id = mi.menu_item_id
         group by item_id
         order by total_rev desc;


