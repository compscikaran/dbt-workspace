{{ config(materialized='table')}}

SELECT
    session_id,
    users.customer_name,
    movies.movie_name,
    watch_date,
    device_type,
    ROUND(watch_duration_minutes / 60, 1) AS watch_duration,
    is_download
FROM analytics.default.watch_history wh
JOIN {{ ref('stg_default__users') }} users ON wh.user_id = users.user_id
JOIN {{ ref('stg_default__movies') }} movies ON movies.movie_id = wh.movie_id