select
    row_number() over () as id,
    region,
    witness_id,
    agent_id,
    date_witness,
    date_agent,
    city_id,
    city_agent_id,
    has_weapon,
    has_hat,
    has_jacket,
    behavior

from

    (
        select
            comb_df.*,
            witness.id as witness_id,
            agent.id as agent_id,
            city.id as city_id,
            city_agent_df.id as city_agent_id

        from {{ ref("combined_data_1NF") }} as comb_df

        left join
            (select * from {{ ref("witness_agent") }} where type = 'witness') as witness
            on witness.name = comb_df.witness

        left join
            (select * from {{ ref("witness_agent") }} where type = 'agent') as agent
            on agent.name = comb_df.agent

        left join
            {{ ref("perpetrator_location") }} as city
            on city.city = comb_df.city
            and city.longitude = comb_df.longitude
            and city.latitude = comb_df.latitude

        left join
            {{ ref("city_agent") }} as city_agent_df
            on city_agent_df.city_agent = comb_df.city_agent
            and city_agent_df.country = comb_df.country

    )
