-- tiv_2015がuniqueじゃダメ
-- lat, lon pairがuniqueじゃないとダメ
-- 以上の条件を満たすレコードを取得
-- tiv_2015でgroup byしてcount = 1のレコードを除外
-- lat, lonでgroup byしてcount = 1のレコードを取得
select
;

with multi_2015 as (
  select
    tiv_2015
  from
    Insurance
  group by
    tiv_2015
  having
    count(*) != 1
),
uniq_lat_lon as (
  select
    lat,
    lon
  from
    Insurance
  group by
    lat,
    lon
  having
    count(*) = 1
)
select
  round(sum(tiv_2016), 2) as tiv_2016
from
  Insurance
where
  tiv_2015 in (
    select
      tiv_2015
    from
      multi_2015
  )
  and (lat, lon) in (
    select
      lat,
      lon
    from
      uniq_lat_lon
  )
