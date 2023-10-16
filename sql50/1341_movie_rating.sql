with reviewers as (
  select
    user_id,
    count(*) as count
  from
    MovieRating
  group by
    user_id
  having
    count >= all(
      select
        count(*)
      from
        MovieRating
      group by
        user_id
    )
),
averages as (
  select
    movie_id,
    round(avg(rating), 3) as average
  from
    MovieRating
  where
    date_format(created_at, '%Y-%m') = '2020-02'
  group by
    movie_id
  having
    average >= all(
      select
        round(avg(rating), 3) as average
      from
        MovieRating
      where
        date_format(created_at, '%Y-%m') = '2020-02'
      group by
        movie_id
    )
)
select
  min(u.name) as results
from
  Users u
  join reviewers r on u.user_id = r.user_id
union all
select
  min(m.title) as results
from
  averages a
  join Movies m on a.movie_id = m.movie_id
