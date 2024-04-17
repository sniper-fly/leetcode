(
  select
    u.name as results
  from
    MovieRating
    join Users u using(user_id)
  group by
    user_id
  order by
    count(*) desc,
    u.name asc
  limit
    1
)
union
all (
  select
    m.title as results
  from
    MovieRating
    join Movies m using(movie_id)
  where
    date_format(created_at, '%Y-%m') = "2020-02"
  group by
    movie_id
  order by
    avg(rating) desc,
    m.title asc
  limit
    1
)
