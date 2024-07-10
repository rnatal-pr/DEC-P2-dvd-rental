{{ config(materialized='table') }}

select
    city_id,
    city,
    country_id,
    last_update
from {{ source('dvd_rental','city') }}