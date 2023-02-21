
with source as (select date_day from {{ ref("raw_dates") }})

select
    hash(date_day) as date_skey,
    current_timestamp()::datetime as effective_date,
    date_day::date as date,
    month(date_day)::int as month,
    dayofweek(date_day)::int as day_of_week,
    dayname(date_day)::varchar as day_name,
    concat(year(date_day), '_Q', quarter(date_day))::varchar as year_quarter,
    quarter(date_day)::int as quarter,
    year(date_day)::int as year,
    case when day_name not in ('Sun', 'Sat') then 'yes' else 'no' end as is_weekday
from source
