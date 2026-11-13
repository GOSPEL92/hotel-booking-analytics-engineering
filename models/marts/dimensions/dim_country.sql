{{ config(materialized='view') }}

select distinct

    country

from {{ ref('stg_hotel_bookings') }}

where country is not null