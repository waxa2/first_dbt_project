
WITH source_data AS (
	SELECT customer_id,
	       first_name,
	       last_name,
	       email
	FROM {{source('staging', 'customers') }}
)


SELECT * FROM source_data