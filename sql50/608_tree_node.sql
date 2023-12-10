select
  t1.id,
  t1.p_id,
  t2.id as t2id,
  t3.id as t3id
from
  Tree t1
  left join Tree t2 on t1.id = t2.p_id
  left join Tree t3 on (
    t1.id = t3.p_id
    and t2.id < t3.id
  );

select
  distinct p_id
from
  Tree;

select
  id,
  if(
    p_id is null,
    'Root',
    if(
      id in (
        select
          distinct p_id
        from
          Tree
      ),
      'Inner',
      'Leaf'
    )
  ) as type
from
  Tree
