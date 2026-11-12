-- Sales by discount level analysis:
/*
- Do higher discounts generate more sales?
- Which promotion codes generate the most revenue?
- Which discount levels generate the highest profit?
- Are heavily discounted products less profitable?
*/
SELECT
    CASE
        WHEN "Discount_Percentage" = 0 THEN 'No Discount'
        WHEN "Discount_Percentage" <= 10 THEN '1-10%'
        WHEN "Discount_Percentage" <= 20 THEN '11-20%'
        ELSE 'Above 20%'
    END AS discount_level,

    SUM("Sales_Amount") AS total_sales,
    SUM("Profit") AS total_profit,
    COUNT(*) AS total_transactions

FROM sales_clean
GROUP BY discount_level
ORDER BY total_sales DESC;

-- Sales by promotion code
SELECT 
  COALESCE(
        NULLIF(TRIM("Promotion_Code"), ''),
        'No Promotion'
    ) AS promotion,
    
    SUM("Sales_Amount") AS total_sales,
    SUM("Profit") AS total_profit,
    COUNT(*) AS total_transactions 
FROM sales_clean
GROUP BY promotion
ORDER BY total_sales DESC ;  