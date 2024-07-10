{{ config(materialized='table') }}

SELECT
    rental_id,
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['inventory_id']) }} as inventory_key,
    {{ dbt_utils.generate_surrogate_key(['rental_id']) }} as payment_key,
    customer_id,
    inventory_id,
    rental_date,
    return_date,
    last_update
FROM {{ ref('rental') }}