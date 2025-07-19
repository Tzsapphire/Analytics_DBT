with
    sales_details as (
        select * from {{ source("chizaram_silver", "silver_sales_details") }}
    )

select *
from sales_details
