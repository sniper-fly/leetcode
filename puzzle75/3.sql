create view Events (
  proc_id,
  comparison_proc,
  anest_name,
  event_time,
  event_type
) as (
  select
    p1.proc_id,
    p2.proc_id,
    p1.anest_name,
    p2.start_time,
    + 1
  from
    Procs as p1,
    Procs as p2
  where
    p1.anest_name = p2.anest_name
    and p2.end_time > p1.start_time
    and p2.start_time < p1.end_time -- and not (
    --   p2.end_time <= p1.start_time
    --   or p2.start_time >= p1.end_time
    -- )
  union
  select
    p1.proc_id,
    p2.proc_id,
    p1.anest_name,
    p2.end_time,
    - 1 as event_type
  from
    Procs as p1,
    Procs as p2
  where
    p1.anest_name = p2.anest_name
    and p2.end_time > p1.start_time
    and p2.start_time < p1.end_time -- and not (
    --   p2.end_time <= p1.start_time
    --   or p2.start_time >= p1.end_time
    -- )
);

SELECT
  proc_id,
  MAX(instantaneous_count) AS max_inst
from
  (
    SELECT
      E1.proc_id,
      E1.event_time,
      (
        SELECT
          SUM(E2.event_type)
        FROM
          Events AS E2
        WHERE
          E2.proc_id = E1.proc_id
          AND E2.event_time < E1.event_time
      ) AS instantaneous_count
    FROM
      Events AS E1
    ORDER BY
      E1.proc_id,
      E1.event_time
  ) q
GROUP BY
  proc_id;
