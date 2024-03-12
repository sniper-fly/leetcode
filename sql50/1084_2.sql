select
  product_id,
  product_name
from
  Product
  join (
    select
      product_id
    from
      Sales
    group by
      product_id
    having
      min(sale_date) between '2019-01-01'
      and '2019-03-31'
      and max(sale_date) between '2019-01-01'
      and '2019-03-31'
  ) q using(product_id);

select
  product_id,
  product_name
from
  Product p
where
  not exists(
    select
      1
    from
      Sales s
    where
      p.product_id = s.product_id
      and (
        sale_date < '2019-01-01'
        or sale_date > '2019-03-31'
      )
      or p.product_id not in (
        select
          product_id
        from
          Sales
      )
  );
