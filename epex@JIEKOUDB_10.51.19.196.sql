/*错误列表*/
select
t.pubdate as pd, t.pubtype, t.an, count(*) 
from
(select 
* 
from T_PUB_INFO_SINGLE s 
left join
t_pub_feedback f
on
s.pubtype = f.pubdate and s.pubtype = f.pubtype and s.an = f.an
where s.sendok = 1 and f.informed = 0
)
t
group by t.pubdate, t.pubtype, t.an
;







select 
t.*
from
(
/*添加列表*/
select 
s.*
from T_PUB_INFO_SINGLE s
left join
T_PUB_LIST l
on 
s.pubdate = l.pubdate and s.pubtype = l.pubtype and s.an = l.an
where s.howdo='ADD' and l.issingle = 1
union
/*删除列表*/
select 
s.*
from T_PUB_INFO_SINGLE s
where
s.howdo = 'DEL' or s.howdo = 'UPDATE'
union
/*替换列表*/
select 
s.*
from T_PUB_INFO_SINGLE s
where
s.howdo = 'REPLACE'
) t





select * from T_SINGLE_INFO;


















select * from T_PUB_FEEDBACK


























select * from T_PUB_INFO_SINGLE t where t.pubtype like '%SW' order by t.pubtype asc;


select  sys_guid() || '' as view_T_PUB_INFO_SINGLEOID,
T_PUB_INFO_SINGLE.Pubtype,
T_PUB_INFO_SINGLE.Pubdate,
T_PUB_INFO_SINGLE.An,
T_PUB_INFO_SINGLE.Howdo,
T_PUB_INFO_SINGLE.Replacean,
T_PUB_INFO_SINGLE.Replacedate,
T_PUB_INFO_SINGLE.Sendok,
T_PUB_INFO_SINGLE.Extractok,
T_PUB_INFO_SINGLE.Zlxmsendtime,
T_PUB_INFO_SINGLE.Zlxmextracttime,
T_PUB_INFO_SINGLE.Sendername,
T_PUB_INFO_SINGLE.Istesting,
T_PUB_INFO_SINGLE.Gbdsendtime,
T_PUB_INFO_SINGLE.Gbdextracttime,
T_PUB_INFO_SINGLE.State,
T_PUB_INFO_SINGLE.Shiwugglxdm,
T_PUB_INFO_SINGLE.Shiwufjlxdm,
l.predo as BDOKCount,
l.zlxmmodify,
l.xmlmodify
FROM
T_PUB_INFO_SINGLE
left join
T_PUB_LIST l
on
T_PUB_INFO_SINGLE.an = l.an
and
T_PUB_INFO_SINGLE.pubtype = l.pubtype
and
T_PUB_INFO_SINGLE.pubdate = l.pubdate
where
T_PUB_INFO_SINGLE.sendok = 1
and
l.issingle = 1;
