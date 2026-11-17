USE RetailNova_Analytics;
GO

-- 1. Customer Profitability
SELECT
    [Customer ID],
    [Customer Name],
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CASE
        WHEN SUM(Profit) >= 1000 THEN 'High Value'
        WHEN SUM(Profit) >= 0 THEN 'Medium Value'
        ELSE 'Loss Making'
    END AS Customer_Category
FROM dbo.Retail_Sales
GROUP BY [Customer ID], [Customer Name]
ORDER BY Total_Profit DESC;


-- 2. Repeat vs One-Time Customers
WITH Customer_Orders AS
(
    SELECT
        [Customer ID],
        COUNT(DISTINCT [Order ID]) AS Total_Orders
    FROM dbo.Retail_Sales
    GROUP BY [Customer ID]
)
SELECT
    CASE
        WHEN Total_Orders = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS Customer_Type,
    COUNT(*) AS Total_Customers
FROM Customer_Orders
GROUP BY
    CASE
        WHEN Total_Orders = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END;


-- 3. Customer Inactivity (More than 6 months)
WITH Customer_Activity AS
(
    SELECT
        [Customer ID],
        MAX([Customer Name]) AS Customer_Name,
        MAX([Order Date]) AS Latest_Order_Date
    FROM dbo.Retail_Sales
    WHERE [Order Date] <= '2026-11-15'
    GROUP BY [Customer ID]
)
SELECT
    [Customer ID],
    Customer_Name,
    Latest_Order_Date,
    DATEDIFF(DAY, Latest_Order_Date, '2026-11-15')
        AS Days_Since_Last_Order
FROM Customer_Activity
WHERE Latest_Order_Date < DATEADD(MONTH, -6, '2026-11-15')
ORDER BY Latest_Order_Date;


-- 4. Top 3 Customers by Profit in Each Segment
WITH Customer_Profit AS
(
    SELECT
        [Customer ID],
        [Customer Name],
        Segment,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM dbo.Retail_Sales
    GROUP BY [Customer ID], [Customer Name], Segment
),
Customer_Ranking AS
(
    SELECT *,
        DENSE_RANK() OVER
        (
            PARTITION BY Segment
            ORDER BY Total_Profit DESC
        ) AS Profit_Rank
    FROM Customer_Profit
)
SELECT *
FROM Customer_Ranking
WHERE Profit_Rank <= 3
ORDER BY Segment, Profit_Rank;