WITH source AS (

    SELECT * FROM {{ source('postgres', 'orders') }}

),


renamed AS (
    SELECT
        order_id AS order_guid,
        user_id AS user_guid,
        promo_id AS promo_guid,
        address_id AS address_guid,
        created_at AS created_at_utc,
        order_cost AS order_cost,
        shipping_cost AS shipping_cost,
        order_total AS order_total,
        tracking_id AS tracking_guid,
        shipping_service AS shipping_service,
        estimated_delivery_at AS estimated_delivery_at_utc,
        delivered_at AS delievered_at_utc,
        status::VARCHAR AS order_status

    FROM source)
select * from renamed
