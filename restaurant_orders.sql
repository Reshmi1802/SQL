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


