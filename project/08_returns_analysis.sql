-- Returns analysis:
/*
- What is the return rate?
- What are the most common return reasons?
- Which products have the highest number of returns?
- Which product categories have the highest return rates?
*/
SELECT
    "Return_Reason",
    COUNT(*) AS total_returns
FROM sales_clean
--WHERE LOWER(TRIM("Return_Flag")) IN ('yes', 'true', '1')
GROUP BY "Return_Reason"
ORDER BY total_returns DESC;