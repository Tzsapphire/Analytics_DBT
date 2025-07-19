with stg_prod as (
    select prd_id as product_id,
        cat_id as category_id,
        prd_key as product_number,
        prd_line as product_line,
        prd_nm as product_name,
        prd_cost as product_cost, 
        prd_start_dt as start_date,
        prd_end_dt as end_date   
    from {{ref ("stg_prod_info")}}
),

stg_erp_prod as (
    select cat as category, 
        id, 
        subcat as subcategory, 
        maintenance 
    from {{ ref ("stg_erp_px_cat") }}
),

dim_products as (
    select *, 
    row_number() over (order by start_date, product_number ) as product_key
    from stg_prod --specify the columns you need here anyways
    left join stg_erp_prod on stg_prod.category_id = stg_erp_prod.id
)

select * from dim_products
where end_date is null 
-- we are selecting only the active products, 
-- because their end_date is still null so they are actively used products