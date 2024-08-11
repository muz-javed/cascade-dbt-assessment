select
    row_number() over (order by city_agent, country) as id, *
from
    (
        select city_agent, country
        from {{ ref("combined_data_1NF") }}
        group by 1, 2
    )
