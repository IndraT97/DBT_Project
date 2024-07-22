{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
  )
}}
WITH src_reviews AS (
  SELECT * FROM {{ ref('Stg_review') }}
)
SELECT 
  {{ dbt_utils.surrogate_key(['listing_id', 'date', 'reviewer_name', 'comments']) }} AS review_id,
  *
FROM src_reviews
WHERE comments IS NOT NULL
{% if is_incremental() %}
  AND date > (SELECT MAX(date) FROM {{ this }})
{% endif %}
