with cust_location as (
    select * from {{ source ('chizaram_silver', 'silver_erp_loca101')}}
)

select * from cust_location
