create database company;

use company;
select*from sales;

select count(*) from sales;

-- Q1: Find all orders shipped via 'Economy' mode with a total amount greater than 25000Rs

select *from sales
where ship_mode = 'Economy' and total_amount > 25000;

-- Q2: Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.

select * from sales
where category = 'Technology' and country = 'Ireland' and order_date > '2020-01-01';

-- Q3 : List the top 10 most profitable sales transactions in descending order.
select * from sales
order by unit_profit desc
limit 10 , 20; -- for skip 10 records and shows the next 20 records

-- Q4: Find all customers whose name starts with 'J and ends with 'n'
select order_id, 
customer_name from sales
where customer_name like 'J%n';

-- Q5: Retrieve all product names that contains 'Acco' anywhere in the name
select order_id, 
product_name from sales
where product_name like '%Acco%';

-- Q6:  Get the top 5 cities with the highest total sales
select city, sum(total_amount) as total_sales
from sales
group by city
order by total_sales desc
limit 5;


-- Q7: Display the second set of 10 records for customer_name and Total_amount in decresing order
select customer_name, total_amount
from sales
order by total_amount desc
limit 10,10;

-- Q8: Find total_revenue, avg unit cost, and total number of orders
select count(order_id) as total_num_orders, 
sum(total_amount) as `total revenue`,
avg(unit_cost) as avg_unit_cost
from sales;

-- Q9 count unique number of regions
select count(distinct(region)) as unique_regions
from sales;

-- Q10: Find the number of orders placed by each customer
select customer_name, 
count(order_id) as orders
from sales
group by customer_name
order by orders desc;

-- Q11: Rank 5 products based on total sales using RANK()
select product_name, sum(total_amount) as total_sales,
rank() over(order by sum(total_amount) desc) as Sales_Rank
from sales
group by product_name
order by total_sales desc
limit 5;
