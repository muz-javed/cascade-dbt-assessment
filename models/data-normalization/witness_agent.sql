select row_number() over (order by name, type) as id, *
from
    (
        select witness as name, 'witness' type
        from {{ ref("combined_data_1NF") }}
        group by 1
        union all
        select agent as name, 'agent' type
        from {{ ref("combined_data_1NF") }}
        group by 1
    )
