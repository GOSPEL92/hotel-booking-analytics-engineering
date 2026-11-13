{% snapshot snap_hotel_bookings_status %}

{{
    config(
      target_schema='snapshots',
      unique_key='booking_snapshot_key',
      strategy='check',
      check_cols=['is_canceled', 'reservation_status', 'reservation_status_date', 'adr'],
      invalidate_hard_deletes=True
    )
}}

select
    md5(
        concat_ws(
            '|',
            coalesce(hotel, ''),
            coalesce(cast(lead_time as varchar), ''),
            coalesce(country, ''),
            coalesce(market_segment, ''),
            coalesce(customer_type, ''),
            coalesce(cast(adr as varchar), ''),
            coalesce(cast(reservation_status_date as varchar), '')
        )
    ) as booking_snapshot_key,
    hotel,
    lead_time,
    is_canceled,
    reservation_status,
    reservation_status_date,
    adr,
    country,
    market_segment,
    customer_type
from {{ ref('stg_hotel_bookings') }}

{% endsnapshot %}