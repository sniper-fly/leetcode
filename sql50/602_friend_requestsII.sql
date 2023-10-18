select
  requester_id,
  accepter_id,
  count(*) over(
    partition by requester_id
    order by
      requester_id
  ) request_count,
  count(*) over(
    partition by accepter_id
    order by
      accepter_id
  ) accept_count
from
  RequestAccepted;

with requests as (
  select
    requester_id,
    count(*) as req_count
  from
    RequestAccepted
  group by
    requester_id
),
accepts as (
  select
    accepter_id,
    count(*) as ac_count
  from
    RequestAccepted
  group by
    accepter_id
)
select
  r.requester_id as id,
  r.req_count + a.ac_count as num
from
  requests r
  join accepts a on r.requester_id = a.accepter_id;

select
  id,
  count(*) as num
from
  (
    select
      requester_id as id,
      accepter_id as friend_id
    from
      RequestAccepted
    union
    select
      accepter_id as id,
      requester_id as friend_id
    from
      RequestAccepted
  ) q
group by
  id
order by
  num desc
limit
  1
