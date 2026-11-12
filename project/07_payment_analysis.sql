-- Sales by Sales Channel
SELECT 
  "Sales_Channel",
  SUM("Sales_Amount") AS total_sales
FROM sales_clean
GROUP BY "Sales_Channel"
ORDER BY total_sales DESC;
-- Payment and order analysis:
/*
- What is the most popular payment method?
- Which sales channel generates the most revenue?
- Which shipping method is most frequently used?
*/
SELECT 
      "Payment_Method","Sales_Channel","Shipping_Method",
      COUNT(*) AS total_transactions,
      SUM("Sales_Amount") AS total_revenue
FROM sales_clean
GROUP BY "Payment_Method","Sales_Channel","Shipping_Method"
ORDER BY total_transactions DESC;
