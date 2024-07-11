select
    {{ dbt_utils.star(from=ref('rental_fact'), relation_alias='rental_fact', except=[
        "customer_key", "inventory_key", "payment_key"
    ]) }},
    {{ dbt_utils.star(from=ref('cust_loc_dim'), relation_alias='cust_loc_dim', except=["customer_key", "customer_id", "last_update"]) }},
    {{ dbt_utils.star(from=ref('film_inv_dim'), relation_alias='film_inv_dim', except=["inventory_key", "last_update", "inventory_id"]) }},
    {{ dbt_utils.star(from=ref('paymnt_dim'), relation_alias='paymnt_dim', except=["payment_key", "rental_id", "payment_id"]) }}
from {{ ref('rental_fact') }} as rental_fact
left join {{ ref('cust_loc_dim') }} as cust_loc_dim on rental_fact.customer_key = cust_loc_dim.customer_key
left join {{ ref('film_inv_dim') }} as film_inv_dim on rental_fact.inventory_key = film_inv_dim.inventory_key
left join {{ ref('paymnt_dim') }} as paymnt_dim on rental_fact.payment_key = paymnt_dim.payment_key