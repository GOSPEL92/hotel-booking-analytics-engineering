-- Cancellation Analysis

select

    is_canceled,

    count(*) as bookings

from HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS

group by is_canceled;

-- Reservation Status

select

    reservation_status,

    count(*) as bookings

from HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS

group by reservation_status;

-- Deposit Types

select

    deposit_type,

    count(*) as bookings

from HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS

group by deposit_type;

-- Customer Types

select

    customer_type,

    count(*) as bookings

from HOTEL_BOOKING_ANALYTICS.RAW.RAW_HOTEL_BOOKINGS

group by customer_type;