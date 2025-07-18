with cust_info as (
    select * from {{source ('chizaram_silver', 'silver_cust_info')}}
)

select * from cust_info