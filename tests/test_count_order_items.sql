with order_items as (
    select count(*) from {{ref ('stg_order_items')}} having count(*) <1
)

select * from order_items