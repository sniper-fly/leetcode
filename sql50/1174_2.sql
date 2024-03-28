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
  ranking = 1;

select
  round(
    avg((order_date = customer_pref_delivery_date) * 100),
    2
  ) as immediate_percentage
from
  Delivery
where
  (customer_id, order_date) in (
    select
      customer_id,
      min(order_date) as first_date
    from
      Delivery
    group by
      customer_id
  )
