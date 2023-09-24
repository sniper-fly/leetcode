select
  u.product_id,
  p.price,
  u.units,
  round(sum(p.price * u.units) / sum(u.units), 2) as average_price,
  u.purchase_date,
  p.start_date,
  p.end_date
from
  UnitsSold u
  left join Prices p on u.product_id = p.product_id
  and u.purchase_date between p.start_date
  and p.end_date
group by
  u.product_id;

select
  p.product_id,
  ifnull(
    round(sum(p.price * u.units) / sum(u.units), 2),
    0
  ) as average_price
from
  Prices p
  left join UnitsSold u on p.product_id = u.product_id 
  and u.purchase_date between p.start_date
  and p.end_date
group by
  p.product_id
