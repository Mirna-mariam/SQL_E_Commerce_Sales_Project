CREATE TABLE sales_raw (
    "Transaction_ID" VARCHAR(50),
    "Order_ID" VARCHAR(50),
    "Customer_ID" VARCHAR(50),
    "Customer_Name" VARCHAR(100),
    "Customer_Age" NUMERIC,
    "Customer_Gender" VARCHAR(30),
    "Customer_Segment" VARCHAR(50),
    "Order_Date" DATE,
    "Order_Time" TIME,
    "Sales_Channel" VARCHAR(50),
    "Store_ID" VARCHAR(50),
    "Store_Name" VARCHAR(100),
    "Country" VARCHAR(100),
    "Region" VARCHAR(100),
    "City" VARCHAR(100),
    "Product_ID" VARCHAR(50),
    "Product_Name" VARCHAR(150),
    "Product_Category" VARCHAR(100),
    "Product_Subcategory" VARCHAR(100),
    "Quantity" INTEGER,
    "Unit_Price" NUMERIC(12,2),
    "Discount_Percentage" NUMERIC(5,2),
    "Sales_Amount" NUMERIC(12,2),
    "Cost_Amount" NUMERIC(12,2),
    "Profit" NUMERIC(12,2),
    "Payment_Method" VARCHAR(50),
    "Order_Status" VARCHAR(50),
    "Shipping_Method" VARCHAR(50),
    "Delivery_Days" NUMERIC,
    "Return_Flag" VARCHAR(10),
    "Return_Reason" VARCHAR(150),
    "Sales_Representative" VARCHAR(100),
    "Promotion_Code" VARCHAR(50),
    "Customer_Rating" NUMERIC(3,1),
    "Inventory_Level" NUMERIC,
    "Order_Year" INTEGER
);

COPY sales_raw
FROM 'C:\Users\pcd\Downloads\SQL_E_Commerce_Sales_Project\archive (1)\Sales_transactions_2022_2025.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);

SELECT COUNT(*)
FROM sales_raw;