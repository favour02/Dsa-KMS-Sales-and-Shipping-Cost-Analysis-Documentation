# KMS Sales and Shipping Cost Analysis Documentation

## Overview

This project analyzes a dataset from the KMS sales records, extracting insights into product sales, regional performance, customer behavior, and shipping costs. The goal is to provide actionable insights that can guide business decisions related to revenue growth, customer retention, and shipping cost optimization.

The analysis includes queries and findings related to the following areas:

1. Product category performance.
2. Regional sales distribution.
3. Customer sales and retention insights.
4. Shipping cost efficiency.

The dataset was processed using SQL queries to answer key business questions. This document outlines the findings and recommendations based on the analysis.

## 1. Product Category with Highest Sales

### Query:

```sql
select top 1 product_category, sum(sales) as Total_Sales 
from kmscase
group by [product_category]
ORDER BY Total_Sales DESC
```

### Insights:

* **Technology** has the highest sales across all product categories, indicating that it is a core driver of revenue for KMS.

## 2. Top 3 and Bottom 3 Regions by Sales

### Top 3 Regions:

```sql
select top 3 Region, SUM(sales) AS TotalSum
from kmscase
group by [region]
order by TotalSum desc
```

* **West**, **Ontario**, and **Prarie** are the top-performing regions in terms of sales.

### Bottom 3 Regions:

```sql
select top 3 Region, SUM(sales) AS TotalSum
from kmscase
group by [region]
order by TotalSum asc
```

* **Nunavut**, **Northwest Territories**, and **Yukon** are the regions with the lowest sales.

## 3. Total Sales of Appliances in Ontario

### Query:

```sql
select region, SUM(sales) AS TotalSum
from kmscase
where "Product_Sub_Category" = 'appliances' and "region" = 'Ontario'
group by [region]
```

### Insights:

* The total sales of **appliances** in **Ontario** are **202,346.84**.

## 4. Improving Revenue from Low-Performing Customers

### Query:

```sql
select top 10 customer_name, sum(sales) as totalsum
from kmscase
group by [customer_name]
order by totalsum asc
```

### Insights:

* Customers with the lowest sales include individuals such as **Jeremy Farry**, **Natalie DeCherney**, and **Nicole Fjeld**.
* **Recommendation**: To increase revenue, KMS should focus on improving customer retention and increasing the frequency of purchases from this group. Re-engaging dormant customers could also be effective.

## 5. Shipping Costs by Method

### Query:

```sql
select top 1 ship_mode, sum(shipping_cost) as totalshipping_cost
from kmscase
group by [ship_mode]
order by totalshipping_cost desc
```

### Insights:

* **Delivery truck** incurs the highest shipping cost, suggesting it may be used more frequently than necessary for certain orders.

## 6. Most Valuable Customers and Their Purchases

### Query:

```sql
select top 5 Customer_name, product_category, sum(sales) as Totalsum
from kmscase
group by [Customer_name],[product_category]
order by totalsum desc
```

### Insights:

* The most valuable customers typically purchase services from the **Technology** product category.

## 7. Highest Sales from Small Business Customers

### Query:

```sql
select top 1 customer_name, sum(sales) as totalSales
from kmscase
where "customer_segment" = 'Small Business'
group by [customer_name]
order by totalsales desc
```

### Insights:

* **Dennis Kane** has the highest sales among **small business** customers.

## 8. Corporate Customer with Most Orders (2009-2012)

### Query:

```sql
select top 1 customer_name, sum(order_quantity) as orderQuantity
from kmscase
where "customer_segment" = 'Corporate'
group by [customer_name]
order by orderQuantity desc
```

### Insights:

* **Roy Skaria** placed the most orders within the years 2009 to 2012, making him a key corporate customer.

## 9. Most Profitable Consumer Customer

### Query:

```sql
select top 1 customer_name, sum(profit) as ProfitSum
from kmscase
where "customer_segment" = 'consumer'
group by [customer_name]
order by ProfitSum desc
```

### Insights:

* **Emily Phan** is the most profitable consumer customer for KMS.

## 10. Customers Who Returned Items

### Query:

```sql
select customer_name,customer_segment,sum(profit) as ProfitSum
from kmscase
where "profit" < '0'
group by [customer_name],[customer_segment]
order by ProfitSum desc
```

### Insights:

* A list of customers who returned items has been identified, providing a basis for improving return policies or addressing potential dissatisfaction.

## 11. Shipping Cost Analysis by Order Priority

### Query:

```sql
SELECT "Ship_Mode", "Order_Priority", SUM(Shipping_cost) AS ShippingCost
FROM kmscase
where "ship_mode" in ('Express air','Delivery truck')
GROUP BY [Ship_Mode], [Order_Priority]
order by ship_mode desc
```

### Insights:

* **Express Air** is the fastest but also the most expensive shipping method, especially for **Low**, **Medium**, and **Critical** order priorities.
* **Delivery Truck** incurs lower shipping costs for **High**, **Critical**, and **Not Specified** orders, making it more cost-effective for these priorities.
* **Recommendation**: Review shipping methods to avoid using **Express Air** unnecessarily for lower-priority orders. **Delivery Truck** is more economical for **Low** and **Medium** priorities.

## Conclusion and Recommendations

Based on the findings, KMS should focus on the following strategic actions:

* **Increase customer retention** for low-sales customers and focus on re-engaging dormant ones.
* **Optimize shipping methods** by using **Delivery Truck** for lower-priority orders to reduce costs while maintaining delivery timelines.
* **Focus on high-value customers** within specific product categories like **Technology** to maximize revenue.

This analysis provides actionable insights to guide KMS towards improved operational efficiency and revenue growth.

---

