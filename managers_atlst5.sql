select
  e.name
from
  Employee e
  join (
    select
      e1.managerId,
      count(managerId)
    from
      Employee e1
    group by
      e1.managerId
    having
      count(managerId) >= 5
  ) e2 on e.id = e2.managerId
