with erp_cust as (
    select * from {{source ('chizaram_silver', 'silver_erp_custAZ12')}}
)
select * from erp_cust
