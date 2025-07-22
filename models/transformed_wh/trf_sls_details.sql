with trf_customer as (
    select *  from {{ ref ("trf_cust_info")}}
),

trf_product as (
    select * from {{ ref ("trf_prd_info")}}
),

trf_sales as (
    select  sls_ord_num as order_number, -- keys
    sls_cust_id,
    sls_prd_key,
    sls_order_dt as order_date, --dates
    sls_ship_dt as shipping_date,
    sls_due_dt as due_date,
    sls_sales as sales_amount,  --measures
    sls_quantity as quantity,
    sls_price as price
    from {{ ref ("stg_sales_details")}}
),

fct_sales as (
    select *, -- after only choose the columns you need
    trf_product.product_key as product_key,
    trf_customer.customer_key as customer_key
    from trf_sales
    left join trf_customer on trf_sales.sls_cust_id = trf_customer.customer_id
    left join trf_product on trf_sales.sls_prd_key = trf_product.product_number
)

select * from fct_sales