-- select if(id % 2 = 1, )
select
  id,
  case
    when next is null
    and id % 2 = 1 then student
    when id % 2 = 1 then next
    else prev
  end as student
from
  (
    select
      id,
      student,
      lead(student, 1) over (
        order by
          id
      ) as next,
      lag(student, 1) over (
        order by
          id
      ) as prev
    from
      Seat
  ) q
