select
  s.user_id,
  ifnull(q.confirmation_rate, 0) as confirmation_rate
from
  Signups s
  left join (
    select
      user_id,
      round(avg(if(action = 'confirmed', 1.00, 0.00)), 2) as confirmation_rate
    from
      Confirmations
    group by
      user_id
  ) q using(user_id);
