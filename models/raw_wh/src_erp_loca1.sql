with erp_loca1 as (
    select * from {{source ('bronze_schema', 'erp_loca101')}}
)

select * from erp_loca1
