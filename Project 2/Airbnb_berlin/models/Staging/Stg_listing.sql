select id as listing_id,
    listing_url,
    name,
    ROOM_TYPE,
    minimum_nights,
    host_id,
    price,
    host_since as created_at,
    calendar_last_scraped as updated_at,
from {{source("airbnb_data","listings_raw")}}