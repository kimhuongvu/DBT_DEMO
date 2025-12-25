with CTE as (
    select
        t.*,
        w.*
    from {{ ref('trip_fact') }} as t
    left join {{ ref('daily_weather') }} as w
        on t.trip_date = w.daily_weather
    order by TRIP_DATE desc

)
select *
from CTE