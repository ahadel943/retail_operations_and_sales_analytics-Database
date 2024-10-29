/*
Here’s the SQL code to answer each of the sample business questions using the 14 tables in the retail database.
Each query uses joins and aggregations to extract meaningful insights.
*/

use retail_store;

-- 1. Top-Selling Products and Their Contribution to Total Revenue
select 
    p.Product_Name,
    sum(si.Quantity) as Total_Quantity_Sold,
    sum(si.Quantity * si.Price) as Total_Revenue,
    (sum(si.Quantity * si.Price) / (select sum(si2.Quantity * si2.Price) from Sale_Items si2) * 100) as Revenue_Contribution_Percent
from 
    Products as p
join 
    Sale_Items as si on p.Product_ID = si.Product_ID
group by 
    p.Product_Name
order by 
    Total_Revenue desc
limit 10;

-- 2. Highest Revenue-Generating Customers and Their Average Order Value
select 
    c.Customer_ID,
    concat(c.First_Name, ' ', c.Last_Name) as Customer_Name,
    count(s.Sale_ID) as Total_Orders,
    sum(s.Total_Amount) as Total_Revenue,
    (sum(s.Total_Amount) / count(s.Sale_ID)) as Average_Order_Value
from 
    Customers as c
join 
    Sales s on c.Customer_ID = s.Customer_ID
group by 
    c.Customer_ID, Customer_Name
order by 
    Total_Revenue desc
limit 10;

-- 3. Average Order Size and Volume by Category
select 
    cat.Category_Name,
    count(si.Sale_ID) as Total_Orders,
    sum(si.Quantity) as Total_Quantity_Sold,
    (sum(si.Quantity) / COUNT(si.Sale_ID)) as Average_Order_Size
from 
    Categories as cat
join 
    Products as p on cat.Category_ID = p.Category_ID
join 
    Sale_Items as si on p.Product_ID = si.Product_ID
group by
    cat.Category_Name
order by
    Total_Orders desc;

-- 4. Effect of Promotions and Discounts on Sales Volume and Revenue
select 
    p.Product_Name,
    dp.Discount_Percentage,
    sum(si.Quantity) as Total_Quantity_Sold,
    sum(si.Quantity * si.Price) as Total_Revenue
from 
    Products as p
join 
    Sale_Items as si on p.Product_ID = si.Product_ID
join 
    Discounts_Promotions as dp on p.Product_ID = dp.Product_ID
group by 
    p.Product_Name, dp.Discount_Percentage
order by 
    Total_Quantity_Sold desc;

-- 5. Products with Highest Return Rates and Common Return Reasons
select 
    p.Product_Name,
    count(r.Return_ID) as Total_Returns,
    (count(r.Return_ID) / (select count(si.Sale_Item_ID) from Sale_Items as si where si.Product_ID = p.Product_ID) * 100) as Return_Rate,
    r.Return_Reason
from 
    Products as p
join 
    returns as r on p.Product_ID = r.Product_ID
group by 
    p.Product_Name, r.Return_Reason
order by 
    Return_Rate desc
limit 10;
