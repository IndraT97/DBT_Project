select host_id,
       name,
       host_is_superhost,
       host_since as created_at,
       calendar_last_scraped as updated_at
from {{source("airbnb_data","listings_raw")}}
