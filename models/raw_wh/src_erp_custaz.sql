with erp_custaz as (
    select * from {{source ('bronze_schema', 'erp_custaz12')}}
)

select * from erp_custaz
