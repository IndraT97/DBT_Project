WITH src_listings AS (
    SELECT * FROM {{ ref('Stg_listing') }}
)
SELECT 
  listing_id,
  name,
  room_type,
  CASE
    WHEN minimum_nights = 0 THEN 1
    ELSE minimum_nights
  END AS minimum_nights,
  host_id,
  CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS NUMBER(10,2)) AS price,
  created_at,
  updated_at
FROM
  src_listings
