{{ config(materialized='table') }}

-- drops payments with more than one rental
WITH id_count AS 
(
    SELECT 
        rental_id,
        COUNT(*)
    FROM {{ ref('payment') }}
    GROUP BY rental_id
    HAVING COUNT(*) > 1
    )

SELECT
    {{ dbt_utils.generate_surrogate_key(['rental_id']) }} as payment_key,
    payment_id, 
    rental_id,
    amount,
    payment_date
FROM {{ ref('payment') }}
WHERE rental_id NOT IN
(
    SELECT rental_id 
    FROM id_count
    )
ORDER BY rental_id