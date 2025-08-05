-- catch the tests at the source, which is our stg

--checking for id 
with stg_customer as (
    select 
        *
        -- cst_key,
        -- cst_firstname,  
        -- cst_lastname,
        -- cst_marital_status, 
        -- cst_gndr,
        -- cst_create_date
    from {{ ref('stg_cust_info') }} 
    -- group by cst_id
)
select cst_id  ,  count(*)as cnt_id from stg_customer
 group by cst_id
 having cnt_id>1

-- -- checking for key 
-- with stg_cust as (
--     select *
--         -- cst_id  ,  count(*)as cnt
--         -- cst_key, count(*)as cnt_key
--         -- cst_firstname,  
--         -- cst_lastname,
--         -- cst_marital_status, 
--         -- cst_gndr,
--         -- cst_create_date
--     from {{ ref('stg_cust_info') }} 
--     -- group by cst_id
-- )
-- select cst_key, count(*)as cnt_key from stg_cust
--  group by cst_key 
--  having cnt_key>1;