with clean_erp_loca as (
    select cid, 
    replace(cid,'-','_') as cid1,
    case when cntry in ('US','USA') then 'United States'
        when cntry = 'DE' then 'Germany'
        when cntry = '' or cntry is null then 'n/a'
        else cntry
    end as cntry,
from {{ ref("src_erp_loca1") }}
) 

select * from clean_erp_loca

--how do i insert a createdate()