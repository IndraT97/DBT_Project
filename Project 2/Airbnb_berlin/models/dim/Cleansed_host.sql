WITH src_hosts AS (
    SELECT
        *
    FROM
        {{ ref('Stg_host') }}
)
SELECT
    host_id,
    NVL(
        name,
        'Anonymous'
    ) AS host_name,
    host_is_superhost,
    created_at,
    updated_at
FROM
    src_hosts