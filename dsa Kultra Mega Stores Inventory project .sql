select * from kmscase
----1. Which product category had the highest sales?
select top 1 product_category, sum(sales) as Total_Sales 
from kmscase
group by [product_category]
ORDER BY Total_Sales DESC
--Technology has the hihest sales

----2. What are the Top 3 and Bottom 3 regions in terms of sales?
----Top 3
select top 3 Region, SUM(sales) AS TotalSum
From kmscase
group by [region]
order by TotalSum desc
--the top region are West, Ontario, Prarie

----Bottom 3
select top 3 Region, SUM(sales) AS TotalSum
From kmscase
group by [region]
order by TotalSum asc
---The bottom region are Nunavut, Northwest Territories, Yukon

----3. What were the total sales of appliances in Ontario?
select region, SUM(sales) AS TotalSum
From kmscase
where "Product_Sub_Category" = 'appliances' and "region" = 'Ontario'
group by [region]
---The total sales is 202346.839630127

----4. Advise the management of KMS on what to do to increase the revenue from the bottom 
select top 10 customer_name, sum(sales) as totalsum
from kmscase
group by [customer_name]
order by totalsum asc
---customer with low sales
select * from kmscase 
where "customer_name" in (
'Jeremy Farry',
'Natalie DeCherney',
'Nicole Fjeld',
'Katrina Edelman',
'Dorothy Dickinson',
'Christine Kargatis',
'Eric Murdock',
'Chris McAfee',
'Rick Huthwaite',
'Mark Hamilton')
order by customer_name asc
/*from my analysis they are not frequent customers,it suggests 
that the company may be struggling with customer retention and 
engagement for this group. To increase their revenue, KMS can 
focus on improving customer retention, increasing purchase frequency, 
and re-engaging dormant customers.*/


--5. KMS incurred the most shipping cost using which shipping method?
select top 1 ship_mode, sum(shipping_cost) as totalshipping_cost
from kmscase
group by [ship_mode]
order by totalshipping_cost desc
--The delivery truck incurred  the most shipping cost

--6. Who are the most valuable customers, and what products or services do they typically purchase? 
select top 5 Customer_name, product_category, sum(sales) as Totalsum
from kmscase
group by [Customer_name],[product_category]
order by totalsum desc
--Top 5  customers do puchase services from technology product-category

--7 Which small business customer had the highest sales? 
select top 1 customer_name, sum(sales) as totalSales
from kmscase
where "customer_segment" = 'Small Business'
group by [customer_name]
order by totalsales desc
---Dennis Kane has the highest sales as a small business customer


 ---8 Which Corporate Customer placed the most number of orders in 2009 – 2012?
select top 1 customer_name, sum(order_quantity) as orderQuantity
from kmscase
where "customer_segment" = 'Corporate'
group by [customer_name]
order by orderQuantity desc
--Roy skaria is a corporate customer with the highest order quantity

---9. Which consumer customer was the most profitable one?
select top 1 customer_name, sum(profit) as ProfitSum
from kmscase
where "customer_segment" = 'consumer'
group by [customer_name]
order by ProfitSum desc
---Emily Phan is consumer customer with the highest profit


--10. Which customer returned items, and what segment do they belong to? 
select customer_name,customer_segment,sum(profit) as ProfitSum
from kmscase
where "profit" < '0'
group by [customer_name],[customer_segment]
order by ProfitSum desc
-- list of customer who returned items

/* the delivery truck is the most economical but the slowest shipping method and 
Express Air is the fastest but the most expensive one, do you think the company 
appropriately spent shipping costs based on the Order Priority? Explain your answer*/
SELECT "Ship_Mode", "Order_Priority", SUM(Shipping_cost) AS ShippingCost
FROM kmscase
where "ship_mode" in ('Express air','Delivery truck')
GROUP BY [Ship_Mode], [Order_Priority]
order by ship_mode desc
/*Express Air is the fastest shipping method but also appears to have 
higher shipping costs across the board, especially for Low, Medium, and
Critical order priorities.
Delivery Truck has lower shipping costs for High, Critical, and Not Specified
order priorities but higher costs for Low and Medium priorities.
Review shipping methods to ensure Express Air is not being used unnecessarily 
for lower-priority orders, as it incurs higher costs.

Switch to Delivery Truck for Low and Medium priority orders, as it is significantly cheaper while still providing an acceptable delivery time.







