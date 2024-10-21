with session_events_agg as (
    SELECT * FROM {{ ref('int_session_event_agg') }}
)

, users as (
    SELECT * FROM {{ ref('_stg_postgres__users') }}
)

, addresses as (
    SELECT * FROM {{ ref('_stg_postgres__addresses') }}
)

SELECT
    sea.session_guid
    , u.first_name
    , u.last_name
    , u.email
    , u.phone_number
    , a.address_guid
    , a.address
    , a.zipcode
    , a.state
    , a.country
    , sea.add_to_cart_nr_events
    , sea.checkout_nr_events
    , sea.package_shipped_nr_events
    , sea.page_view_nr_events
    , sea.first_session_event_at_utc
    , sea.last_session_event_at_utc
    , sea.length_session

FROM session_events_agg sea
LEFT JOIN users u
    ON u.user_guid = sea.user_guid
LEFT JOIN addresses a
    ON u.address_guid = a.address_guid
