select
  id,
  case
    when (
      select
        count(*)
      from
        Seat
    ) % 2 = 1
    and id = (
      select
        count(*)
      from
        Seat
    ) then student
    when id % 2 = 1 then lead(student) over(
      order by
        id
    )
    else lag(student) over(
      order by
        id
    )
  end as student
from
  Seat
