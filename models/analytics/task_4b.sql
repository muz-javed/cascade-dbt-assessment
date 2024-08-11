select Month, Probability

from

(select
    extract(month from date_witness) month_num,
    format_date('%B', date_witness) month,
    round(sum(
            case
                when has_weapon = true and has_jacket = true and has_hat = false
                then 1
                else 0
            end
        )
        / count(*), 4) Probability

from {{ ref("sightings") }}

group by 1, 2)

order by month_num
