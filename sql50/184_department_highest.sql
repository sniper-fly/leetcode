-- departmentごとに分けて、最大のsalaryを持っているnameを探す
-- まず、最大のsalaryをEmployee tableから調べる
-- salary と一致する行を表示
select
  q.Department,
  q.name as Employee,
  q.salary
from
  (
    select
      e.name,
      e.salary,
      e.departmentId,
      d.name as Department,
      rank() over(
        partition by departmentId
        order by
          salary desc
      ) as s_rank
    from
      Employee e
      join Department d on e.departmentId = d.id
  ) q
where
  q.s_rank = 1
