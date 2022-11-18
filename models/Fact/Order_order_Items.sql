{{
    config(
       post_hook = "update `raj-dbt.Retail_db_stage_Fact_bq.Order_order_Items` set order_status='updated_Raj' where order_id=1;
       insert into `raj-dbt.Retail_db_stage_Fact_bq.Auditsio` values ('from_hook_post','hook_pre_post');",
       pre_hook = "insert into `raj-dbt.Retail_db_stage_Fact_bq.Auditsio` values ('from_hook_new','hook_pre_new');",
       materialized='incremental'
       
    )
}}


with order_items as (
    select * from {{ref('stg_order_items')}}

),
 orders as (
    select * from {{ref('stg_orders')}}

)

select *,'{{ invocation_id }}' as Audit_col_O_OI from orders a join
order_items b on 
a.order_id = b.order_item_order_id

