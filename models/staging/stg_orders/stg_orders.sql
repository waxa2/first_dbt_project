WITH source_data AS (
	SELECT order_id,
		   customer_id,
		   order_date,
		   total_amount,
		   order_status  -- New column added
	FROM {{source('staging', 'orders') }}
)


SELECT * FROM source_data