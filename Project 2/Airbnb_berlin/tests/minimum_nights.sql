SELECT
    *
FROM
    {{ ref('Cleansed_listing') }}
WHERE minimum_nights < 1
LIMIT 10