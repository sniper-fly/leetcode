select
  name
from
  SalesPerson
where
  sales_id not in (
    select
      sales_id
    from
      Orders
      join Company c using(com_id)
    where
      c.name = 'RED'
  );
