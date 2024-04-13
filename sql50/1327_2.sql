select
  p.product_name,
  q.unit
from
(
    select
      product_id,
      sum(o.unit) as unit
    from
      Orders o
    where
      month(o.order_date) = 2
      and year(o.order_date) = 2020
    group by
      o.product_id
    having
      sum(o.unit) >= 100
  ) q
  join Products p using(product_id)
