with orders_sf as (
    select     id as order_id,
    user_id as customer_id,
    order_date,
    status from {{source('Source_area','orders_sf')}}
)

 
select * from orders_sf