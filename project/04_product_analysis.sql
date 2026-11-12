-- Total Products Sold
SELECT
    SUM("Quantity") AS total_quantity_sold
FROM sales_clean;

-- Sales by product category
SELECT
    "Product_Category",
    SUM("Sales_Amount") AS total_sales
FROM sales_clean
GROUP BY "Product_Category"
ORDER BY total_sales DESC;
-- Top 10 products by revenue
SELECT
    "Product_Name",
    SUM("Quantity") AS total_quantity,
    SUM("Sales_Amount") AS total_revenue,
    SUM("Profit") AS total_profit
FROM sales_clean
GROUP BY "Product_Name"
ORDER BY total_revenue DESC
LIMIT 10;