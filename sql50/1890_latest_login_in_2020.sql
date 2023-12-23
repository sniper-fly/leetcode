select
  user_id,
  time_stamp as last_stamp
from
  (
    select
      user_id,
      time_stamp,
      row_number() over (
        partition by user_id
        order by
          time_stamp desc
      ) as seiri
    from
      Logins
    where
      -- year(time_stamp) = 2020
      time_stamp like '2020%'
  ) q
where
  q.seiri = 1;

select
  user_id,
  max(time_stamp) as last_stamp
from
  Logins
where
  time_stamp like '2020%'
  -- year(time_stamp) = 2020
group by
  user_id
