with events as (
    SELECT * FROM {{ ref('_stg_postgres__events') }}
    WHERE event_type = 'page_view'
)

,users as (
    SELECT * FROM {{ ref('_stg_postgres__users') }}
)

, addresses as (
    SELECT * FROM {{ ref('_stg_postgres__addresses') }}
)

, products as (
    SELECT * FROM {{ ref('_stg_postgres__products') }}
)

SELECT
    e.event_guid
    , e.created_at_utc as event_created_at_utc
    , e.user_guid
    , a.state
    , a.country
    , u.user_created_at_utc
    , p.product_name
    , p.product_price


FROM events e
LEFT JOIN users u
    ON u.user_guid = e.user_guid
LEFT JOIN products p
    ON e.product_guid = p.product_guid
LEFT JOIN addresses a
    ON u.address_guid = a.address_guid
