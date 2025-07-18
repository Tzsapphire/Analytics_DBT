with source_prd_info as (
    select * from {{ source('chizaram_silver', 'silver_prd_info') }}
)

select * from source_prd_info