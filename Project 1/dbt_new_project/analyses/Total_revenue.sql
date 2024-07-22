select sum(amount) as total_revenue 
from {{ref("Stage_Payments")}}
where status in ('success')