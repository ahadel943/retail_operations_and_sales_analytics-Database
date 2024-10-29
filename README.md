# Retail Operations and Sales Analytics Database

# Introduction

This project provides a comprehensive retail database designed to simulate real-world scenarios for analyzing and managing sales, inventory, customer behavior, and operational performance. Built with a data-driven approach, this database serves as a foundation for practicing business intelligence and data analysis skills, specifically targeting key retail metrics such as customer lifetime value, product profitability, sales trends, inventory optimization, and customer feedback. The goal of this project is to equip data analysts, data scientists, and business professionals with a robust dataset to derive actionable insights and support decision-making in a retail context.

# Project Overview

The Retail Analytics Database consists of **14** interconnected tables capturing critical aspects of a retail business, from customer details and sales transactions to inventory movements and product returns. With primary and foreign key relationships carefully established across these tables, this dataset allows for in-depth analysis of retail operations.

## Tools used
1) **XAMPP** as a database server.
2) **MySql Workbench** for developing SQL code.
3) **Darw.io desktop** for Diagraming.

## Entity Relationship Diagram

## Database Tables

### 1. Customers Table
This table stores information about the customers of the retail store.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Customer_ID | INT(8) | Unique identifier for each customer (Primary Key) |
| First_Name | VARCHAR(50) | Customer's first name |
| Last_Name | VARCHAR(50) | Customer's last name |
| Email | VARCHAR(100) | Customer's email address |
| Phone | VARCHAR(20) | Customer's phone number |
| Address | VARCHAR(255) | Customer's address |
| City | VARCHAR(50) | Customer's city |
| State | VARCHAR(50) | Customer's state or region |
| Postal_Code | VARCHAR(10) | Postal or ZIP code |
| Registration_Date | DATE | Date when the customer first registered |

### Customers Table SQL Code
```sql
create table customers (
	Customer_ID int(8) primary key,
    First_Name varchar(50),
    Last_Name varchar(50),
    Email varchar(100),
    Phone varchar(20),
    Address varchar(255),
    City varchar(50),
    State varchar(50),
    Postal_Code varchar(10),
    Registration_Date date
);
```

### 2. Products Table
This table stores information about the products sold in the store.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Product_ID | INT(8) | Unique identifier for each product (Primary Key) |
| Product_Name | VARCHAR(100) | Name of the product |
| Category_ID | INT(8) | Foreign key linking to the product category |
| Supplier_ID | INT(8) | Foreign key linking to the supplier |
| Price | DECIMAL(10, 2) | Unit price of the product |
| Stock_Level | INT | Current number of units in stock |
| Reorder_Level | INT | Minimum stock level to trigger a reorder |
| Reorder_Quantity | INT | Number of units to reorder |
| Description | TEXT | Description of the product |

### Products Table SQL Code
```sql
create table products (
	Product_ID int(8) primary key,
    Product_Name varchar(100),
    Category_ID int(8), -- FK
    Supplier_ID int(8), -- FK
    Price decimal(10, 2),
    Stock_Level int,
    Reorder_Level int,
    Reorder_Quantity int,
    Description text,
    foreign key (Category_ID) references categories(Category_ID),
    foreign key (Supplier_ID) references suppliers(Supplier_ID)
);
```

### 3. Categories Table
This table contains the categories to which each product belongs (e.g., Electronics, Furniture, Clothing).

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Category_ID | INT(8) | Unique identifier for each category (Primary Key) |
| Category_Name | VARCHAR(100) | Name of the product category |
| Description | TEXT | Description of the category |

### Categories Table SQL Code
```sql
create table categories (
	Category_ID int(8) primary key,
    Category_Name varchar(100),
    Description text
);
```

### 4. Suppliers Table
This table stores information about the suppliers who provide products to the retail store.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Supplier_ID | INT(8) | Unique identifier for each supplier (Primary Key) |
| Supplier_Name | VARCHAR(100) | Name of the supplier |
| Contact_Name | VARCHAR(100) | Supplier contact person's name |
| Contact_Email | VARCHAR(100) | Supplier contact person's email |
| Phone | VARCHAR(20) | Supplier contact person's phone |
| Address | VARCHAR(100) | Supplier's address |
| City | VARCHAR(50) | Supplier's city |
| State | VARCHAR(50) | Supplier's state or region |
| Postal_Code | VARCHAR(10) | Postal or ZIP code |

### Suppliers Table SQL Code
```sql
create table suppliers (
	Supplier_ID int(8) primary key,
    Supplier_Name varchar(100),
    Contact_Name varchar(100),
    Contact_Email varchar(100),
    Phone varchar(20),
    Address varchar(100),
    City varchar(50),
    State varchar(50),
    Postal_Code varchar(10)
);
```

### 5. Sales Table
This table records all the sales transactions that occur in the retail store.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Sale_ID | INT(8) | Unique identifier for each sale (Primary Key) |
| Customer_ID | INT(8) | Foreign key linking to the customer |
| Sale_Date | DATETIME | Date and time of the sale |
| Total_Amount | DECIMAL(10, 2) | Total amount of the sale |
| Payment_Method | VARCHAR(50) | Payment method (e.g., cash, credit card) |

### Sales Table SQL Code
```sql
create table sales (
	Sale_ID int(8) primary key,
    Customer_ID int(8), -- FK
    Sale_Date datetime,
    Total_Amount decimal(10, 2),
    Payment_Method varchar(50),
    foreign key (Customer_ID) references customers(Customer_ID)
);
```

### 6. Sale_Items Table
This table stores information about the customers of the retail store.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Sale_Item_ID | INT(8) | Unique identifier for each sale item (Primary Key) |
| Sale_ID | INT(8) | Foreign key linking to the sales table |
| Product_ID | INT(8) | Foreign key linking to the product |
| Quantity | INT | Number of units sold |
| Price | DECIMAL(10, 2) | Sale price of the product |


### Sale_Items Table SQL Code
```sql
create table sale_items (
	Sale_Item_ID int(8) primary key,
    Sale_ID int(8), -- FK
    Product_ID int(8), -- FK
    Quantity int,
    Price decimal(10, 2),
    foreign key (Sale_ID) references sales(Sale_ID),
    foreign key (Product_ID) references products(Product_ID)
);
```

### 7. Employees Table
This table stores information about the employees working in the retail store.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Employee_ID | INT(8) | Unique identifier for each employee (Primary Key) |
| First_Name | VARCHAR(50) | Employee's first name |
| Last_Name | VARCHAR(50) | Employee's last name |
| Email | VARCHAR(100) | Employee's email |
| Phone | VARCHAR(20) | Employee's phone number |
| Hire_Date | DATE | Date when the employee was hired |
| Job_Title | VARCHAR(50) | Employee's job title (e.g., cashier, manager) |
| Department | VARCHAR(50) | Department where the employee works |

### Employees Table SQL Code
```sql
create table employees (
	Employee_ID int(8) primary key,
    First_Name varchar(50),
    Last_Name varchar(50),
    Email varchar(100),
    Phone varchar(20),
    Hire_Date date,
    Job_Title varchar(50),
    Department varchar(50)
);
```

### 8. Inventory Table
This table keeps track of the inventory movement (items coming in and out of the warehouse).

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Inventory_ID | INT(8) | Unique identifier for each inventory record (Primary Key) |
| Product_ID | INT(8) | Foreign key linking to the product |
| Quantity | INT | Quantity of the product (added or removed) |
| Movement_Type | VARCHAR(10) | Type of inventory movement (In or Out) |
| Movement_Date | DATE | Date of inventory movement |

### Inventory Table SQL Code
```sql
create table inventory (
	Inventory_ID int(8) primary key,
    Product_ID int(8), -- FK
    Quantity int,
    Movement_Type varchar(10),
    Movement_Date date,
    foreign key (Product_ID) references products(Product_ID)
);
```

### 9. Orders Table
This table tracks orders placed with suppliers to replenish stock.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Order_ID | INT(8) | Unique identifier for each order (Primary Key) |
| Supplier_ID | INT(8) | Foreign key linking to the supplier |
| Order_Date | DATE | Date the order was placed |
| Delivery_Date | DATE | Expected delivery date |
| Order_Status | VARCHAR(20) | Status of the order (e.g., Pending, Received) |

### Orders Table SQL Code
```sql
create table orders (
	Order_ID int(8) primary key,
    Supplier_ID int(8), -- FK
    Order_Date date,
    Delivery_Date date,
    Order_Status varchar(20),
    foreign key (Supplier_ID) references suppliers(Supplier_ID)
);
```

### 10. Order_Items Table
This table keeps track of the specific items ordered from suppliers.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Order_Item_ID | INT(8) | Unique identifier for each order item (Primary Key) |
| Order_ID | INT(8) | Foreign key linking to the orders table |
| Product_ID | INT(8) | Foreign key linking to the product |
| Quantity_Ordered | INT | Quantity ordered |
| Quantity_Received | INT | Quantity received |
| Price | DECIMAL(10, 2) | Price per unit from the supplier |

### Order_Items Table SQL Code
```sql
create table order_items (
	Order_Item_ID int(8) primary key,
    Order_ID int(8), -- FK
    Product_ID int(8), -- FK
    Quantity_Ordered int,
    Quantity_Received int,
    Price decimal(10, 2),
    foreign key (Order_ID) references orders(Order_ID),
    foreign key (Product_ID) references products(Product_ID)
);
```

### 11. Returns Table
This table tracks customer returns, including the reasons for the return.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Return_ID | INT(8) | Unique identifier for each return (Primary Key) |
| Sale_ID | INT(8) | Foreign key linking to the sales table |
| Product_ID | INT(8) | Foreign key linking to the product |
| Return_Date | DATE | Date when the return occurred |
| Return_Reason | TEXT | Reason for the return (e.g., defective, wrong item) |

### Returns Table SQL Code
```sql
create table returns (
	Return_ID int(8) primary key,
    Sale_ID int(8), -- FK
    Product_ID int(8), -- FK
    Return_Date date,
    Return_Reason varchar(255),
    foreign key (Sale_ID) references sales(Sale_ID),
    foreign key (Product_ID) references products(Product_ID)
);
```

### 12. Discounts and Promotions Table
This table stores data about any active discounts or promotions in the store.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Promotion_ID | INT(8) | Unique identifier for each promotion (Primary Key) |
| Product_ID | INT(8) | Foreign key linking to the product |
| Discount_Percentage | DECIMAL(5, 2) | Discount percentage applied to the product |
| Start_Date | DATE | Start date of the promotion |
| End_Date | DATE | End date of the promotion |

### Discounts and Promotions Table SQL Code
```sql
create table discounts_promotions (
	Promotion_ID int(8) primary key,
    Product_ID int(8), -- FK
    Discount_Percentage decimal(5, 2),
    Start_Date date,
    End_Date date,
    foreign key (Product_ID) references products(Product_ID)
);
```

### 13. Payment_Methods Table
This table stores the types of payment methods used in the store.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Payment_Method_ID | INT(8) | Unique identifier for the payment method (Primary Key) |
| Payment_Method_Name | VARCHAR(20) | Name of the payment method (e.g., credit card, cash) |

### Payment_Methods Table SQL Code
```sql
create table payment_methods (
	Payment_Method_ID int(8) primary key,
    Payment_Method_Name varchar(50)
);
```

### 14. Feedback/Reviews Table
This table tracks customer feedback or reviews for products.

| Column Name | Date Type | Description  |
| ----------- | --------- | --------- |
| Review_ID | INT(8) | Unique identifier for each review (Primary Key) |
| Product_ID | INT(8) | Foreign key linking to the product |
| Customer_ID | INT(8) | Foreign key linking to the customer |
| Review_Text | TEXT | Text of the customer review |
| Rating | INT | Customer rating (1 to 5 stars) |
| Review_Date | DATE | Date when the review was submitted |

### Feedback/Reviews Table SQL Code
```sql
create table reviews (
	Review_ID int(8) primary key,
    Product_ID int(8), -- FK
    Customer_ID int(8), -- FK
    Review_Text text,
    Rating int check (Rating between 1 and 5),
    Review_Date date,
    foreign key (Product_ID) references products(Product_ID),
    foreign key (Customer_ID) references customers(Customer_ID)
);
```

## Sample Business Questions

1) **What are the top-selling products, and how do they contribute to total revenue ?**

This query sums the quantity and revenue per product and calculates each product’s percentage contribution to total revenue.
```sql
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
```

2) **Which customers generate the highest revenue, and what is their average order value?**

This query calculates each customer’s total revenue, order count, and average order value to identify high-value customers.
```sql
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
```

3) **What is the average order size by category, and which categories have the highest order volume?**

This query calculates total quantity sold per category, total orders, and average order size to understand customer preferences by category.
```sql
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
```

4) **How do promotions and discounts affect product sales volume and revenue?**

This query evaluates the impact of discounts by comparing sales volume and revenue for discounted vs. non-discounted products.
```sql
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
```

5) **Which products have the highest return rates, and what are the common return reasons?**

This query calculates return rates for products and shows the most common reasons for returns, which can help identify potential quality issues.
```sql
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
```

## Conclusion

This Retail Analytics Database project provides a comprehensive foundation for analyzing various aspects of retail operations, from sales performance and customer behavior to inventory and supply chain management. Through the structured dataset of 14 interconnected tables, data analysts and business professionals can gain hands-on experience with key retail metrics and develop actionable insights to drive business decisions.

Feel free to clone the repository, explore the SQL queries, and adapt the database to your own analytical needs. This project is designed as a flexible resource for practicing SQL skills and solving real-world business problems in a retail setting.

**Thank you for exploring this project!** Feedback and suggestions are always welcome—let’s connect and discuss how data-driven insights can transform retail businesses.