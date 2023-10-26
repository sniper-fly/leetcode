select
  sell_date,
  count(*) as num_sold,
  group_concat(
    product
    order by
      product
  ) as products
from
  (
    select
      distinct sell_date,
      product
    from
      Activities
  ) q
group by
  sell_date
order by
  sell_date
