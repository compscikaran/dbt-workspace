SELECT
    user_id,
    email,
    first_name || ' ' || last_name AS customer_name,
    age,
    subscription_plan,
    is_active,
    primary_device,
    COALESCE(household_size, 1) AS household_size
FROM analytics.default.users