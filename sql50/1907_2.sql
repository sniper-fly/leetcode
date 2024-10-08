select
  "Low Salary" as category,
  count(income) as accounts_count
from
  Accounts
where
  income < 20000
union
all
select
  "Average Salary" as category,
  count(income) as accounts_count
from
  Accounts
where
  20000 <= income
  and income <= 50000
union
all
select
  "High Salary" as category,
  count(income) as accounts_count
from
  Accounts
where
  income > 50000
