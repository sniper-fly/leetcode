select
  player_id,
  event_date as first_login
from
  (
    select
      player_id,
      event_date,
      row_number() over(
        partition by player_id
        order by
          event_date
      ) as row_num
    from
      Activity
  ) q
where
  row_num = 1;

select
  player_id,
  min(event_date) as first_login
from
  Activity
group by player_id
