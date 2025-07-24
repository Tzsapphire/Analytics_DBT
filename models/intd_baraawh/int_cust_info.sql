with recent_create_date as (
    select *,
            row_number() over (partition by cst_id order by cst_create_date desc) as flag_last
    from {{ ref("src_cust_info") }} 
    where cst_id is not null
    -- )t where flag_last = 1 
),
clean_cust_info as (
        select
            cst_id,
            cst_key,
            upper(trim(cst_firstname)) as cst_firstname,
            upper(trim(cst_lastname)) as cst_lastname,
            case 
                when upper(trim(cst_marital_status)) = 'M' then 'Married'
                when upper(trim(cst_marital_status)) = 'S' then 'Single'
                else 'n/a'
            end as cst_marital_status,
            case 
                when upper(trim(cst_gender)) = 'M' then 'Male'
                when upper(trim(cst_gender)) = 'F' then 'Female',
                else 'n/a'
            end as cst_gender,
            cst_create_date
        from recent_create_date
    where flag_last = 1 --to select the recently created dates which were valid
)

select *
from clean_cust_info