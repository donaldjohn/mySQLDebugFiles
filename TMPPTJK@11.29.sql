





/*2016��7��11��14:21:53*/
create or replace view view_t_pub_info_single as
select  sys_guid() || '' as view_T_PUB_INFO_SINGLEOID,
t.Pubtype,
t.Pubdate,
t.An,
t.Howdo,
t.Replacean,
t.Replacedate,
t.Sendok,
t.Extractok,
t.Zlxmsendtime,
t.Zlxmextracttime,
t.Sendername,
t.Istesting,
t.Gbdsendtime,
t.Gbdextracttime,
t.State,
t.Shiwugglxdm,
t.Shiwufjlxdm
FROM
(
/*����б�*/
select
s.*
from T_PUB_INFO_SINGLE s
left join
T_PUB_LIST l
on
s.pubdate = l.pubdate and s.pubtype = l.pubtype and s.an = l.an
where s.howdo='ADD' and l.issingle = 1
union
/*ɾ���б�*/
select
s.*
from T_PUB_INFO_SINGLE s
where
s.howdo = 'DEL' or s.howdo = 'UPDATE'
union
/*�滻�б�*/
select
s.*
from T_PUB_INFO_SINGLE s
where
s.howdo = 'REPLACE'
) t;



























select * from VIEW_EPEX_PUB_LIST

