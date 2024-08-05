-- 
select
  contest_id,
  round(
    count(*) * 100 / (
      select
        count(*)
      from
        Users
    ),
    2
  ) as percentage
from
  Register
group by
  contest_id
order by
  percentage desc,
  contest_id asc
