{%- macro categorize_orders(amount_column) -%}
	case
		when {{ amount_column }} >= 500  then 'High Value'
		when {{ amount_column }} >= 200 then 'Medium Value'
		else 'Low Value'
	end
{% endmacro %}