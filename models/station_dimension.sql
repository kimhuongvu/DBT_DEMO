with bike as (
        select
            distinct
            START_STATION_ID as station_id,
            START_STATION_NAME  as station_name,
            START_LAT as station_lat,
            START_LNG as start_station_lng
        from {{ source('demo', 'bike') }}
)
select *
from bike