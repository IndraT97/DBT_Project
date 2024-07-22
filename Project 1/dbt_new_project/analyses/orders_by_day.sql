select
    order_date, count(distinct(order_id)) as order_count
from {{ref("Stage_Orders")}}
group by order_date
order by order_date
