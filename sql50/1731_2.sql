select
  employee_id,
  name,
  reports_count,
  average_age
from
  (
    select
      reports_to as employee_id,
      count(*) as reports_count,
      round(avg(age), 0) as average_age
    from
      Employees
    where
      reports_to is not null
    group by
      reports_to
  ) q
  join Employees e using(employee_id)
order by
  employee_id
