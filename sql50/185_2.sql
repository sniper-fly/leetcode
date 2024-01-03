-- dense rank でdepartmentごとに3位までのnameを表示する
select
  Department,
  Employee,
  Salary
from
  (
    select
      d.name as Department,
      e.name as Employee,
      e.salary as Salary,
      dense_rank() over(
        partition by e.departmentId
        order by
          salary desc
      ) as ranking
    from
      Employee e
      join Department d on e.departmentId = d.id
  ) q
where
  ranking <= 3;

-- dense rank でdepartmentごとに3位までのnameを表示する
select
  d.name as Department,
  q.Employee,
  q.Salary
from
  (
    select
      e.departmentId,
      e.name as Employee,
      e.salary as Salary,
      dense_rank() over(
        partition by e.departmentId
        order by
          salary desc
      ) as ranking
    from
      Employee e
  ) q
  join Department d on q.departmentId = d.id
where
  ranking <= 3
