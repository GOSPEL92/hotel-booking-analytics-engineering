-- Missing Values

select

    count_if(country is null) as null_country,

    count_if(children is null) as null_children,

    count_if(agent is null) as null_agent,

    count_if(company is null) as null_company

from HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS;

-- Invalid Guest Records

select
    count(*) as invalid_guest_records
from HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS
where
      coalesce(adults,0)
    + coalesce(children,0)
    + coalesce(babies,0) = 0;

-- Negative ADR

select
    count(*) as negative_adr_records
from HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS
where adr < 0;