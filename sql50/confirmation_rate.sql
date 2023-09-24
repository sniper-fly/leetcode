select
  c.user_id,
  c.action,
  count(c.action = 'confirmed'),
  count(c.action = 'timeout')
from Confirmations c
group by c.user_id
