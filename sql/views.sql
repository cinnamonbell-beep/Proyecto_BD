USE GroceryStore;

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

-- Generate a report showing the top-selling products based on total sales and units sold
CREATE VIEW vw_top_products AS 
SELECT
    products.product_id,
    products.name AS product_name,
    categories.name AS category_name,
    brands.name AS brand_name,
    SUM(sales.quantity) AS units_sold,
    SUM(sales.total) AS total_sold
FROM sales 
JOIN products ON sales.product_id = products.product_id
JOIN categories ON products.category_id = categories.category_id
JOIN brands ON products.brand_id = brands.brand_id
GROUP BY products.product_id, products.name, categories.name, brands.name
ORDER BY total_sold DESC;

Select * from vw_top_products;
select * from vw_monthly_sales;

    