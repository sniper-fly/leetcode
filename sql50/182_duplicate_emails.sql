select
  distinct k.email
from
  (
    select
      q.email
    from
      (
        select
          email,
          lead(email, 1) over (
            order by
              email
          ) as lead_email
        from
          Person
      ) q
    where
      q.email = q.lead_email
  ) k
