select
  u.name,
  sum(t.amount) as balance
from
  Transactions t
  join Users u using(account)
group by
  account
having
  balance > 10000
