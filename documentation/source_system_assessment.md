# Source System Assessment

## Dataset Overview

Dataset Name:
Hotel Booking Demand (Modified 2024)

Platform:
Snowflake

Raw Table:
RAW_HOTEL_BOOKINGS

Total Records:
119,390

Total Columns:
32

## Source Profiling Summary

### Record Analysis

| Metric | Value |
|----------|---------:|
| Total Records | 119,390 |
| Distinct Records | 119,390 |

## Duplicate Analysis

### Findings
| Metric | Value |
|----------|---------:|
| Total Records | 119,390 |
| Distinct Records | 119,390 |
### Outcome
No exact duplicate records were identified within the source dataset.
The dataset demonstrates strong row-level uniqueness and does not require duplicate-removal logic during ingestion.

### Null Analysis

| Column | Missing Records |
|----------|---------------:|
| COUNTRY | 488 |
| CHILDREN | 4 |
| AGENT | 16,340 |
| COMPANY | 112,593 |
| CITY | 0 |

- COUNTRY contains 488 missing values (0.41% of records). The impact on geographical analysis is minimal, therefore records were retained for analytical processing.
- CHILDREN contains four missing values. Null values were standardized to zero during staging to support guest-count calculations.
- AGENT contains 16,340 missing values (13.69%). Investigation suggests these records represent direct bookings rather than invalid data and were retained.
- COMPANY contains 112,593 missing values (94.31%). The high null rate reflects individual traveler bookings rather than data quality failures. Records were retained for analysis.
## Initial Observations

- Arrival dates are stored in separate year, month, and day fields.
- Hotel names include both hotel type and city information.
- The dataset contains booking, cancellation, guest, and reservation attributes.
- Agent and company values appear to represent optional business attributes rather than data quality failures.