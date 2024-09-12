select
  employee_id
from
  (
    select
      employee_id
    from
      Employees
    where
      employee_id not in (
        select
          employee_id
        from
          Salaries
      )
    union
    all
    select
      employee_id
    from
      Salaries
    where
      employee_id not in (
        select
          employee_id
        from
          Employees
      )
  ) q
order by
  employee_id asc;

select
  employee_id
from
  Employees as e
  full join Salaries as s
where
  e.name is null
  or s.salary is null
order by
  employee_id asc;
