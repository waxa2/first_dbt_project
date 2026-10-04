{% set result = run_query("select distinct order_status from staging.stg_orders") %}

{% if execute %}
    {% set order_statuses = result.columns[0].values() %}
{% else %}
    {% set order_statuses = [] %}
{% endif %}

select
    customer_id,
    {% for order_status in order_statuses %}
        count(case when order_status = '{{ order_status }}' then order_id end) as {{ order_status }}_amount,
    {% endfor %}
    sum(total_amount) as total_amount
from {{ ref('stg_orders') }}
group by 1