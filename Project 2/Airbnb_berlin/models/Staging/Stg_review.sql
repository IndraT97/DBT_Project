select 
    listing_id, 
    date, 
    reviewer_name, 
    comments 
from {{source("airbnb_data","reviews_raw")}}