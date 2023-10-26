select
  coalesce(salary, null) as SecondHighestSalary
from
  (
    select
      salary,
      rank() over(
        order by
          salary
      ) as ranking
    from
      Employee
  ) q
where
  ranking = 2;

select
  max(salary) as SecondHighestSalary
from
  Employee
where
  salary < (
    select
      max(salary) as maxSalary
    from
      Employee
  )
