WITH
l AS (
    SELECT
        *
    FROM
        {{ ref('Cleansed_listing') }}
),
h AS (
    SELECT * 
    FROM {{ ref('Cleansed_host') }}
)

SELECT 
    l.listing_id,
    l.name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at
FROM l
LEFT JOIN h ON (h.host_id = l.host_id)