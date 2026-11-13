# Business Rule Discovery

## Cancellation Classification

Analysis identified the following relationships:

| IS_CANCELED | RESERVATION_STATUS |
|-------------|-------------------|
| 0 | Check-Out |
| 1 | Canceled |
| 1 | No-Show |

### Findings

Total Bookings:
119,390

Completed Stays:
75,166

Cancelled or No-Show Bookings:
44,224

Cancellation Rate:
37.04%

## Deposit Types

Valid values identified:

- No Deposit
- Non Refund
- Refundable

## Customer Types

Valid values identified:

- Transient
- Transient-Party
- Contract
- Group

## Market Segments

Valid segments identified:

- Online TA
- Offline TA/TO
- Groups
- Direct
- Corporate
- Complementary
- Aviation

An additional segment value of 'Undefined' was identified in two records and retained as a valid source-system value.