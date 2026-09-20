WITH customers AS (
	SELECT
	customer_id,
	firs_name,
	last_name,
	email
	FROM {{ ref('stg_customers') }}
),
orders AS (
	SELECT
	order_id,
	customer_id,
	order_date,
	total_amount
	FROM {{ ref('stg_orders') }}
)
SELECT c.customer_id,
	   c.firs_name,
	   c.last_name,
	   c.email,
	   o.order_id,
	   o.order_date,
	   o.total_amount
FROM orders AS o
LEFT JOIN customers AS c ON o.customer_id = c.customer_id