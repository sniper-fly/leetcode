--
-- @lc app=leetcode id=1757 lang=mysql
--
-- [1757] Recyclable and Low Fat Products
--
-- @lc code=start
# Write your MySQL query statement below
select
  product_id
where
  low_fats = 'Y' & & recyclable = 'Y'
from
  Products;

-- @lc code=end
