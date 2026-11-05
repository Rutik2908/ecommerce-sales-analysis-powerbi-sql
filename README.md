# ecommerce-sales-analysis-powerbi-sql
E-commerce sales analysis with Excel, MySQL and Power BI 

# E-Commerce Sales Analysis (Excel, MySQL, Power BI)

Data analytics internship project completed with **Primeor Solutions**.
End-to-end analysis of an e-commerce orders dataset: cleaning in Excel, analysis in SQL, and an interactive Power BI dashboard.

## Project summary

| Item | Detail |
|---|---|
| Dataset | 51,325 raw order lines, 2011 to 2014, 7 markets, 147 countries |
| After cleaning | 51,256 rows |
| Tools | Excel (Power Query, PivotTables), MySQL, Power BI (DAX) |

## Key numbers

- Total Sales: **12,632,373**
- Total Profit: **1,467,499** (11.6% margin)
- Total Orders: **25,026**
- Average Discount: **14.3%**

## Data cleaning (Excel / Power Query)

- Removed 54 exact duplicate rows
- Filled 79 missing customer names with "Unknown"
- Removed 14 rows with missing profit and 1 row with sales of 0
- Converted sales stored as text (e.g. "1,275") to numbers
- Standardized mixed date formats and trimmed extra spaces

## Key insights

- Order lines discounted above 30% lost about **793,000** in total; undiscounted orders earned a 25.3% margin.
- Technology earns about 45% of all profit; Furniture has the lowest margin (7.0%).
- The Tables sub-category is the only loss-making sub-category (about -64,100).
- APAC is the largest market (28.4% of sales); EMEA has the weakest margin (5.4%).
- Sales peak in November and December.

## Repository structure

```
01_Excel/        Excel_Analysis.xlsx   (pivot tables and charts)
02_SQL/          queries.sql           (10 queries + insights)
03_PowerBI/      Dashboard.pbix        (3-page interactive dashboard)
04_Report/       Business_Insights_Report.pdf
data/            Cleaned_Dataset.csv
images/          dashboard screenshots
```

## Power BI dashboard

Three pages: **Executive Overview** (KPI cards), **Sales Analysis** (region, market, monthly trend, category) and **Product & Customer Insights** (top products, top customers, profit by sub-category, segment analysis). Slicers for year, market and category on every page.

![Executive Overview](images/executive_overview.png)
![Sales Analysis](images/sales_analysis.png)
![Product and Customer Insights](images/product_customer_insights.png)

## How to run the SQL

1. Create a database and the `orders` table (definition is in `02_SQL/queries.sql`).
2. Load `data/Cleaned_Dataset.csv` with `LOAD DATA LOCAL INFILE` (UTF-8, skip the header row).
3. Run the queries in `queries.sql`. Expected check: 51,256 rows, sales 12,632,373, profit 1,467,499.

## Author

**Rutik Kumbhar**, Bachelor of Computer Science
[LinkedIn](https://www.linkedin.com/in/rutik-kumbhar-a02841302) | [GitHub](https://github.com/Rutik2908)
