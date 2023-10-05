select
  customer_id
from
  Customer
where
  product_key in (
    select
      product_key
    from
      Product
  )
group by
  customer_id
having
  count(distinct product_key) = (
    select
      count(*)
    from
      Product
  )
