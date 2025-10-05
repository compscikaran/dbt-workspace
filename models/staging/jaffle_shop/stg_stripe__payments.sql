SELECT
id,
order_id,
COALESCE(payment_method, 'cash') AS payment_method,
amount,
current_timestamp AS created_at,
'success' AS status
FROM {{ source("jaffle_shop", "payments")}}