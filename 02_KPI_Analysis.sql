USE RetailNova_Analytics;
GO

-- Overall business performance KPIs

SELECT
    COUNT(*) AS Total_Order_Lines,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    COUNT(DISTINCT [Customer ID]) AS Total_Customers,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,

    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage,

    CAST(AVG(Discount) * 100 AS DECIMAL(10,2))
        AS Average_Discount_Percentage,

    COUNT(DISTINCT CASE
        WHEN Returned = 'Yes' THEN [Order ID]
    END) AS Returned_Orders,

    CAST(
        COUNT(DISTINCT CASE
            WHEN Returned = 'Yes' THEN [Order ID]
        END) * 100.0 /
        NULLIF(COUNT(DISTINCT [Order ID]), 0)
        AS DECIMAL(10,2)
    ) AS Return_Rate_Percentage

FROM dbo.Retail_Sales;