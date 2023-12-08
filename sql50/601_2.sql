select
  id,
  visit_date,
  people
from
  (
    select
      *,
      count(*) over(
        order by
          id range between current row
          and 2 following
      ) as fl2,
      count(*) over(
        order by
          id range between 1 preceding
          and 1 following
      ) as center,
      count(*) over(
        order by
          id range between 2 preceding
          and current row
      ) as pr2
    from
      Stadium
    where
      people >= 100
  ) q
where
  fl2 >= 3
  or center >= 3
  or pr2 >= 3
order by
  visit_date;

-- select
--   id,
--   visit_date,
--   people
-- from
--   (
--     select
--       *,
--       case
--         when min(people) over(
--           order by
--             id range between current row
--             and 2 following
--         ) >= 100 then 'yes'
--         when min(people) over(
--           order by
--             id range between 1 preceding
--             and 1 following
--         ) >= 100 then 'yes'
--         when min(people) over(
--           order by
--             id range between 2 preceding
--             and current row
--         ) >= 100 then 'yes'
--         else 'no'
--       end as more_than_100_3_consec
--     from
--       Stadium
--   ) q
-- where
--   q.more_than_100_3_consec = 'yes'
