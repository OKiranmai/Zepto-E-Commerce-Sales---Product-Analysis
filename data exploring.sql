select * from zepto;
desc zepto;
#check table for reference
select * from zepto
limit 10;
#'NULL' values in any col
select * from zepto 
where name = null or
category = null or
mrp = null or
discountPercent = null or
availableQuantity is null or
discountSellingPrice is null or
weightInGms is null or
outofStock is null or
quantity is null;#(note-the o/p may show as null in all col's that means there r no 'NULL' values)

#count products category list
select distinct category
 from zepto
 order by category;
select distinct count(category) from zepto;    #O/P-3728

#3WAYScheck products category in stock and out of stock
#(1 out of stock and 0 is in stock)
#1.by category
select count(category) from zepto
where outOfStock=1;
select count(category) from zepto
where outOfStock=0;
#2-groupping same as 1
select outOfstock, count(category)
from zepto
group by outOfStock;

#3-using name 
select count(name) from zepto
where outOfStock =0;
select count(name) from zepto where outOfStock =1;
#groupping same as 3
select outOfStock, count(name)
from zepto
group by outOfStock;

#4.using squ_id(this is best as we r knowing specifically which is out of stock)
select outOfStock,count(squ_id)
from zepto
group by outOfStock;

#product names that are present multiple times
select name,count(squ_id) as "Number of SKU's"
from zepto
group by name
having count(squ_id)>1
order by count(squ_id),name desc;