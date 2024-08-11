select Month, Behavior_Matched_Prob

from

(select
    extract(month from date_witness) month_num,
    format_date('%B', date_witness) month,
    round(
        sum(
            case
                when sightings.behavior = top_3_behavs.top_3_behaviors then 1 else 0
            end
        )
        / count(*),
        4
    ) behavior_matched_prob

from {{ ref("sightings") }} sightings

left join
    {{ ref("task_4c") }} top_3_behavs

    on sightings.behavior = top_3_behavs.top_3_behaviors

group by 1, 2

order by month_num)
