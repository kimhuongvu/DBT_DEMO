WITH CTE AS (
    select 
        TO_TIMESTAMP(STARTED_AT) as started_at,
        date(TO_TIMESTAMP(STARTED_AT)) as date_started_at,
        hour(TO_TIMESTAMP(STARTED_AT)) as hour_started_at,
        
        case 
        when dayname(TO_TIMESTAMP(STARTED_AT)) in ('Sat','Sun')
            then 'WEEKEND' else 'BUSINESSDAY'
        end as day_type,

        case 
        when month(TO_TIMESTAMP(STARTED_AT)) in (12,1,2)
            then 'WINTER'
        when month(TO_TIMESTAMP(STARTED_AT)) in (3,4,5)
            then 'SPRING'
        when month(TO_TIMESTAMP(STARTED_AT)) in (6,7,8)
            then 'SUMMER'
        else 'AUTUM'
        end as station_of_year
    from {{ source('demo', 'bike') }}
)
select *
from CTE
