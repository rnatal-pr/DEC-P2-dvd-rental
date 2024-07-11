{{ config(materialized='table') }}

select
    film_id,
    title,
    description,
    release_year,
    rental_duration,
    rental_rate,
    length,
    replacement_cost,
    rating,
    special_features,
    fulltext,
    last_update
from {{ source('dvd_rental','film') }}