{{
    config(
        materialized='table'
    )
}}

with Orders as(

    select * from {{source('Source_area','Orders')}}
)

select *,'{{ invocation_id }}' as Audit_col_orders/*,{{ var('order_id') }} as Dervied_col */ from Orders
--where order_id = {{ var('order_id') }}

--- schema=stage