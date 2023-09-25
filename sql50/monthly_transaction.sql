select
  date_format(trans_date, '%Y-%m') as month,
  country,
  count(country) as trans_count,
  sum(if(state = 'approved', 1, 0)) as approved_count,
  sum(amount) as trans_total_amount,
  sum(if(state = 'approved', amount, 0)) as approved_total_amount
from
  Transactions t
group by
  country,
  date_format(trans_date, '%Y-%m')
