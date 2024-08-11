select month, region most_likely_region
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
                    region,
                    count(*) sightings
                from {{ ref("sightings") }}
                group by 1, 2, 3
            )

        order by month_num
    )

where max_region = 1
