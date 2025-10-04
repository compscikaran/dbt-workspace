with 
orders as ( 
    select * from {{ ref('stg_jaffle_shop__orders') }}
),
payments as (
    select 
        order_id,
        SUM(amount) as amount
    from {{ ref('stg_stripe__payments') }}
    WHERE status = 'success'
    GROUP BY 1
)
select
    orders.order_id,
    orders.customer_id,
    payments.amount
FROM orders
JOIN payments ON orders.order_id = payments.order_id
