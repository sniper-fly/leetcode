select
  id,
  visit_date,
  people
from
  (
    select
      id,
      visit_date,
      people,
      lag(people) over(
        order by
          id
      ) as lag1,
      lag(people, 2) over(
        order by
          id
      ) as lag2,
      lead(people) over(
        order by
          id
      ) as lead1,
      lead(people, 2) over(
        order by
          id
      ) as lead2
    from
      Stadium
    order by
      visit_date asc
  ) q
where
  (
    people >= 100
    and lead1 >= 100
    and lead2 >= 100
  )
  or (
    lag2 >= 100
    and lag1 >= 100
    and people >= 100
  )
  or (
    lag1 >= 100
    and people >= 100
    and lead1 >= 100
  );

-- other solutions
select
  id,
  visit_date,
  people
from
  (
    select
      id,
      visit_date,
      people,
      CASE
        WHEN min(people) OVER(
          ORDER BY
            id ROWS BETWEEN CURRENT ROW
            AND 2 FOLLOWING
        ) >= 100 THEN 'YES'
        WHEN min(people) OVER(
          ORDER BY
            id ROWS BETWEEN 1 PRECEDING
            AND 1 FOLLOWING
        ) >= 100 THEN 'YES'
        WHEN min(people) OVER(
          ORDER BY
            id ROWS BETWEEN 2 PRECEDING
            AND CURRENT ROW
        ) >= 100 THEN 'YES'
        ELSE 'NO'
      END as condition_check
    from
      tmp
  ) t
where
  condition_check = 'YES'
ORDER BY
  2;
--- これは動かない

---
with q1 as (
  select
    *,
    id - row_number() over() as id_diff
  from
    stadium
  where
    people > 99
)
select
  id,
  visit_date,
  people
from
  q1
where
  id_diff in (
    select
      id_diff
    from
      q1
    group by
      id_diff
    having
      count(*) > 2
  )
order by
  visit_date;

---
with q1 as (
  select
    *,
    count(*) over(
      order by
        id range between current row
        and 2 following
    ) following_cnt,
    count(*) over(
      order by
        id range between 2 preceding
        and current row
    ) preceding_cnt,
    count(*) over(
      order by
        id range between 1 preceding
        and 1 following
    ) current_cnt
  from
    stadium
  where
    people > 99
)
select
  id,
  visit_date,
  people
from
  q1
where
  following_cnt = 3
  or preceding_cnt = 3
  or current_cnt = 3
order by
  visit_date
