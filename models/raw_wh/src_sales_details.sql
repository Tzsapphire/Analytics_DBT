with sales_details as (
    select * from {{source ('bronze_schema', 'sales_details')}}
)

select * from sales_details