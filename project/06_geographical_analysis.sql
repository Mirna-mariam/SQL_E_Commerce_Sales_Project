-- Sales by Country and City
SELECT 
    "Country","City",
    SUM("Sales_Amount") AS total_revenue,
    SUM("Profit") AS total_profit,
    COUNT(DISTINCT "Customer_ID") AS total_customers

FROM
    sales_clean    
GROUP BY "Country" ,"City" 
ORDER BY total_revenue;