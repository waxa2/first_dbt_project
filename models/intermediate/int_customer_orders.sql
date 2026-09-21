
{{config(materialized='incremental')}}
with customers as (
select
	customer_id,
	first_name,
	last_name,
	email
from {{ ref("stg_customers") }}
),

orders as (
select
	order_id,
	customer_id,
	order_date,
	total_amount
from {{ ref("stg_orders") }}
)

select
o.order_id,
o.customer_id,
c.first_name,
c.last_name,
c.email,
o.order_date,
o.total_amount
from orders as o
left join customers as c on o.customer_id = c.customer_id

{%- if is_incremental() -%}
	where o.order_date > (select max(order_date) from {{ this }})
{%- endif -%}
