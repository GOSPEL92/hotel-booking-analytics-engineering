{{ config(materialized='view') }}

select *

from {{ source('raw', 'RAW_HOTEL_BOOKINGS') }}

where

      coalesce(adults, 0)
    + coalesce(children, 0)
    + coalesce(babies, 0) = 0

   or adr < 0