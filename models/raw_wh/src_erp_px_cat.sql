with erp_prd_cat as (
    select * from {{source ('bronze_schema', 'erp_px_cat_g1v2')}}
)

select * from erp_prd_cat