select
  product_name,
  sum(unit) as unit
from
  (
    select
      p.product_name,
      o.order_date,
      o.unit
    from
      Orders o
      join products p on o.product_id = p.product_id
    where
      date_format(o.order_date, '%Y-%m') = '2020-02'
  ) q
group by
  product_name
having
  unit >= 100
