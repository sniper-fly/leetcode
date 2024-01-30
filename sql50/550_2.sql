-- 最初のログインから連続ログインしているプレイヤー数 / プレイヤー全員数(distinct)
-- with consecutive_player as (
-- ),
-- total_players (
-- )
-- select
--   round(
--     (
--       select
--         count(distinct player_id)
--       from
--         (
--           select
--             a1.player_id
--           from
--             Activity a1
--             join Activity a2 on a1.player_id = a2.player_id
--             and date_add(a1.event_date, interval 1 day) = a2.event_date
--         ) q
--     ) / (
--       select
--         count(distinct player_id)
--       from
--         Activity
--     ),
--     2
--   ) as fraction
-- プレイヤーの最初のログイン判定
-- group by してminで出す
-- date_addして、player_id と event_date + 1 が等しいカラムをwhereで抜き出してカウント

select
  round(
    (
      select
        count(distinct player_id)
      from
        Activity
      where
        (
          player_id,
          date_sub(event_date, interval 1 day)
        ) in (
          select
            player_id,
            min(event_date)
          from
            Activity
          group by
            player_id
        )
    ) / (
      select
        count(distinct player_id)
      from
        Activity
    ),
    2
  ) as fraction
