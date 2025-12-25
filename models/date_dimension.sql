WITH CTE AS (
    select 
        TO_TIMESTAMP(STARTED_AT) as started_at,
        date(TO_TIMESTAMP(STARTED_AT)) as date_started_at,
        hour(TO_TIMESTAMP(STARTED_AT)) as hour_started_at,

        {{day_type('STARTED_AT')}} as day_type,
        {{get_season('STARTED_AT')}} AS station_of_year

    from {{ source('demo', 'bike') }}
)
select *
from CTE
