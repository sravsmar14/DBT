{{
    config(
        materialized='table'
    )
}}

with order_items as(

    select * from {{source('Source_area','Order_items')}}
)

select *,'{{ invocation_id }}' as Audit_col_OI from order_items