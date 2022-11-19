{% snapshot snap_products %}

{{
    config(
        target_database='raj-dbt',
        target_schema='fact_scd',
        unique_key='order_id',
        strategy='timestamp',
        updated_at='order_date'
    )
}}

select * from  {{source('Source_area','Orders')}}

{% endsnapshot %}