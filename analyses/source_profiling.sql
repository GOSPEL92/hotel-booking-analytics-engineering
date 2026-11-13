-- Record Count

select
    count(*) as total_records
from HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS;

-- Distinct Record Count

select
    count(*) as distinct_records
from (
    select distinct *
    from HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS
);

-- Column Profiling

desc table HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS;