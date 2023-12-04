-- banされたclientのリストを作成する
-- banされたdriverのリストを作成する
-- where not in ban_clients and not in ban_drivers
-- group by request_at
-- case when status like 'cancelled%' then 1 else 0 as status_calc
with ctx as (
  select
    -- status,
    -- id,
    request_at,
    case
      when status like 'cancelled%' then 1
      else 0
    end as status_calc
  from
    Trips
  where
    -- not exists (
    --   select
    --     1
    --   from
    --     Users
    --   where
    --     (
    --       client_id = users_id
    --       and banned = 'Yes'
    --     )
    --     or (
    --       driver_id = users_id
    --       and banned = 'Yes'
    --     )
    -- )
    client_id not in (
      select
        users_id
      from
        Users
      where
        role = 'client'
        and banned = 'Yes'
    )
    and driver_id not in (
      select
        users_id
      from
        Users
      where
        role = 'driver'
        and banned = 'Yes'
    )
    and request_at between '2013-10-01'
    and '2013-10-03'
)
select
  request_at as Day,
  round(sum(status_calc) / count(*), 2) as 'Cancellation Rate'
from
  ctx
group by
  request_at;

WITH CTE AS (
  SELECT
    DISTINCT request_at AS 'Day',
    CAST(
      COUNT(status) OVER(PARTITION BY request_at) AS DECIMAL(10, 2)
    ) TotalRequest,
    -- count total request by each day
    COUNT(
      CASE
        WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1
        ELSE NULL
      END
    ) OVER(PARTITION BY request_at) TotalCancelRequest -- count total cancel request by each day 
  FROM
    Trips T
  WHERE
    (
      T.request_at > '2013-09-29'
      AND T.request_at < '2013-10-04'
    ) -- filter request_at from '2013-10-01' to '2013-10-03'
    AND NOT EXISTS(
      SELECT
        1
      FROM
        Users U
      WHERE
        (
          T.client_id = U.users_id
          AND U.banned = 'YES'
        )
        OR (
          T.driver_id = U.users_id
          AND U.banned = 'YES'
        ) --in this step we filter banned users
        --then we remove the filtered users (by sytax not exists)
    )
)
SELECT
  Day,
  ROUND(TotalCancelRequest / TotalRequest, 2) AS 'Cancellation Rate' -- cal cancel rate
FROM
  CTE
