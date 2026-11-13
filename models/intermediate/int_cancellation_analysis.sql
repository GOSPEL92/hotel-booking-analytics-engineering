{{ config(materialized='view') }}

select

    hotel_type,

    market_segment,

    customer_type,

    booking_status,

    count(*) as booking_count

from {{ ref('stg_hotel_bookings') }}

group by

    hotel_type,
    market_segment,
    customer_type,
    booking_status
    