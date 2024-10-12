WITH source AS (

    SELECT * FROM {{ source('postgres', 'promos') }}

),


renamed AS (
    SELECT
        promo_id AS promo_guid,
        discount AS promo_discount,
        status AS promo_status

    FROM source)
select * from renamed
