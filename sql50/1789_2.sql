select
  employee_id,
  department_id
from
  Employee
where
  primary_flag = 'Y'
union
all
select
  employee_id,
  department_id
from
  Employee
group by
  employee_id
having
  count(*) = 1