select
  s.product_id,
  p.product_name
from
  Sales s
  join Product p on s.product_id = p.product_id
where
  s.product_id not in (
    -- 指定期間以外で売れたことがある商品一覧
    select
      product_id
    from
      Sales
    where
      sale_date not between '2019-01-01'
      and '2019-03-31'
  );

select
  q.product_id,
  p.product_name
from
  (
    select
      product_id
    from
      Sales s
    group by
      product_id
    having
      min(sale_date) >= '2019-01-01'
      and max(sale_date) <= '2019-03-31'
  ) q
  join Product p on q.product_id = p.product_id;

select
  product_id,
  product_name
from
  Product
where
  product_id in (
    select
      product_id
    from
      Sales s
    group by
      product_id
    having
      min(sale_date) >= '2019-01-01'
      and max(sale_date) <= '2019-03-31'
  );
