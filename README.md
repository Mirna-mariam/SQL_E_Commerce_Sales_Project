# Sales Data Analysis Using SQL

## Project Overview
This project focuses on analyzing sales transaction data from 2022 to 2025 using PostgreSQL. The goal is to explore sales performance, identify business trends, understand customer behavior, and generate insights that can support better business decisions.

## Tools & Technologies
- **PostgreSQL:** Data cleaning, querying, and analysis.
- **VS Code:** Writing and executing SQL queries.
- **pgAdmin:** Database management.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

## Dataset
**File:** `Sales_transactions_2022_2025.csv`

The dataset contains sales transaction information, including:
- Customer details (age, gender, customer segment).
- Product information (name, category, quantity, price).
- Sales information (sales amount, cost, profit, discount).
- Order information (date, status, shipping method).
- Geographic information (country, region, city).
- Payment methods and promotion codes.

## Database Setup and Data Import

### 1. Create the Raw Table
Created a PostgreSQL table named `sales_raw` with 36 columns to store the sales transaction dataset.

Defined appropriate data types for each column, including:
- `VARCHAR` for text information.
- `INTEGER` for whole numbers.
- `NUMERIC` for prices, sales, profit, and other decimal values.
- `DATE` and `TIME` for order dates and times.

### 2. Import the CSV Dataset
Imported the CSV file into PostgreSQL using the `COPY` command.

Import settings:
- **FORMAT CSV:** Specifies that the file is in CSV format.
- **HEADER TRUE:** Indicates that the first row contains column names.
- **DELIMITER ',':** Specifies that commas separate the values.

### 3. Verify the Imported Data
Used the following query to check the number of imported rows:

```sql
SELECT COUNT(*)
FROM sales_raw;
```
This query counts all records in the raw table and helps verify that the data was imported successfully.


## Project Steps

### 1. Data Import
- Created a PostgreSQL database.
- Imported the CSV file into the `sales_raw` table.

### 2. Data Cleaning
- Created a cleaned table named `sales_clean`.
- Removed completely identical duplicate rows using `SELECT DISTINCT`.
- Used the cleaned table for further analysis.

### 3. Exploratory Data Analysis
Explored the dataset to understand its structure, columns, and available information.

### 4. Key Performance Indicators (KPIs)
Calculated important business metrics:
- Total Revenue
- Total Profit
- Profit Margin
- Total Orders
- Average Order Value (AOV)

### 5. Sales Analysis
Analyzed sales performance by month, year, and promotion code to understand revenue and profit patterns.

## Key Results

| KPI | Result |
|---|---:|
| Total Revenue | 8,234,090.60 |
| Total Profit | 1,645,439.40 |
| Profit Margin | 19.98% |
| Total Orders | 14,541 |
| Average Order Value | 566.27 |

## SQL Analysis Questions
The project explores business questions such as:

1. What is the total revenue and profit?
2. How do sales change over time?
3. Which products and categories generate the highest revenue?
4. Which customer segments contribute the most sales?
5. Which regions generate the highest profit?
6. Which payment methods are most commonly used?
7. Which promotion codes generate the highest sales and profit?
8. What are the most common reasons for product returns?

## Project Structure

```text
sql_project/
│
├── Sales_transactions_2022_2025.csv
├── postgres.session.sql
├── 01_data_cleaning.sql
├── 02_kpi_analysis.sql
├── 03_sales_analysis.sql
├── 04_product_analysis.sql
├── 05_customer_analysis.sql
├── 06_geographical_analysis.sql
├── 07_payment_analysis.sql
├── 08_returns_analysis.sql
├── 09_discount_analysis.sql
└── README.md
```

## Conclusion
This project demonstrates how SQL can be used to clean, explore, and analyze sales data. By calculating KPIs and investigating business questions, the analysis helps identify sales trends, profitable products, customer patterns, and opportunities for business improvement.

