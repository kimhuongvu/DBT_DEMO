WITH bike as (
    select
        RIDE_ID,
        RIDEABLE_TYPE,
        STARTED_AT,
        ENDED_AT,
        START_STATION_NAME,
        START_STATION_ID,
        END_STATION_NAME,
        END_STATION_ID,
        START_LAT,
        START_LNG,
        END_LAT,
        END_LNG,
        MEMBER_CASUAL
    from {{ source('demo', 'bike') }}
)
select * from bike