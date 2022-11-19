with customers as (
    select     id as customer_id,
    first_name,
    last_name from {{source('Source_area','customers')}}
)



select * from customers