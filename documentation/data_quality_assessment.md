# Data Quality Assessment

## Assessment Overview

The Hotel Booking dataset was profiled after ingestion into Snowflake to identify data quality issues, business-process anomalies, and records requiring remediation prior to analytical consumption.

Source Table:

RAW_HOTEL_BOOKINGS

Total Records:

119,390

---

## Duplicate Record Analysis

### Objective

Identify duplicate records within the source system.

### Findings

| Metric | Value |
|----------|---------:|
| Total Records | 119,390 |
| Distinct Records | 119,390 |

### Outcome

No duplicate records were identified.

The dataset demonstrated full row-level uniqueness and did not require duplicate-removal logic during ingestion.

---

## Missing Value Analysis

| Column | Missing Records |
|----------|---------------:|
| COUNTRY | 488 |
| CHILDREN | 4 |
| AGENT | 16,340 |
| COMPANY | 112,593 |
| CITY | 0 |

### Assessment

#### COUNTRY

A small number of records contain missing geographical information.

Impact:

Country-based reporting may underrepresent a small portion of bookings.

Action:

Retain records.

#### CHILDREN

Only four records contain missing children values.

Impact:

Minimal.

Action:

Replace null values with zero during staging.

#### AGENT

A significant number of records contain missing agent identifiers.

Assessment:

Likely represents direct bookings rather than a data quality defect.

Action:

Retain records.

#### COMPANY

Most bookings do not contain a company value.

Assessment:

Likely represents individual travellers rather than corporate reservations.

Action:

Retain records.

---

## Invalid Guest Analysis

### Rule

Adults + Children + Babies = 0

### Findings

| Metric | Value |
|----------|---------:|
| Invalid Guest Records | 180 |

### Assessment

Bookings containing no guests are considered invalid business events.

### Action

Records are routed to:

quarantine_hotel_bookings

---

## ADR Validation

### Rule

ADR < 0

### Findings

| Metric | Value |
|----------|---------:|
| Negative ADR Records | 1 |

### Assessment

Average Daily Rate cannot be negative for a completed booking.

### Action

Record routed to:

quarantine_hotel_bookings

---

## Market Segment Validation

### Findings

Two records contained:

- MARKET_SEGMENT = 'Undefined'
- DISTRIBUTION_CHANNEL = 'Undefined'

### Assessment

Records represent valid business events and do not violate quality standards.

### Action

Retained for analytical processing.

---

## Data Quality Outcomes

| Category | Result |
|----------|---------|
| Duplicate Records | None Found |
| Invalid Guest Records | 180 |
| Negative ADR Records | 1 |
| Missing Country Values | 488 |
| Missing Agent Values | 16,340 |
| Missing Company Values | 112,593 |

### Final Remediation Strategy

Records violating critical business rules were isolated in:

quarantine_hotel_bookings

Analytics-ready records were processed through:

stg_hotel_bookings

for downstream analytical modeling.

## Conclusion

The dataset contained a small number of critical quality failures and several expected business-process null values. A quarantine strategy was implemented to preserve analytical integrity while retaining legitimate business records for reporting and downstream dimensional modeling.