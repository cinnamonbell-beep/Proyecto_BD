-- Generate a monthly sales report showing total sales, units sold and total amount per month 

CREATE VIEW vw_monthly_sales AS
SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
    COUNT(*) AS total_sales,
    SUM(quantity) AS units_sold,
    SUM(total) AS total_sold
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY sale_month;