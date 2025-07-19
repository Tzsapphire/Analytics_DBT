with
    stg_customer as (
        select
            cst_id as customer_id,
            cst_key as customer_number,
            cst_firstname as firstname,
            cst_lastname as lastname,
            cst_marital_status as marital_status,
            cst_gndr,
            cst_create_date as create_date
        from {{ ref("stg_cust_info") }}
    ),

    stg_erp_loca1 as (select cid, cntry as country from {{ ref("stg_erp_loca1") }}),

    stg_custaz as (
        select cst_key, gen, bdate as birthdate from {{ ref("stg_erp_custaz") }}
    ),

    dim_customer as (
        select -- list all the necessary columns
            *,
            row_number() over (order by customer_id) as customer_key,
            case
                when stg_customer.cst_gndr = 'n/a'
                then stg_custaz.gen
                else stg_customer.cst_gndr
            end as gender
        from stg_customer
        left join stg_erp_loca1 on stg_customer.customer_number = stg_erp_loca1.cid
        left join stg_custaz on stg_customer.customer_number = stg_custaz.cst_key
    )

select *
from dim_customer
