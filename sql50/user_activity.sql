select
  activity_date as day,
  sum(
    if(
      activity_type not in ('open_session', 'end_session'),
      1,
      0
    )
  ) as active_users
from
  Activity
group by
  activity_date
having
  active_users != 0;

select
  activity_date as day,
  count(distinct user_id) as active_users
from
  Activity
group by
  activity_date
having
  active_users != 0
  and datediff(date('2019-07-27'), day) < 30
  and day <= date('2019-07-27')
