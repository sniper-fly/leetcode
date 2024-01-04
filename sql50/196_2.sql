delete from
  Person
where
  id in (
    select
      max(id) as id
    from
      Person
    group by
      email
    having
      count(*) >= 2
  );

delete p1
from
  Person p1,
  Person p2
where
  p1.email = p2.email
  and p1.id > p2.id
