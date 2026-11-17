# RetailNova – Retail Profit Leakage & Sales Performance Analysis

## Project Overview

RetailNova is an end-to-end retail data analytics project focused on identifying profitability challenges and understanding sales performance, discount patterns, product performance, returns and customer behaviour.

The project uses Excel and Microsoft SQL Server to analyse retail transaction data and translate business findings into actionable recommendations. An interactive Power BI dashboard is the next development stage.

## Business Problem

Retail businesses can generate high sales without achieving healthy profits. Excessive discounts, loss-making products, regional performance differences and customer inactivity can affect overall profitability.

This project investigates these areas to identify where profitability is being affected and where management should focus its attention.

## Project Objectives

- Evaluate overall sales, profit and profit margins.
- Compare performance across regions and customer segments.
- Identify profitable and loss-making product categories and subcategories.
- Analyse the relationship between discount levels and profitability.
- Identify high-value, loss-making and inactive customers.
- Understand repeat purchase behaviour.
- Evaluate return patterns and their relationship with profitability.
- Recommend business actions based on the analysis.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data review, preparation and exploratory analysis |
| Microsoft SQL Server | Data validation, querying, joins, aggregations, CTEs and window functions |
| Power BI | Interactive dashboard development (planned) |

## Dataset Overview

The project uses retail transaction data containing information about:

- Orders and order dates
- Customers and customer segments
- Products, categories and subcategories
- Sales, quantities, discounts and profits
- Regions and shipping details
- Returned orders

The analysis uses three related datasets:

- Orders
- People
- Returns

## Key Business Metrics

| Metric | Result |
|---|---:|
| Total order lines | 10,194 |
| Total orders | 5,111 |
| Total customers | 804 |
| Total sales | $2,326,534.35 |
| Total profit | $292,296.81 |
| Overall profit margin | 12.56% |
| Average discount | 15.54% |
| Returned orders | 296 |
| Return rate | 5.79% |

## Key Business Findings

### 1. Regional Performance

- West recorded the highest sales of approximately $739.8K and the highest profit of approximately $110.8K.
- Central had the lowest profit margin at 7.92%.
- Central generated more sales than South but less profit, indicating a need to investigate its product mix, discounting and cost structure.

### 2. Customer Segment Performance

- Consumer contributed the highest sales and total profit.
- Home Office recorded the highest profit margin at 14.02%.
- Consumer had the lowest margin among the three segments at 11.65%.

### 3. Product Category Performance

| Category | Sales | Profit Margin |
|---|---:|---:|
| Technology | $839,893.28 | 17.45% |
| Office Supplies | $731,893.31 | 17.22% |
| Furniture | $754,747.76 | 2.61% |

Technology generated the highest sales and profit margin. Furniture generated substantial sales but had a significantly lower profit margin.

### 4. Discount Analysis

Discount bands above 20% generated negative aggregate profit.

- 0–10% discount band: 28.94% profit margin.
- Above 10–20%: 11.54%.
- Above 20–30%: -10.06%.
- Above 30%: -48.22%.

This suggests that higher discount levels deserve closer profitability monitoring.

### 5. Product Profitability

The analysis identified three loss-making subcategories:

- Tables
- Bookcases
- Supplies

Tables recorded the largest overall loss among these subcategories. These products require further investigation into pricing, discounts and costs.

### 6. Customer Profitability

Customer profitability analysis identified:

- 103 high-value customers with combined profit of $191,700.68.
- 542 medium-value customers with combined profit of $172,141.22.
- 159 loss-making customers with combined losses of $71,545.09.

This segmentation can help businesses prioritise customer retention and profitability reviews.

### 7. Customer Inactivity

Using November 15, 2026, as the analysis date and a six-month inactivity definition:

- 255 customers were classified as inactive.
- 47 high-value inactive customers had generated approximately $67,205.72 in historical profit.
- 32 had been inactive for 6–12 months.
- 12 had been inactive for 1–2 years.
- 3 had been inactive for more than 2 years.

These customers represent potential re-engagement opportunities. Historical profit should not be interpreted as guaranteed recoverable revenue.

### 8. Returns Analysis

- 296 distinct orders were returned.
- The return rate was 5.79%.
- Returned orders had a dataset profit margin of 12.87%, compared with 12.54% for non-returned orders.

The available data does not include refund amounts, return handling costs or reverse logistics expenses. Therefore, the complete financial impact of returns cannot be determined from this dataset alone.

## Business Recommendations

Based on the findings, the following actions are proposed:

1. **Review discount policies:** Introduce additional profitability checks for discounts above 20%.
2. **Investigate regional performance:** Examine the reasons behind Central's comparatively low profit margin.
3. **Review product profitability:** Investigate pricing and costs for loss-making subcategories, particularly Tables and Bookcases.
4. **Improve customer profitability monitoring:** Identify customers and transactions generating repeated losses.
5. **Prioritise customer re-engagement:** Develop targeted campaigns for high-value inactive customers.
6. **Improve return tracking:** Capture return reasons, refund values and associated operational costs.

These are recommendations derived from historical data analysis, not measured improvements from an implemented business intervention.

## SQL Analysis Performed

The SQL work is organised into eight scripts:

| Script | Analysis |
|---|---|
| 01_Data_Validation.sql | Record counts, duplicate checks and missing values |
| 02_KPI_Analysis.sql | Overall business KPIs |
| 03_Performance_Analysis.sql | Regional, segment and category performance |
| 04_Discount_Product_Analysis.sql | Discount bands, subcategories and loss-making products |
| 05_Customer_Analysis.sql | Customer profitability, inactivity and customer ranking |
| 06_Returns_Analysis.sql | Return status and return validation |
| 07_Time_Trend_Analysis.sql | Monthly and annual sales and profit trends |
| 08_Customer_Retention_Analysis.sql | Customer order frequency and high-value inactive customers |

SQL concepts used include:

- SELECT, WHERE and ORDER BY
- GROUP BY and aggregate functions
- CASE statements
- INNER JOIN and LEFT JOIN
- Common Table Expressions (CTEs)
- Subqueries
- Window functions
- DENSE_RANK(), ROW_NUMBER() and aggregate window functions
- Date functions and conditional aggregation

## Repository Structure

```text
RetailNova-Retail-Analytics/
│
├── 01_Data/
│
├── 02_SQL_Scripts/
│   ├── 01_Data_Validation.sql
│   ├── 02_KPI_Analysis.sql
│   ├── 03_Performance_Analysis.sql
│   ├── 04_Discount_Product_Analysis.sql
│   ├── 05_Customer_Analysis.sql
│   ├── 06_Returns_Analysis.sql
│   ├── 07_Time_Trend_Analysis.sql
│   └── 08_Customer_Retention_Analysis.sql
│
├── 03_Excel_Analysis/
│   ├── 01_Original_Workbook/
│   ├── 02_Cleaned_Data/
│   └── 03_Excel_Insights/
│
├── 04_PowerBI_Dashboard/
│   ├── 01_PowerBI_File/
│   ├── 02_Dashboard_Screenshots/
│   └── 03_DAX_Measures/
│
├── 05_Documentation/
│   └── RetailNova_Project_Documentation.docx
│
└── README.md
```

## Project Status

- [x] Data review and validation
- [x] Excel analysis
- [x] SQL-based business analysis
- [x] Customer and product profitability analysis
- [x] Business findings documentation
- [x] GitHub repository setup and file organisation
- [ ] Power BI data modelling
- [ ] DAX measures and KPI development
- [ ] Interactive dashboard development
- [ ] Final project presentation

## Conclusion

RetailNova demonstrates how Excel and SQL Server can be used to investigate retail business performance beyond basic sales reporting.

The analysis identified regional profitability differences, loss-making product categories, discount-related profit patterns and opportunities for customer re-engagement.

The next stage is to build an interactive Power BI dashboard that brings these findings together and makes the results easier for business stakeholders to explore.

---

**Project:** RetailNova – Retail Profit Leakage & Sales Performance Analysis  
**Tools:** Microsoft Excel, Microsoft SQL Server and Power BI (planned)
