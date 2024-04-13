select
  p.product_name,
  sum(o.unit) as unit
from
  Orders o
  join Products p using(product_id)
where
  month(o.order_date) = 2 and year(o.order_date) = 2020
group by
  o.product_id
having
  sum(o.unit) >= 100
