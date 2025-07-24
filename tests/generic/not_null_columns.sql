
-- {% test is_unique(model, column_name) %}

--     select {{ column_name }}, count(*)
--     from {{ model }}
--     group by {{ column_name }}
--     having count(*) > 1

-- {% endtest %}



{% test not_null_columns(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }} is null

{% endtest %}