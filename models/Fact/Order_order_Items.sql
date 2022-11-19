{{
    config(
       post_hook = "update {{ref ('stg_orders')}} set order_status='updated_Raj' where order_id=1;
       insert into `raj-dbt.Retail_db_audit.dbt_log` values (CURRENT_TIMESTAMP(), '{{invocation_id}}','{{project_name}}','Order_OI_end');",
       pre_hook = "insert into `raj-dbt.Retail_db_audit.dbt_log` values (CURRENT_TIMESTAMP(), '{{invocation_id}}','{{project_name}}','Order_OI_start');",
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

