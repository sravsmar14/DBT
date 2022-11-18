with order_items as (
    select * from {{ref('stg_order_items')}}

),
 orders as (
    select * from {{ref('stg_orders')}}

)

select * from orders a join
order_items b on 
a.order_id = b.order_item_order_id

