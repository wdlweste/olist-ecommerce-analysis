SELECT 
    c.customer_state,
    COUNT(*) AS total_orders,
    ROUND(AVG(oi.price), 2) AS avg_spend
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY total_orders DESC;