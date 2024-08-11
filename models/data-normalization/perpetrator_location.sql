select
    row_number() over (order by city, latitude, longitude) as id, city_agent_id, city, latitude, longitude
from
    (
        select city, latitude, longitude, comb_df.country, comb_df.city_agent, city_agent_df.id as city_agent_id
        from {{ ref("combined_data_1NF") }} as comb_df

        left join {{ ref('city_agent') }} as city_agent_df
        on comb_df.city_agent = city_agent_df.city_agent and comb_df.country = city_agent_df.country

        group by 1, 2, 3, 4, 5, 6
    )