with clean_prd_end_date as (
    select *, 
        cast(lead(prd_start_dt) over (partition by prd_key order by prd_start_dt)-1 as date)  as prd_end
    from {{ ref("src_prod_info")}}
),
-- with
clean_prd_info as (
    select prd_id,
        replace(substr(prd_key, 1,5), '-', '_') as cat_id,
        substr(prd_key, 7, len(prd_key)) as prd_key,
        prd_nm,
        ifnull(prd_cost, 0) as prd_cost,
        case 
            when prd_line = 'S' then 'Other Sales'
            when prd_line = 'M' then 'Mountain'
            when prd_line = 'T' then 'Touring'
            when prd_line = 'R' then 'Road'
            else 'n/a'
        end as prd_line,
        cast(prd_start_dt as date) as prd_start_dt,
        prd_end as prd_end_dt
   -- cast(lead(prd_start_dt) over (partition by prd_key order by prd_start_dt)-1 as date)  as prd_end

    from clean_prd_end_date 
    -- {{ ref("src_prod_info")}}
)

select * from clean_prd_info