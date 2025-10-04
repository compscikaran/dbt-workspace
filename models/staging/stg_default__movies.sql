{{ config(materialized='view')}}

SELECT
    movie_id,
    title as movie_name,
    content_type,
    COALESCE(genre_secondary, genre_primary) AS movie_genre,
    ROUND(duration_minutes / 60, 1) AS movie_duration,
    language,
    is_netflix_original
FROM analytics.default.movies