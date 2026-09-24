select * from zepto
limit 10;
#data cleaning
#products and there price
select name,mrp
from zepto
group by  name,mrp;
#products with 0 price 
select * from zepto
where mrp = 0 or discountSellingPrice=0;

#safe update off 
SET SQL_SAFE_UPDATES = 0;

#delete row with mrp 0,as no product should have 0 price
delete from zepto
where mrp=0;

#convert paisa into rupees
update zepto
set mrp = mrp/100.0,
discountSellingPrice = discountSellingPrice/100.0;

SET SQL_SAFE_UPDATES = 0;