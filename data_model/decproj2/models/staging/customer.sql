{{ config(materialized='table') }}

select
    customer_id,
    first_name,
    last_name,
    email,
    address_id,
    activebool,
    active,
    create_date,
    last_update
from {{ source('dvd_rental','customer') }}