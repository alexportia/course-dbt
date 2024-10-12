WITH source AS (

    SELECT * FROM {{ source('postgres', 'order_items') }}

),


renamed AS (
    SELECT
        order_id AS order_guid,
        product_id AS product_guid,
        quantity

    FROM source)
select * from renamed
