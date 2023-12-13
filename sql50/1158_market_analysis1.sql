select
  u.user_id as buyer_id,
  u.join_date,
  coalesce(q1.orders_in_2019, 0) as orders_in_2019
from
  Users u
  left join (
    select
      buyer_id,
      sum(is_subject) as orders_in_2019
    from
      (
        select
          buyer_id,
          if(
            order_date between '2019-01-01'
            and '2019-12-31',
            1,
            0
          ) as is_subject
        from
          Orders
      ) q
    group by
      buyer_id
  ) q1 on u.user_id = q1.buyer_id
