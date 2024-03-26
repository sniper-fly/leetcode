select
  distinct p1.product_id,
  ifnull(p2.new_price, 10) as price
from
  Products p1
  left join (
    select
      *
    from
      (
        select
          product_id,
          new_price,
          row_number() over(
            partition by product_id
            order by
              change_date desc
          ) as r
        from
          Products
        where
          change_date <= '2019-08-16'
      ) q
    where
      r = 1
  ) p2 using(product_id);

select
  distinct product_id,
  coalesce(
    (
      select
        new_price
      from
        (
          select
            *
          from
            products p3
          where
            change_date <= '2019-08-16'
            and p3.product_id = p2.product_id
        ) p1
      order by
        change_date DESC
      limit
        1
    ), 10
  ) as price
from
  products p2;
