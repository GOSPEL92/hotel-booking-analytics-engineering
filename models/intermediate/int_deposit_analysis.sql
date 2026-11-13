{{ config(materialized='view') }}

select

    deposit_type,

    booking_status,

    count(*) as bookings

from {{ ref('stg_hotel_bookings') }}

group by

    deposit_type,
    booking_status