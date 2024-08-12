{% test is_boolean(model, column_name) %}
select *
from {{ model }}
where {{ column_name }} not in (true, false)
{% endtest %}