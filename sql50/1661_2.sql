select
  machine_id,
  round(avg(processing_time), 3) as processing_time
from
  (
    select
      machine_id,
      process_id,
      sum(
        if(
          activity_type = "start",
          -1 * timestamp,
          timestamp
        )
      ) as processing_time
    from
      Activity
    group by
      machine_id,
      process_id
  ) q
group by
  machine_id
