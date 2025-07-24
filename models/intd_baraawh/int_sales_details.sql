with clean_sales_details as (
    select sls_ord_num,
        sls_prd_key,
        sls_cust_id,
        case 
            when len(sls_order_dt) != 10 then null else sls_order_dt
        end as sls_order_dt,
        case 
            when len(sls_ship_dt) != 10 then null else sls_ship_dt
        end as sls_ship_dt,
        case 
            when len(sls_due_dt) != 10 then null else sls_due_dt
        end as sls_due_dt,
        case 
            when sls_sales is null or sls_sales != (sls_quantity * sls_price) or sls_sales <= 0
            then  abs(sls_quantity * sls_price) 
            else abs(sls_sales)
        end as sls_sales,
        sls_quantity,
        case 
            when sls_price is null or sls_price <=0 then truncate(sls_sales/sls_quantity)
            else sls_price
        end as sls_price
    from {{ ref("src_sales_details")}}
)
select * from clean_sales_details