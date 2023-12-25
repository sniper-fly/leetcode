select
  (
    select
      distinct salary
    from
      Employee
    order by
      salary
    limit
      1 offset 1
  ) as SecondHighestSalary;

select
  (
    select
      salary
    from
      (
        select
          salary,
          dense_rank() over(
            order by
              salary
          ) as ranking
        from
          Employee
      ) q
    where
      ranking = 2
  ) as SecondHighestSalary;
