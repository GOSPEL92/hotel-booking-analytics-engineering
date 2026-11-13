{{ config(materialized='view') }}

select distinct

    market_segment,
    distribution_channel

from {{ ref('stg_hotel_bookings') }}