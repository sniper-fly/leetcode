select
  distinct visited_on,
  amount,
  round(amount / 7, 2) average_amount
from
  (
    select
      visited_on,
      sum(amount) over(
        order by
          visited_on range between interval 6 day preceding
          and current row
      ) amount
    from
      Customer
    order by
      visited_on asc
  ) q
where
  visited_on >= (
    select
      visited_on
    from
      Customer
    order by
      visited_on
    limit
      1
  ) + 6
