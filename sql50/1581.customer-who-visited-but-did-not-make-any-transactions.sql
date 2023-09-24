--
-- @lc app=leetcode id=1581 lang=mysql
--
-- [1581] Customer Who Visited but Did Not Make Any Transactions
--
-- @lc code=start
# Write your MySQL query statement below

select
  v.customer_id,
  v.visit_id
from
  Transactions t
  left join visits v on t.visit_id = v.visit_id

select
  v.customer_id,
  v.visit_id
from
  visits v
  left join Transactions t on t.visit_id = v.visit_id

  -- @lc code=end

| customer_id | visit_id | transaction_id |
| ----------- | -------- | -------------- |
| 23          | 1        | 12             |
| 9           | 2        | 13             |
| 30          | 4        | null           |
| 54          | 5        | 9              |
| 54          | 5        | 3              |
| 54          | 5        | 2              |
| 96          | 6        | null           |
| 54          | 7        | null           |
| 54          | 8        | null           |
