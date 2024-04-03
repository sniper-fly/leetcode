select
  q.id,
  jan.revenue as Jan_Revenue,
  feb.revenue as Feb_Revenue,
  Mar.revenue as Mar_Revenue,
  Apr.revenue as Apr_Revenue,
  May.revenue as May_Revenue,
  Jun.revenue as Jun_Revenue,
  Jul.revenue as Jul_Revenue,
  Aug.revenue as Aug_Revenue,
  Sep.revenue as Sep_Revenue,
  Oct.revenue as Oct_Revenue,
  Nov.revenue as Nov_Revenue,
  De.revenue as Dec_Revenue
from
  (
    select
      distinct id
    from
      Department
  ) q
  left join Department jan on q.id = jan.id
  and jan.month = "Jan"
  left join Department feb on q.id = feb.id
  and feb.month = "Feb"
  left join Department Mar on q.id = Mar.id
  and Mar.month = "Mar"
  left join Department Apr on q.id = Apr.id
  and Apr.month = "Apr"
  left join Department May on q.id = May.id
  and May.month = "May"
  left join Department Jun on q.id = Jun.id
  and Jun.month = "Jun"
  left join Department Jul on q.id = Jul.id
  and Jul.month = "Jul"
  left join Department Aug on q.id = Aug.id
  and Aug.month = "Aug"
  left join Department Sep on q.id = Sep.id
  and Sep.month = "Sep"
  left join Department Oct on q.id = Oct.id
  and Oct.month = "Oct"
  left join Department Nov on q.id = Nov.id
  and Nov.month = "Nov"
  left join Department De on q.id = De.id
  and De.month = "De";

select
  id,
  sum(if(month = "Jan", revenue, null)) as Jan_Revenue,
  sum(if(month = "Feb", revenue, null)) as Feb_Revenue,
  sum(if(month = "Mar", revenue, null)) as Mar_Revenue,
  sum(if(month = "Apr", revenue, null)) as Apr_Revenue,
  sum(if(month = "May", revenue, null)) as May_Revenue,
  sum(if(month = "Jun", revenue, null)) as Jun_Revenue,
  sum(if(month = "Jul", revenue, null)) as Jul_Revenue,
  sum(if(month = "Aug", revenue, null)) as Aug_Revenue,
  sum(if(month = "Sep", revenue, null)) as Sep_Revenue,
  sum(if(month = "Oct", revenue, null)) as Oct_Revenue,
  sum(if(month = "Nov", revenue, null)) as Nov_Revenue,
  sum(if(month = "Dec", revenue, null)) as Dec_Revenue
from
  Department
group by
  id
