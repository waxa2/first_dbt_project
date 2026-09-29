SELECT customer_id,
	   {{ full_name('first_name', 'last_name') }} AS full_name
FROM {{ ref('stg_customers') }}