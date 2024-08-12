select *
from
    (
        select 'Africa' as region, *
        from {{ source('region_views', 'AFRICA') }}
        union all
        select 'AMERICA' as region, *
        from {{ source('region_views', 'AMERICA') }}
        union all
        select 'ASIA' as region, *
        from {{ source('region_views', 'ASIA') }}
        union all
        select 'ATLANTIC' as region, *
        from {{ source('region_views', 'ATLANTIC') }}
        union all
        select 'AUSTRALIA' as region, *
        from {{ source('region_views', 'AUSTRALIA') }}
        union all
        select 'EUROPE' as region, *
        from {{ source('region_views', 'EUROPE') }}
        union all
        select 'INDIAN' as region, *
        from {{ source('region_views', 'INDIAN') }}
        union all
        select 'PACIFIC' as region, *
        from {{ source('region_views', 'PACIFIC') }}
    )
