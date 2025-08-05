with prod_info as (
    select * from {{source ('bronze_schema', 'prd_info')}}
)

select * from prod_info