SELECT
	order_id,
	customer_id,
	total_amount,
	{{ categorize_orders('total_amount') }} AS order_category
	FROM {{ ref('stg_orders') }}
