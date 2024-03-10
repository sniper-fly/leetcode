select
  p.product_name,
  s.year,
  s.price
from
  Sales s
  join Product p using(product_id)
