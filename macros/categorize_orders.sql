{%- macro categorize_orders(amount_column) -%}
{# This macro categorizes orders based on their amount. It takes one parameter: `amount_column`, which represents the column containing the order amounts. #}

    case
        when {{ amount_column }} >= 500  then 'High Value'
        {# If the amount in the column is greater than or equal to 500, the order is categorized as 'High Value'. #}

        when {{ amount_column }} >= 200 then 'Medium Value'
        {# If the amount is greater than or equal to 200 but less than 500, the order is categorized as 'Medium Value'. #}

        else 'Low Value'
        {# If the amount is less than 200, the order is categorized as 'Low Value'. #}
    end

{% endmacro %}
{# The macro ends here. It can be reused in other SQL queries by passing the appropriate column name as an argument. #}