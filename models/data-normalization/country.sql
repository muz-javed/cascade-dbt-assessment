select
    row_number() over (order by country) as id, *
from
    (
        select country
        from {{ ref("combined_data_1NF") }}
        group by 1
    )
