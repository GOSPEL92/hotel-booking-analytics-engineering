{{ config(materialized='view') }}

select

    hotel,

    is_canceled,

    lead_time,

    arrival_date_year,

    arrival_date_month,

    arrival_date_day_of_month,

    adults,

    coalesce(children, 0) as children,

    babies,

    meal,

    coalesce(nullif(trim(country), ''), 'Unknown') as country,

   coalesce(nullif(trim(market_segment), ''), 'Unknown') as market_segment,

    distribution_channel,

    customer_type,

    deposit_type,

    adr,

    reservation_status,

    reservation_status_date,

    city,

    case
        when is_canceled = 1
            then 'Cancelled'
        else 'Completed'
    end as booking_status,

    case
        when hotel like 'City Hotel%'
            then 'City Hotel'
        when hotel like 'Resort Hotel%'
            then 'Resort Hotel'
        else 'Unknown'
    end as hotel_type,

    split_part(hotel, ' - ', 2) as hotel_city

from {{ source('raw', 'RAW_HOTEL_BOOKINGS') }}

where

      coalesce(adults, 0)
    + coalesce(children, 0)
    + coalesce(babies, 0) > 0

  and adr >= 0