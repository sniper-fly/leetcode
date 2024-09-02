select
  user_id,
  concat(
    upper(substring(name, 1, 1)),
    substring(lower(name), 2)
  ) as name
from
  Users
order by
  user_id
