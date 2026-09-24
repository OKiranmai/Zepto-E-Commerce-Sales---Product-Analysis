Select * from zepto
limit 100;
-- Q1. Find the top 10 best-value products based on the discount percentage.
Select distinct name,mrp,discountPercent
from zepto
order by discountPercent desc
limit 10;
-- Q2. What are the products with High MRP but Out of Stock?
select distinct name,mrp
from zepto
where mrp>500.00 and outOfStock = 0
order by mrp desc;
-- Q3. Calculate Estimated Revenue for each category.
select category,
sum(discountSellingPrice*availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;
-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select distinct name,mrp,discountPercent
from zepto 
where mrp>500 and discountPercent < 10
order by mrp desc,discountPercent asc;
-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category,
avg(discountPercent) as avg_discountpercent
from zepto
group by category
order by avg_discountpercent desc
limit 5;
-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name,mrp,discountSellingPrice,weightInGms,
round(discountSellingPrice/weightInGms,2) as PricePerGm
from zepto
where weightInGms>=100
order by PricePerGm ;
-- Q7. Group the products into categories like Low, Medium, Bulk.
select distinct name,weightInGms,
case when weightInGms<1000 then 'Low'
     when weightInGms<2000 then 'Medium'
	else 'bulk'
end as weight_category
from zepto;
-- Q8.what is the total inventory weight_in_gms per category
select category,
sum(weightInGms * availableQuantity) as total_inventory_weight
from zepto
group by category
order by total_inventory_weight desc;