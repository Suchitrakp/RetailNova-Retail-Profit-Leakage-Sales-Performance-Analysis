# RetailNova – Retail Profit Leakage & Sales Performance Analysis

## Project Overview

RetailNova is a retail analytics project focused on understanding sales performance, profitability, discount patterns, product performance, returns and customer behaviour.

The objective is to identify areas where sales are not translating into healthy profits and provide data-driven recommendations for business improvement.

## Business Objectives

- Analyse overall sales, profit and profit margins.
- Compare performance across regions, customer segments and product categories.
- Understand the relationship between discount levels and profitability.
- Identify loss-making products and customers.
- Analyse repeat purchases and customer inactivity.
- Evaluate return patterns and recommend improvements.

## Tools & Technologies

- Microsoft Excel – Data review and preparation
- Microsoft SQL Server – Data analysis and querying
- Power BI – Interactive dashboard (planned)

## Key Business Findings

| Metric | Result |
|---|---:|
| Total order lines | 10,194 |
| Total orders | 5,111 |
| Total customers | 804 |
| Total sales | $2,326,534.35 |
| Total profit | $292,296.81 |
| Profit margin | 12.56% |
| Return rate | 5.79% |

### Major Insights

1. **Regional performance:** West recorded the highest sales and profit, while Central had the lowest profit margin at 7.92%.
2. **Category performance:** Technology achieved the highest profit margin at 17.45%. Furniture had a significantly lower margin of 2.61%.
3. **Discount analysis:** Discount bands above 20% generated negative profit overall.
4. **Product analysis:** Tables, Bookcases and Supplies were loss-making subcategories.
5. **Customer analysis:** 159 customers generated a combined loss of $71,545.09.
6. **Customer inactivity:** Identified 47 high-value inactive customers with combined historical profit of $67,205.72.
7. **Returns:** The dataset recorded 296 returned orders, representing a 5.79% return rate.

## Business Recommendations

- Review discount approval policies, particularly for discounts above 20%.
- Investigate low-margin regions and product categories.
- Review pricing and costs for loss-making products.
- Monitor customer profitability.
- Prioritise high-value inactive customers for re-engagement campaigns.
- Track return reasons and associated costs.

## Repository Structure

```text
RetailNova-Retail-Analytics/
│
├── 01_Data/
├── 02_SQL_Scripts/
├── 03_Excel_Analysis/
├── 04_PowerBI_Dashboard/
├── 05_Documentation/
└── README.md
```

## Project Status

- [x] Data review and preparation
- [x] SQL-based business analysis
- [x] Business findings documentation
- [ ] Power BI dashboard development
- [ ] Final project presentation

## Conclusion

This project demonstrates how SQL-based analysis can help uncover profitability issues, understand customer behaviour and identify opportunities for better business decisions.

The next stage is to develop an interactive Power BI dashboard to communicate these findings effectively.
