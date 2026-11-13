{{
    config(
        materialized='view'
    )
}}

select
    market_segment,
    deposit_type,
    count(*) as total_bookings,
    round(avg(lead_time), 2) as avg_lead_time,
    min(lead_time) as min_lead_time,
    max(lead_time) as max_lead_time,
    round(avg(adr), 2) as avg_adr
from {{ ref('stg_hotel_bookings') }}
group by 
    market_segment,
    deposit_type