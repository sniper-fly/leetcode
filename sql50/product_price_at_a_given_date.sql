with latest_changes as (
  select
    p1.product_id,
    p1.latest_change,
    p2.new_price
  from
    (
      select
        product_id,
        max(change_date) as latest_change
      from
        Products
      where
        change_date <= date('2019-08-16')
      group by
        product_id
    ) p1
    join Products p2 on p1.product_id = p2.product_id
    and p1.latest_change = p2.change_date
),
all_products as (
  select
    distinct product_id
  from
    Products
)
select
  a.product_id,
  coalesce(l.new_price, 10) as price
from
  all_products a
left join latest_changes l on a.product_id = l.product_id
