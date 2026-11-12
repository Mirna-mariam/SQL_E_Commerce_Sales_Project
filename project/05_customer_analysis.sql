-- Revenue by customer segment:
SELECT 
   "Customer_Segment" ,
   COUNT(DISTINCT "Customer_ID") AS total_customers,
   SUM("Sales_Amount") AS total_revenue,
    SUM("Profit") AS total_profit
FROM sales_clean
GROUP BY "Customer_Segment"
ORDER BY total_revenue DESC;

