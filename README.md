# Sales Data Analysis using PostgreSQL

## Overview

This project demonstrates end-to-end sales analytics using PostgreSQL. The dataset contains customer transaction records including demographics, product categories, and purchase amounts.

The objective is to clean the dataset, calculate key business KPIs, and extract insights that can support strategic decision-making. The analysis is designed to simulate a real-world analytics workflow used by data analysts in business environments.

---

## Dataset Features

The dataset includes:

- Customer ID and name
- Gender and age demographics
- Marital status
- State and geographic zone
- Occupation
- Product category
- Number of orders
- Purchase amount

Each row represents a transaction-level record.

---

## Data Cleaning

Steps performed:

- Dropped unused columns
- Removed rows with missing revenue values
- Standardized numeric types
- Prepared dataset for aggregation

This ensures analytical accuracy and consistency.

---

## Key Metrics Generated

The project calculates core executive KPIs:

- Total revenue
- Total orders
- Total customers
- Average order value
- Revenue per customer

These metrics form the foundation of business dashboards.

---

## Analytical Sections

### Customer Demographics

- Revenue by gender
- Revenue by age group
- Spending behavior by marital status
- Top customers by lifetime value

Purpose: Identify high-value customer segments.

---

### Geographic Insights

- Revenue by state
- Revenue by zone
- Regional contribution percentages

Purpose: Detect high-performing markets.

---

### Product Performance

- Revenue by product category
- Order volume by category
- Average spend per category

Purpose: Understand product profitability.

---

### Occupation-Based Analysis

- Revenue by occupation
- Average customer spending patterns

Purpose: Support targeted marketing strategies.

---

### Advanced Analytics

The project includes window-function analytics:

- Customer contribution to total revenue
- Revenue ranking
- Running cumulative totals

These techniques simulate advanced business intelligence reporting.

---

## Dashboard Use Case

This SQL analysis is designed to feed into visualization tools such as:

- Power BI
- Tableau
- Excel dashboards

Suggested dashboard layout:

Top KPIs → Revenue / Orders / Customers / Avg Order Value  
Customer charts → Gender / Age segmentation  
Geographic charts → State / Zone revenue  
Product charts → Category performance  
Top customers table

---

## Skills Demonstrated

- SQL aggregation
- Data cleaning
- GROUP BY analytics
- Window functions
- Business KPI modeling
- Segmentation analysis
- Analytical storytelling

---

## Tools Used

- PostgreSQL
- SQL
- CSV data processing

---

## Business Impact

This project shows how raw transactional data can be converted into actionable insights:

- Identify profitable customer segments
- Detect high-performing regions
- Optimize product strategy
- Support executive decision-making

---

## Author

Vinayak Shukla  
MBA Business Analytics  
