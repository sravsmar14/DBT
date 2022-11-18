
with order_items as(

    select * from raj-dbt.Retail_db.Order_items
)

select *,'{{ invocation_id }}' as Audit_col_OI from order_items