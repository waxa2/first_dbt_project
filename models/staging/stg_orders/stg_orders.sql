WITH source_data AS (
	SELECT order_id,
		   customer_id,
		   order_date,
		   total_amount
	FROM {{source('staging', 'orders') }}
)


SELECT * FROM source_data