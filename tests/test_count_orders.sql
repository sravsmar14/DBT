with orders as (
select count(*) from {{ref ('stg_orders')}} having count(*) <1
)

select * from orders