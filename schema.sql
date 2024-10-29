/*
A big retail store database would typically contain multiple tables to manage various aspects of the business,
such as inventory management, sales, customers, suppliers, and employees. 
Below are some common tables you might find in such a database, along with their descriptions and potential attributes.
*/

create database if not exists retail_store;
use retail_store;

-- 1.Customers Table
-- This table stores information about the customers of the retail store.
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

SET SQL_SAFE_UPDATES = 0; 
select * from customers;

-- 2. Products Table
-- This table stores information about the products sold in the store.
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
select * from products;

-- 3. Categories Table
-- This table contains the categories to which each product belongs (e.g., Electronics, Furniture, Clothing).
create table categories (
	Category_ID int(8) primary key,
    Category_Name varchar(100),
    Description text
);

select count(*) from categories;

-- 4. Suppliers Table
-- This table stores information about the suppliers who provide products to the retail store.
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

select * from suppliers;

-- 5. Sales Table
-- This table records all the sales transactions that occur in the retail store.
create table sales (
	Sale_ID int(8) primary key,
    Customer_ID int(8), -- FK
    Sale_Date datetime,
    Total_Amount decimal(10, 2),
    Payment_Method varchar(50),
    foreign key (Customer_ID) references customers(Customer_ID)
);

select count(*) from sales;

-- 6. Sale_Items Table
-- This table records the individual items that were part of each sale.
create table sale_items (
	Sale_Item_ID int(8) primary key,
    Sale_ID int(8), -- FK
    Product_ID int(8), -- FK
    Quantity int,
    Price decimal(10, 2),
    foreign key (Sale_ID) references sales(Sale_ID),
    foreign key (Product_ID) references products(Product_ID)
);

select count(*) from sale_items;

-- 7. Employees Table
-- This table stores information about the employees working in the retail store.
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
select count(*) from employees;

-- 8. Inventory Table
-- This table keeps track of the inventory movement (items coming in and out of the warehouse).
create table inventory (
	Inventory_ID int(8) primary key,
    Product_ID int(8), -- FK
    Quantity int,
    Movement_Type varchar(10),
    Movement_Date date,
    foreign key (Product_ID) references products(Product_ID)
);
select count(*) from inventory;

-- 9. Orders Table
-- This table tracks orders placed with suppliers to replenish stock.
create table orders (
	Order_ID int(8) primary key,
    Supplier_ID int(8), -- FK
    Order_Date date,
    Delivery_Date date,
    Order_Status varchar(20),
    foreign key (Supplier_ID) references suppliers(Supplier_ID)
);
select count(*) from orders;

-- 10. Order_Items Table
-- This table keeps track of the specific items ordered from suppliers.
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
select count(*) from order_items;

-- 11. Returns Table
-- This table tracks customer returns, including the reasons for the return.
create table returns (
	Return_ID int(8) primary key,
    Sale_ID int(8), -- FK
    Product_ID int(8), -- FK
    Return_Date date,
    Return_Reason varchar(255),
    foreign key (Sale_ID) references sales(Sale_ID),
    foreign key (Product_ID) references products(Product_ID)
);
select count(*) from returns;

-- 12. Discounts and Promotions Table
-- This table stores data about any active discounts or promotions in the store.
create table discounts_promotions (
	Promotion_ID int(8) primary key,
    Product_ID int(8), -- FK
    Discount_Percentage decimal(5, 2),
    Start_Date date,
    End_Date date,
    foreign key (Product_ID) references products(Product_ID)
);
select count(*) from discounts_promotions;

-- 13. Payment_Methods Table
-- This table stores the types of payment methods used in the store.
create table payment_methods (
	Payment_Method_ID int(8) primary key,
    Payment_Method_Name varchar(50)
);
select count(*) from payment_methods;

-- 14. Feedback/Reviews Table
-- This table tracks customer feedback or reviews for products.
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
select count(*) from reviews;

show tables;
