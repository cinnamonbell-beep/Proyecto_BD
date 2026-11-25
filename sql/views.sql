-- Generate a monthly sales report showing number of sales, units sold and total amount pero month 

CREATE VIEW vw_monthly_sales AS
SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
    COUNT(*) AS total_sales,
    sum(quantity) AS units_sold,
    sum(total) AS total_sold
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY sale_month;