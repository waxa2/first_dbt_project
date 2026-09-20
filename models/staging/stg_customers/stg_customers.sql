
WITH source_data AS (
	SELECT customer_id,
	       first_name,
	       last_name,
	       email,
		   loaded_at
	FROM {{source('staging', 'customers') }}
)


SELECT * FROM source_data