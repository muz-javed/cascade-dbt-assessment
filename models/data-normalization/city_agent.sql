select
    row_number() over (order by city_agent) as id, *
from
    (
        select city_agent
        from {{ ref("combined_data_1NF") }}
        group by 1
    )
