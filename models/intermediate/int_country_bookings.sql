{{ config(materialized='view') }}

select

    country,

    count(*) as total_bookings,

    round(avg(adr),2) as avg_adr

from {{ ref('stg_hotel_bookings') }}

where country is not null

group by country