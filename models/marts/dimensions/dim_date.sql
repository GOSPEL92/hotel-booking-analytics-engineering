{{
    config(
        materialized='table'
    )
}}

with date_bounds as (
    select
        min(cast(reservation_status_date as date)) as start_date,
        max(cast(reservation_status_date as date)) as end_date
    from {{ ref('stg_hotel_bookings') }}
),

date_spine as (
    select
        dateadd(day, seq4(), (select start_date from date_bounds)) as date_day
    from table(generator(rowcount => 2000))
),

filtered_dates as (
    select
        date_day
    from date_spine
    where date_day <= (select end_date from date_bounds)
)

select
    date_day,
    year(date_day) as year_number,
    quarter(date_day) as quarter_number,
    month(date_day) as month_number,
    monthname(date_day) as month_name,
    day(date_day) as day_of_month,
    dayofweek(date_day) as day_of_week,
    dayname(date_day) as day_name,
    case
        when dayofweek(date_day) in (0, 6) then true
        else false
    end as is_weekend
from filtered_dates
order by date_day