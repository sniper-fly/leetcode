-- product_id, year, quantity, price
-- product_idでグループ化したとき、
-- yearが最小となるレコードを表示する
select
  s.product_id,
  s.year as first_year,
  s.quantity,
  s.price
from
  Sales s
  join (
    select
      product_id,
      min(year) as min_year
    from
      Sales
    group by
      product_id
  ) s1 on s.product_id = s1.product_id
  and s.year = s1.min_year
