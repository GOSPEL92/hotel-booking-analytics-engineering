{{ config(materialized='view') }}

select

    hotel,

    country,

    customer_type,

    market_segment,

    distribution_channel,

    booking_status,

    deposit_type,

    adr,

    lead_time,

    adults,

    children,

    babies,

    reservation_status,

    reservation_status_date

from {{ ref('stg_hotel_bookings') }}