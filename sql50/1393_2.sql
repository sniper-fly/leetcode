select
  stock_name,
  sum(if(operation = 'Buy', price * (-1), price)) as capital_gain_loss
from
  Stocks
group by
  stock_name
