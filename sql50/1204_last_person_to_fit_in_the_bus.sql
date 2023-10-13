select
  person_name
from
  (
    select
      *,
      sum(weight) over(
        order by
          turn
      ) as total
    from
      Queue
    order by turn
  ) q
where q.total <= 1000
order by q.total desc
limit 1
