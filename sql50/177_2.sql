CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT BEGIN
set
  M = N - 1;

RETURN (
  select
    (
      select
        distinct salary
      from
        Employee
      order by
        salary
      limit
        1 offset M
    )
);

END
