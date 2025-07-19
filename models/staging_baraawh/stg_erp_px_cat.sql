with prd_cat as (
    select * from {{ source ('chizaram_silver', 'silver_erp_px_cat_g1v2') }}
)

select * from prd_cat
