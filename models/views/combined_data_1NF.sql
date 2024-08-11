with combined_data as (
    select 'Africa' as region, * from {{ ref('africa_view') }}
    union all
    select 'AMERICA' as region, * from {{ ref('america_view') }}
    union all
    select 'ASIA' as region, * from {{ ref('asia_view') }}
    union all
    select 'ATLANTIC' as region, * from {{ ref('atlantic_view') }}
    union all
    select 'AUSTRALIA' as region, * from {{ ref('australia_view') }}
    union all
    select 'EUROPE' as region, * from {{ ref('europe_view') }}
    union all
    select 'INDIAN' as region, * from {{ ref('indian_view') }}
    union all
    select 'PACIFIC' as region, * from {{ ref('pacific_view') }}
)
select * from combined_data