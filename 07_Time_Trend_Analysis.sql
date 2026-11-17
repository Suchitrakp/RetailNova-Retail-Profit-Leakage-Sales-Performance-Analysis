USE RetailNova_Analytics;
GO

-- 1. Monthly Sales and Profit Trends
SELECT
    YEAR([Order Date]) AS Order_Year,
    MONTH([Order Date]) AS Order_Month_Number,
    DATENAME(MONTH, [Order Date]) AS Order_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage
FROM dbo.Retail_Sales
GROUP BY
    YEAR([Order Date]),
    MONTH([Order Date]),
    DATENAME(MONTH, [Order Date])
ORDER BY Order_Year, Order_Month_Number;


-- 2. Annual Sales and Profit Trends
SELECT
    YEAR([Order Date]) AS Order_Year,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage
FROM dbo.Retail_Sales
GROUP BY YEAR([Order Date])
ORDER BY Order_Year;


-- 3. Future-Dated Records for Data Quality Review
SELECT
    COUNT(*) AS Future_Dated_Rows,
    MIN([Order Date]) AS First_Future_Date,
    MAX([Order Date]) AS Last_Future_Date
FROM dbo.Retail_Sales
WHERE [Order Date] > '2026-11-15';
GO