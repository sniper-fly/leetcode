-- tiv_2015 で group by して count > 1 の一覧を作る
-- lat, lon でgroup by してcount > 1 を弾いた一覧を作る
-- select sum(tiv_2016) from 
select
  round(sum(tiv_2016), 2) as tiv_2016
from
  Insurance
where
  tiv_2015 in (
    select
      tiv_2015
    from
      Insurance
    group by
      tiv_2015
    having
      count(*) > 1
  )
  and pid in (
    select
      pid
    from
      Insurance
    group by
      lat,
      lon
    having
      count(*) <= 1
  )
