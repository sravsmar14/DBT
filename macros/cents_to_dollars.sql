{%  macro cents_to_dollars(column_name,decimal_placed=2) %}
round(1.0 * {{column_name}}/100,{{decimal_placed}})

{% endmacro %}