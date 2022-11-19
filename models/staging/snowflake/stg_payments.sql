with payments as (
    select     id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    ---amount / 100 as amount,
    {{cents_to_dollars('amount')}} as amount,
    created as created_at from {{source('Source_area','payments')}}
)

select * from payments