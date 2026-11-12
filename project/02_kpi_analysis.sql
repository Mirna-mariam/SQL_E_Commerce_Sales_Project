-- Total Sales
SELECT
    SUM("Sales_Amount") AS total_sales
FROM sales_clean;
-- Total Profit
SELECT
    SUM("Profit") AS total_profit
FROM sales_clean;

-- Total Orders and Total Customers
SELECT
    COUNT(DISTINCT "Order_ID") AS total_orders,
    COUNT(DISTINCT "Customer_ID") AS total_customers
FROM sales_clean;

--top 10 products by revenue:
SELECT
    "Product_Name",
    SUM("Quantity") AS total_quantity,
    SUM("Sales_Amount") AS total_revenue,
    SUM("Profit") AS total_profit
FROM sales_clean
GROUP BY "Product_Name"
ORDER BY total_revenue DESC
LIMIT 10;

-- Total Products Sold
SELECT
    SUM("Quantity") AS total_quantity_sold
FROM sales_clean;

-- Calculate Average Order Value(AOV) = average sales amount per order.
SELECT
    ROUND(
        SUM("Sales_Amount") /
        NULLIF(COUNT(DISTINCT "Order_ID"), 0),
        2
    ) AS average_order_value
FROM sales_clean;

-- Calculate profit margin
SELECT
    ROUND(
        SUM("Profit") * 100/
        NULLIF(SUM("Sales_Amount"), 0),
        2
    ) AS profit_margin_percentage
FROM sales_clean;