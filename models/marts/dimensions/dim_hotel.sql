{{ config(materialized='view') }}

select distinct

    hotel,
    hotel_type,
    hotel_city

from {{ ref('stg_hotel_bookings') }}