select
  s.employee_id,
  e.name,
  s.reports_count,
  s.average_age
from
  (
    select
      reports_to as employee_id,
      count(reports_to) as reports_count,
      round(avg(age)) as average_age
    from
      Employees
    group by
      reports_to
    having
      reports_count >= 1
  ) s
  join Employees e on s.employee_id = e.employee_id
order by s.employee_id
