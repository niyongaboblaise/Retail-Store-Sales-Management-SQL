--inner join

SELECT
    c.customer_name,
    so.order_id,
    so.order_date,
    b.branch_name
FROM Customers c
INNER JOIN Sales_Orders so
    ON c.customer_id = so.customer_id
INNER JOIN Branches b
    ON so.branch_id = b.branch_id;

	--left join


	SELECT
    c.customer_id,
    c.customer_name,
    so.order_id
FROM Customers c
LEFT JOIN Sales_Orders so
    ON c.customer_id = so.customer_id
WHERE so.order_id IS NULL;

--Rank Products According to Sales Revenue a.ROW_NUMBER()
WITH ProductSales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM Products p
    JOIN Order_Items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_name,
    total_sales,
    ROW_NUMBER() OVER (
        ORDER BY total_sales DESC
    ) AS row_number
FROM ProductSales;

--ranking

WITH EmployeeSales AS (
    SELECT
        e.employee_id,
        e.employee_name,
        COALESCE(
            SUM(oi.quantity * oi.unit_price), 0
        ) AS total_sales
    FROM Employees e
    LEFT JOIN Sales_Orders so
        ON e.employee_id = so.employee_id
    LEFT JOIN Order_Items oi
        ON so.order_id = oi.order_id
    GROUP BY e.employee_id, e.employee_name
)
SELECT
    employee_name,
    total_sales,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS employee_rank
FROM EmployeeSales;

-- DENSE_RANK()

WITH CustomerSpending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spending
    FROM Customers c
    JOIN Sales_Orders so
        ON c.customer_id = so.customer_id
    JOIN Order_Items oi
        ON so.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    total_spending,
    DENSE_RANK() OVER (
        ORDER BY total_spending DESC
    ) AS spending_rank
FROM CustomerSpending;

-- PERCENT_RANK()

WITH ProductSales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM Products p
    JOIN Order_Items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_name,
    total_sales,
    PERCENT_RANK() OVER (
        ORDER BY total_sales
    ) AS percentage_rank
FROM ProductSales;

--TOP THREE CUSTOMERS IN EACH REGION
WITH CustomerRegionSales AS (
    SELECT
        r.region_name,
        c.customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spending
    FROM Regions r
    JOIN Customers c
        ON r.region_id = c.region_id
    JOIN Sales_Orders so
        ON c.customer_id = so.customer_id
    JOIN Order_Items oi
        ON so.order_id = oi.order_id
    GROUP BY
        r.region_name,
        c.customer_id,
        c.customer_name
),
RankedCustomers AS (
    SELECT
        region_name,
        customer_name,
        total_spending,
        ROW_NUMBER() OVER (
            PARTITION BY region_name
            ORDER BY total_spending DESC
        ) AS customer_rank
    FROM CustomerRegionSales
)
SELECT *
FROM RankedCustomers
WHERE customer_rank <= 3;

---branchsales  HIGHEST-PERFORMING BRANCH

WITH BranchSales AS (
    SELECT
        b.branch_name,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM Branches b
    JOIN Sales_Orders so
        ON b.branch_id = so.branch_id
    JOIN Order_Items oi
        ON so.order_id = oi.order_id
    GROUP BY b.branch_id, b.branch_name
)
SELECT
    branch_name,
    total_sales,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS branch_rank
FROM BranchSales;


--- Calculating Cumulative Sales Per Branch

WITH DailySales AS (
    SELECT
        so.branch_id,
        b.branch_name,
        so.order_date,
        SUM(oi.quantity * oi.unit_price) AS daily_sales
    FROM Sales_Orders so
    JOIN Branches b
        ON so.branch_id = b.branch_id
    JOIN Order_Items oi
        ON so.order_id = oi.order_id
    GROUP BY
        so.branch_id,
        b.branch_name,
        so.order_date
)
SELECT
    branch_name,
    order_date,
    daily_sales,
    SUM(daily_sales) OVER (
        PARTITION BY branch_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_sales
FROM DailySales;

-- Calculating Average Employee Sales

WITH EmployeeSales AS (
    SELECT
        e.employee_id,
        e.employee_name,
        COALESCE(
            SUM(oi.quantity * oi.unit_price), 0
        ) AS total_sales
    FROM Employees e
    LEFT JOIN Sales_Orders so
        ON e.employee_id = so.employee_id
    LEFT JOIN Order_Items oi
        ON so.order_id = oi.order_id
    GROUP BY e.employee_id, e.employee_name
)
SELECT
    employee_name,
    total_sales,
    AVG(total_sales) OVER () AS average_employee_sales
FROM EmployeeSales;
--Calculating Differences Between Consecutive Monthly Sales

WITH MonthlySales AS (
    SELECT
        TO_CHAR(so.order_date, 'YYYY-MM') AS sales_month,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM Sales_Orders so
    INNER JOIN Order_Items oi
        ON so.order_id = oi.order_id
    GROUP BY TO_CHAR(so.order_date, 'YYYY-MM')
),
PreviousSales AS (
    SELECT
        sales_month,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY sales_month
        ) AS previous_month_sales
    FROM MonthlySales
)
SELECT
    sales_month,
    total_sales,
    previous_month_sales,
    total_sales - previous_month_sales AS sales_difference
FROM PreviousSales
ORDER BY sales_month;

--Divide Customers Into Four Spending Groups
WITH CustomerSpending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COALESCE(
            SUM(oi.quantity * oi.unit_price), 0
        ) AS total_spending
    FROM Customers c
    LEFT JOIN Sales_Orders so
        ON c.customer_id = so.customer_id
    LEFT JOIN Order_Items oi
        ON so.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    total_spending,
    NTILE(4) OVER (
        ORDER BY total_spending DESC
    ) AS spending_group
FROM CustomerSpending;  
--Analyse the Cumulative Distribution of Product Sales

WITH ProductSales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_sales
    FROM Products p
    JOIN Order_Items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_name,
    total_sales,
    CUME_DIST() OVER (
        ORDER BY total_sales
    ) AS cumulative_distribution
FROM ProductSales;

--Identify the Best-Selling Product
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM Products p
JOIN Order_Items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

--Calculate Total Sales Revenue

SELECT
    SUM(quantity * unit_price) AS total_revenue
FROM Order_Items;

--Calculate Total Sales Per Region
SELECT
    r.region_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM Regions r
JOIN Customers c
    ON r.region_id = c.region_id
JOIN Sales_Orders so
    ON c.customer_id = so.customer_id
JOIN Order_Items oi
    ON so.order_id = oi.order_id
GROUP BY r.region_name
ORDER BY total_sales DESC;

--Display Products That Have Never Been Sold

SELECT
    p.product_id,
    p.product_name
FROM Products p
LEFT JOIN Order_Items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;










