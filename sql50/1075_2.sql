select
  project_id,
  round(avg(e.experience_years), 2) as average_years
from
  Project
  join Employee e using(employee_id)
group by
  project_id
