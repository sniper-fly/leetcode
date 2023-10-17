select
  visited_on,
  amount,
  round(amount / 7, 2) average_amount
from
  (
    select
      distinct visited_on,
      sum(amount) over(
        order by
          visited_on range interval 6 day preceding
      ) amount,
      min(visited_on) over() first_date
    from
      Customer
  ) q
where
  visited_on >= date_add(first_date, interval 6 day)
order by
  visited_on asc
