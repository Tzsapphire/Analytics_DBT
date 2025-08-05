with
    clean_erp_prd_cat as (
        select
            id,
            cat,
            subcat,
            maintenance
        from {{ ref("src_erp_px_cat") }}
    )

select *
from clean_erp_prd_cat
