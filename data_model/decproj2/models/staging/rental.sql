{{ config(materialized='table') }}

select
    rental_id,
    inventory_id,
    customer_id,
    rental_date,
    return_date,
    last_update
from {{ source('dvd_rental','rental') }}