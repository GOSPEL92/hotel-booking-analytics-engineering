-- Quarantine Records

select
    count(*) as quarantine_records
from {{ ref('quarantine_hotel_bookings') }};

-- Clean Records

select
    count(*) as clean_records
from {{ ref('stg_hotel_bookings') }};

-- Country Validation

select
    count(*) as countries
from {{ ref('dim_country') }};

-- Hotel Validation

select
    count(*) as hotels
from {{ ref('dim_hotel') }};

-- Booking Validation

select
    count(*) as bookings
from {{ ref('fct_bookings') }};