select
  u.name,
  ifnull(q.travelled_distance, 0) as travelled_distance
from
  Users u
  left join (
    select
      user_id,
      sum(distance) travelled_distance
    from
      Rides
    group by
      user_id
  ) q on u.id = q.user_id
order by
  q.travelled_distance desc,
  u.name asc
