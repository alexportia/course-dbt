WITH source AS (

    SELECT * FROM {{ source('postgres', 'users') }}

),


renamed AS (
    SELECT
        user_id AS user_guid,
        first_name,
        last_name,
        email,
        phone_number,
        created_at AS user_created_at_utc,
        updated_at AS user_updated_at_utc,
        address_id AS address_guid

    FROM source)
select * from renamed
