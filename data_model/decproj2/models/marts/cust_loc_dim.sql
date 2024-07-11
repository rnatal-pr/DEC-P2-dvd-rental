{{ config(materialized='table') }}

SELECT
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    customer_id,
    cust_tab.address_id,
    add_tab.city_id,
    city_tab.country_id,
    first_name,
    last_name,
    email,
    activebool,
    active,
    address,
    address2,
    district,
    postal_code,
    phone,
    city,
    country,
    create_date,
    city_tab.last_update
FROM {{ ref('customer') }} as cust_tab
LEFT JOIN {{ ref('address') }} as add_tab
    ON cust_tab.address_id = add_tab.address_id
LEFT JOIN {{ ref('city') }} as city_tab
    ON add_tab.city_id = city_tab.city_id
LEFT JOIN {{ ref('country' )}} as cntry_tab
    ON city_tab.country_id = cntry_tab.country_id