select
    row_number() over (order by city, latitude, longitude) as id, city, latitude, longitude
from
    (
        select city, latitude, longitude, country
        from {{ ref("combined_data_1NF") }}

        group by 1, 2, 3, 4
    )