{{ config(materialized='view') }}

select

    customer_type,

    count(*) as bookings,

    round(avg(adr),2) as avg_adr

from {{ ref('stg_hotel_bookings') }}

group by customer_type