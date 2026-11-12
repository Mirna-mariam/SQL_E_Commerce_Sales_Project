
-- Total Products Sold
SELECT
    SUM("Quantity") AS total_quantity_sold
FROM sales_clean;

-- Sales and Profit by year
SELECT
    "Order_Year",
    SUM("Sales_Amount") AS total_sales,
    SUM("Profit") AS total_profit
FROM sales_clean
GROUP BY "Order_Year"
ORDER BY "Order_Year";

-- Sales by product category
SELECT
    "Product_Category",
    SUM("Sales_Amount") AS total_sales
FROM sales_clean
GROUP BY "Product_Category"
ORDER BY total_sales DESC;

-- Sales by Month
SELECT
    DATE_TRUNC('month', "Order_Date") AS sales_month,
    SUM("Sales_Amount") AS monthly_sales,
    SUM("Profit") AS monthly_profit
FROM sales_clean
GROUP BY sales_month
ORDER BY sales_month;


/* To validate that the monthly analysis matches your total revenue, run:

SELECT
    SUM(monthly_sales) AS validated_total_sales
FROM (
    SELECT
        DATE_TRUNC('month', "Order_Date") AS sales_month,
        SUM("Sales_Amount") AS monthly_sales
    FROM sales_clean
    GROUP BY sales_month
) AS monthly_data;    

should be same result of total sales
*/

