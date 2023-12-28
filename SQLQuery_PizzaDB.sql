select * from [dbo].[pizza_sales]
--Total pizza price--
select sum(total_price) as Total_Revenue 
from  [dbo].[pizza_sales]
---Average sales--
select sum(total_price) /count(distinct order_id) as  Avrg_order 
from [dbo].[pizza_sales]
--Total pizza sold--
select sum(quantity) as Total_pizza_sold 
from [dbo].[pizza_sales]
--Total order--
select count(distinct order_id) as Total_order
from [dbo].[pizza_sales]
---Average pizza per order--
select cast(cast(sum(quantity) as decimal(10,2))
/
cast(count(distinct order_id) as decimal(10,2)) 
as decimal(10,2)) as Per_order_pizza
from [dbo].[pizza_sales]
--Weekly days order--
select datename( DW, order_date) as Order_day, count(distinct order_id) as Order_number
from [dbo].[pizza_sales]
group by datename(DW,order_date)
---- Monthly pizza saleing--
select datename( MONTH, Order_date) as order_month, count(distinct order_id) as order_number
from  [dbo].[pizza_sales]
group by datename(Month, order_date)
order by order_number desc
 --Category  base pizza sale percentage--
 select pizza_category,sum(total_price) as Total_sale, cast(sum(total_price)*100
 /
 (select  sum( total_price) from [dbo].[pizza_sales]) as decimal(10,2) )as Total_percentagre 
 from [dbo].[pizza_sales]
 group by pizza_category
 order by Total_percentagre desc

 --Size base pizza sale percentage--
 select pizza_size,sum(total_price) as Total_sale,cast(sum(total_price) *100
 /
 (select  sum( total_price)   from [dbo].[pizza_sales]) as decimal(10,2))as Total_percentagre 
 from [dbo].[pizza_sales]
 group by pizza_size
 order by Total_percentagre desc
 --Top 5 sales pizza--
 select top 5 pizza_name, sum(total_price) as Total_revenue 
 from [dbo].[pizza_sales]
 group by pizza_name
 order by Total_revenue desc
 --Bottom 5 sales pizza--
 select top 5 pizza_name, sum(total_price) as Total_revenue 
 from [dbo].[pizza_sales]
 group by pizza_name
 order by Total_revenue Asc
 --Top 5 sales by order number--
 select top 5 pizza_name, count(distinct order_id) as Total_Quantity 
 from [dbo].[pizza_sales]
 group by pizza_name
 order by Total_Quantity Desc
  --Bottom 5 sales by order number--
 select top 5 pizza_name, count(distinct order_id) as Total_Quantity 
 from [dbo].[pizza_sales]
 group by pizza_name
 order by Total_Quantity asc

