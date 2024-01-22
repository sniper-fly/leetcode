-- between "2013-10-01" and "2013-10-03" で絞る
-- tripsテーブルからbanned userを取り除く
-- users tableからroleがclientで、bannedがyesのuserを取り出す ...(a)
-- driverでも同様に ...(b)
-- client_id in (a) or driver_id in (b) のrowを表示しないようにする
-- completedなら0、それ以外なら1となるカラムを作る...(c)
-- request_at でgroup して (c)のカラムのavgを求めてround
-- select request_at, 
select
  request_at as Day,
  round(avg(status), 2) as 'Cancellation Rate'
from
  (
    select
      id,
      request_at,
      if(status = 'completed', 0, 1) as status
    from
      Trips
    where
      request_at between "2013-10-01"
      and "2013-10-03"
      and client_id not in (
        select
          users_id
        from
          Users
        where
          banned = 'Yes'
          and role = 'client'
      )
      and driver_id not in (
        select
          users_id
        from
          Users
        where
          banned = 'Yes'
          and role = 'driver'
      )
  ) q
group by
  request_at
