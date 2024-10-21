with events as (
    SELECT * FROM {{ ref('stg_postgres__events') }}),

intermediate_transformation as (
    SELECT
        user_guid
        ,session_guid
        ,sum(case when event_type = 'add_to_cart' then 1 end) as add_to_cart_nr_events
        ,sum(case when event_type = 'checkout' then 1 end) as checkout_nr_events
        ,sum(case when event_type = 'package_shipped' then 1 end) as package_shipped_nr_events
        ,sum(case when event_type = 'page_view' then 1 end) as page_view_nr_events
        ,min(created_at_utc) as first_session_event_at_utc
        ,max(created_at_utc) as last_session_event_at_utc
    FROM events
    GROUP BY 1,2
)

SELECT * FROM intermediate_transformation
