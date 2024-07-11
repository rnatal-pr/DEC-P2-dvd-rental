{{ config(materialized='table') }}

select 
    address_id,
    address,
    address2,
    district,
    city_id,
    cast(postal_code as varchar) as postal_code,
    cast(phone as varchar) as phone,
    last_update
from {{ source('dvd_rental','address') }}