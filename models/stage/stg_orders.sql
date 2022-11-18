
with Orders as(

    select * from raj-dbt.Retail_db.Orders
)

select *,'{{ invocation_id }}' as Audit_col_orders from Orders