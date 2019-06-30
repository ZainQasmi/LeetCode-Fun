
# All products day vis, that were ordered more than once
SELECT T1.Product_Id,T1.Order_Day,count(Order_Day) AS NumberOfOrderedInaDay
FROM MOCK_DATA AS T1
GROUP BY T1.Product_Id,T1.Order_Day;
# HAVING count(Order_Day) > 1;

# all products total sales on 01-jul-11 and 02-jul-11 adjacent to each other
select Product_Id,
SUM(IF(Order_Day = '2018-07-01', QUANTITY*PRICE, 0)) AS 'Sales on 01-JUL-11',
SUM(IF(Order_Day = '2018-07-02', QUANTITY*PRICE, 0)) AS 'Sales on 02-JUL-11'
From MOCK_DATA
Group by product_id;
       
# highest sold products (QTY*PRICE) on both days
Select a.order_day, b.product_id, a.sales 
    from  
          (select order_day, max(quantity*price) as sales
           from MOCK_DATA
           group by order_day) a
    inner join
         (select order_day, product_id, quantity*price as sales
          from MOCK_DATA) b
    on a.order_day = b.order_day and a.sales = b.sales;
    
# highest sold Products (Qty* Price) on both days without IDs
select order_day, max(quantity*price) as sales
from MOCK_DATA
group by order_day;

select PRODUCT_ID,count(*) from MOCK_DATA
group by PRODUCT_ID;
# having count(*)>1;
       

       