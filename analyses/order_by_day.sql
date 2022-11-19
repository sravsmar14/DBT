with orders as (

    select * from {{ref('stg_order_sf')}}
)

select * from orders