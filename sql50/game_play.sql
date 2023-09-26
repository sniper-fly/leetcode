select
  round(
    count(distinct a1.player_id) / (
      select
        count(distinct player_id)
      from
        Activity
    ),
    2
  ) as fraction -- a1.player_id,
  -- a1.event_date,
  -- a2.event_date
from
  Activity a1
  join Activity a2 on a1.event_date - a2.event_date = 1
  and a1.player_id = a2.player_id;

select
  round(
    count(distinct a1.player_id) / (
      select
        count(distinct player_id)
      from
        Activity
    ),
    2
  ) as fraction
  -- count(distinct a1.player_id),
  -- (
  --   select
  --     count(distinct player_id)
  --   from
  --     Activity
  -- ) as count_total
from
  Activity a1
  join (
    select
      player_id,
      min(event_date) as first_login
    from
      Activity
    group by
      player_id
  ) a2 on datediff(a1.event_date, a2.first_login) = 1
  and a1.player_id = a2.player_id

player毎の最初のログインを記録したテーブルを作る 任意の日付 - 最初のログイン = 1 となるようなカラムを結合する;

(
  select
    player_id,
    min(event_date) as first_login
  from
    Activity
  group by
    player_id
)
