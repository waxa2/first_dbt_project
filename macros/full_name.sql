{#Macro that combines values from two columns#}
{%- macro full_name(first_name, last_name) -%}
	concat({{ first_name }}, ' ', {{ last_name }})
{%- endmacro -%}