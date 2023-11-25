CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT BEGIN RETURN (
  select
    q.salary
  from
    (
      select
        distinct salary,
        dense_rank() over (
          order by
            salary desc
        ) as ranking
      from
        Employee
    ) q
  where
    q.ranking = N
);

END -- select
--   q.salary
-- from
--   (
--     select
--       distinct salary,
--       dense_rank() over (
--         order by
--           salary
--       ) as ranking
--     from
--       Employee
--   ) q
-- where q.ranking = 4
