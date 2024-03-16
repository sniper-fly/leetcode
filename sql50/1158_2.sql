select
  u.user_id as buyer_id,
  u.join_date,
  ifnull(orders_in_2019, 0) as orders_in_2019
from
  Users u
  left join (
    select
      buyer_id,
      count(*) as orders_in_2019
    from
      Orders
    where
      order_date between '2019-01-01'
      and '2019-12-31'
    group by
      buyer_id
  ) q on u.user_id = q.buyer_id
