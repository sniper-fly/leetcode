select
  id,
  lag(id, 1) over(
    order by
      recordDate
  ) as before1day
from
  Weather;

select
  w2.id
from
  Weather w1
  join Weather w2 on date_add(w1.recordDate, interval 1 day) = w2.recordDate
where
  w1.temperature < w2.temperature
