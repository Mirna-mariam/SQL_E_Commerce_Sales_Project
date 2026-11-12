-- Check the number of records
SELECT COUNT(*)
FROM sales_raw;

-- Check duplicate transaction IDs
SELECT
    "Transaction_ID",
    COUNT(*) AS duplicate_count
FROM sales_raw
GROUP BY "Transaction_ID"
HAVING COUNT(*) > 1;

-- Check missing customer names
SELECT COUNT(*)
FROM sales_raw
WHERE "Customer_Name" IS NULL;

-- Remove duplicates
CREATE TABLE sales_clean AS
SELECT DISTINCT *
FROM sales_raw;

SELECT* 
FROM sales_clean;

-- Check the Order ID
SELECT "Order_ID", COUNT(*)
FROM sales_clean 
GROUP BY "Order_ID"
HAVING count(*)>1
-- To check if they are duplicates or having different informations
SELECT *
FROM sales_clean
WHERE "Order_ID" = 'O0107075';

-- Standardize text values
UPDATE sales_clean
SET "Customer_Gender" =
    CASE
        WHEN LOWER(TRIM("Customer_Gender")) = 'male'
            THEN 'Male'

        WHEN LOWER(TRIM("Customer_Gender")) = 'female'
            THEN 'Female'

        WHEN LOWER(REPLACE(
             TRIM("Customer_Gender"), ' ', '-'
        )) = 'non-binary'
            THEN 'Non-binary'

        ELSE TRIM("Customer_Gender")
    END;

UPDATE sales_clean
SET "Order_Status" =
    INITCAP(LOWER(TRIM("Order_Status")));

UPDATE sales_clean
SET "Payment_Method"=
 INITCAP(LOWER(TRIM("Payment_Method")));

SELECT
    COUNT(*) FILTER (
        WHERE "Customer_Name" IS NULL
    ) AS missing_customer_names,

    COUNT(*) FILTER (
        WHERE "Customer_Age" IS NULL
    ) AS missing_customer_ages,

    COUNT(*) FILTER (
        WHERE "Product_Name" IS NULL
    ) AS missing_product_names,

    COUNT(*) FILTER (
        WHERE "Payment_Method" IS NULL
    ) AS missing_payment_methods

FROM sales_clean; 

SELECT *
FROM sales_clean
WHERE "Customer_Age" < 18
   OR "Customer_Age" > 100;

SELECT *
FROM sales_clean
WHERE "Discount_Percentage" < 0
   OR "Discount_Percentage" > 100;  

UPDATE sales_clean
SET "Discount_Percentage"   = NULL 
WHERE "Discount_Percentage" > 100;

SELECT *
FROM sales_clean
WHERE "Quantity" < 0;   

UPDATE sales_clean
SET "Quantity" = ABS("Quantity")
WHERE "Quantity" < 0;

SELECT *
FROM sales_clean
WHERE "Sales_Amount" < 0;

SELECT COUNT(*) AS total_rows
FROM sales_clean;

SELECT COUNT(*) FILTER (
 WHERE "Order_ID" IS NULL
) AS  missing_Order_ID 
FROM sales_clean

SELECT COUNT(*)
FROM sales_clean
WHERE "Unit_Price" < 0