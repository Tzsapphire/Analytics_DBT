with
    clean_erp_custaz as (
        select
            cid,
            case
                when cid like '%NAS' then substr(cid, 4, len(cid)) else cid
            end as cst_key,
            case when bdate > current_date() then null else bdate end as bdate,
            case
                when upper(trim(gen)) in ('M%', 'MALE')
                then 'Male'
                when upper(trim(gen)) in ('F%', 'FEMALE')
                then 'Female'
                else 'n/a'
            end as gen
        from {{ ref("src_erp_custaz") }}
    )

select *
from clean_erp_custaz
