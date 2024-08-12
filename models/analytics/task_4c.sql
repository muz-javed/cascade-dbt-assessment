select behavior Top_3_Behaviors

from

(select behavior, rank() over (order by count(*) desc) rank
from {{ ref('sightings') }}
group by 1
order by rank)
where rank <= 3