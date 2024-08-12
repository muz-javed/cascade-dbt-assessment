select Month, region Most_Likely_Region
from

    (
        select
            *,
            row_number() over (
                partition by month_num order by sightings desc
            ) as max_region

        from

            (
                select
                    extract(month from date_witness) month_num,
                    format_date('%B', date_witness) month,
                    b.city_agent region,
                    count(*) sightings

                from {{ ref("sightings") }} a
                left join {{ ref('city_agent') }} b
                on a.city_agent_id = b.id
                group by 1, 2, 3
            )

        order by month_num
    )

where max_region = 1
