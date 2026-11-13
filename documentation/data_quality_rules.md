# Data Quality Rules

## Rule 1 \- Invalid Guest Counts

Condition:
 Adults \+ Children \+ Babies = 0

Records Identified:
 180

Action:
 Move records to quarantine\_hotel\_bookings.

Reason:
 A reservation cannot exist without at least one guest.

## Rule 2 \- Negative ADR Values

Condition:

 ADR < 0

Records Identified:

1

Action:

Move records to quarantine\_hotel\_bookings.

Reason:

 Average Daily Rate cannot be negative for a completed stay.

## Rule 3 \- Missing Country Values

Condition:

 COUNTRY IS NULL

Records Identified:

488

Action:

Retain records for analytics while documenting the geographical data quality limitation.

Reason:

 Bookings remain valid despite missing country information.

## Rule 4 \- Missing Agent Values

Condition:

AGENT IS NULL

Records Identified:

16,340

Action:

 Retain records.

Reason:

 Likely represents direct bookings without travel agents.

## Rule 5 \- Missing Company Values

Condition:

 COMPANY IS NULL

Records Identified:

112,593

Action:

 Retain records.

Reason:

 Likely represents individual rather than corporate bookings.

