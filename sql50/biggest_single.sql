select
  max(q.num) as num
from (
  select
    num
  from
    MyNumbers
  group by
    num
  having
    count(num) = 1
) q
