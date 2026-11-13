{{ config(materialized='view') }}

select

    market_segment,

    count(*) as bookings,

    round(avg(adr),2) as avg_adr

from {{ ref('stg_hotel_bookings') }}

group by market_segment