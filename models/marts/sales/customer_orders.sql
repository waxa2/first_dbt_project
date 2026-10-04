SELECT customer_id,
	   first_name,
	   last_name,
	   email,
	   COUNT(order_id) AS total_orders,
	   MIN(order_date) AS first_order_date,
	   MAX(order_date) AS last_order_date,
	   SUM(total_amount) AS total_spent
FROM {{ ref('int_customer_orders') }}
GROUP BY customer_id, first_name, last_name, email
ORDER BY total_spent DESC