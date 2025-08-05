with crm_cust_info as (
    select * from {{source ('bronze_schema', 'cust_info')}}
)

select * from crm_cust_info