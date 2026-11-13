{{ config(materialized='view') }}

select distinct

    customer_type

from {{ ref('stg_hotel_bookings') }}