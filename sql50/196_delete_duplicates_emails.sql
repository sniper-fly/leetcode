delete from
  Person
where
  id in (
    select
      id
    from
      (
        select
          id,
          count(*) over (
            partition by email
            order by
              id
          ) as count
        from
          Person
      ) q
    where
      count >= 2
  )
