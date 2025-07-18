with prd_cat as (
    select * from {{ source ('chizaram_silver', 'silver_erp_custAZ12') }}
)

select * from prd_cat
