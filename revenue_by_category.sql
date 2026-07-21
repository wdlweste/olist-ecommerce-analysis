SELECT 
    pct.product_category_name_english,
    SUM(oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_translation pct ON p.product_category_name = pct.product_category_name
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY pct.product_category_name_english
ORDER BY revenue DESC;