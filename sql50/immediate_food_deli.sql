select
  round(
    avg(
      if(order_date = customer_pref_delivery_date, 1, 0)
    ),
    2
  ) * 100 as immediate_percentage
from
  Delivery;

select
  round(
    avg(
      if(order_date = customer_pref_delivery_date, 100, 0)
    ),
    2
  ) as immediate_percentage
  -- d1.customer_id,
  -- d1.order_date,
  -- d1.customer_pref_delivery_date
from
  Delivery d1
  join (
    select
      customer_id,
      min(order_date) as min_order
    from
      Delivery
    group by
      customer_id
  ) d2 on d1.customer_id = d2.customer_id
  and d1.order_date = d2.min_order
