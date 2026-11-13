-- Singular test: verify that no bookings in the mart fact table have a negative Average Daily Rate (ADR)
select
    *
from {{ ref('fct_bookings') }}
where adr < 0