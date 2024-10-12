WITH source AS (

    SELECT * FROM {{ source('postgres', 'addresses') }}

),


renamed AS (
    SELECT
        address_id::VARCHAR AS address_guid,
        address,
        zipcode,
        state,
        country

    FROM source)
select * from renamed
