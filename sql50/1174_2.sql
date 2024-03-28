select
  round(avg(is_immediate) * 100, 2) as immediate_percentage
from
  (
    select
      order_date,
      customer_pref_delivery_date,
      row_number() over (
        partition by customer_id
        order by
          order_date
      ) as ranking,
      if(order_date = customer_pref_delivery_date, 1, 0) as is_immediate
    from
      Delivery
  ) q
where
  ranking = 1
