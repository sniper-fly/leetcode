select
  u.name,
  q.balance
from
  Users u
  join (
    select
      account,
      sum(amount) as balance
    from
      Transactions
    group by
      account
    having
      balance > 10000
  ) q using(account)
