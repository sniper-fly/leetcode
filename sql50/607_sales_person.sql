select
  name
from
  SalesPerson
where
  name not in (
    select
      s.name
    from
      SalesPerson s
      join Orders o on s.sales_id = o.sales_id
      join Company c on o.com_id = c.com_id
    where
      c.name = 'RED'
  );

select
  name
from
  SalesPerson s
where
  not exists (
    select
      1
    from
      Orders o
      join Company c on o.com_id = c.com_id
    where
      s.sales_id = o.sales_id and c.name = 'RED'
  )
