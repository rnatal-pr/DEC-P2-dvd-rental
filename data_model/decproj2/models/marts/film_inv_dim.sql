{{ config(materialized='table') }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['inventory_id']) }} as inventory_key,
    inventory_id,
    inv_tab.film_id,
    cat_tab.category_id
    title,
    description,
    release_year,
    rental_duration,
    rental_rate,
    length,
    replacement_cost,
    rating,
    fulltext,
    special_features,
    name as category_name,
    film_tab.last_update
FROM {{ ref('inventory') }} as inv_tab
LEFT JOIN {{ ref('film') }} as film_tab
    ON inv_tab.film_id = film_tab.film_id
LEFT JOIN {{ ref('film_category') }} as fcat_tab
    ON film_tab.film_id = fcat_tab.film_id
LEFT JOIN {{ ref('category') }} as cat_tab
    ON fcat_tab.category_id = cat_tab.category_id
