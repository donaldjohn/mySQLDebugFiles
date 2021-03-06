create or replace view view_t_sw_info as
select  sys_guid() || '' as view_T_sw_infoOID,  T_sw_info.Swpubdate, T_sw_info.Pubtype, T_sw_info.Extractok, T_sw_info.Pubdateok, T_sw_info.Patcount, T_sw_info.Sendtime, T_sw_info.Extracttime, T_sw_info.State, T_sw_info.Pubcomplete FROM T_sw_info 
WHERE PUBCOMPLETE IS NULL AND PUBTYPE NOT LIKE '%QBWX%' ORDER BY SWPUBDATE DESC;













select * from view_t_pub_info_single;


select t.*, t.rowid from t_pub_info_single t;

select * from view_t_pub_info_single;

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




























create or replace view view_t_pub_info_single as
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









































SELECT  T_REQUEST.PUBDATE,T_REQUEST.PUBTYPE,T_REQUEST.ASK,T_REQUEST.AN,T_REQUEST.ASKTIME,T_REQUEST.ASKMEMO,T_REQUEST.ANSWER,T_REQUEST.ANSWERTIME,T_REQUEST.ANSWERMEMO,T_REQUEST.SHIWUGGLXDM,T_REQUEST.SHIWUFJLXDM,T_REQUEST.SENDER,decode(T_REQUEST.ANSWER, 1,  '已同意', -1, '已拒绝', '') as ANSWERCN,decode(T_REQUEST.ASK, 'Delete', '撤件', '增件') as ASKCN FROM T_REQUEST

SELECT  decode(T_REQUEST.ANSWER, 1,  '已同意', -1, '已拒绝', '') as ANSWERCN,decode(T_REQUEST.ASK, 'Delete', '撤件', '增件') as ASKCN, T_REQUEST.PUBDATE,T_REQUEST.PUBTYPE,T_REQUEST.ASK,T_REQUEST.AN,T_REQUEST.ASKTIME,T_REQUEST.ASKMEMO,T_REQUEST.ANSWER,T_REQUEST.ANSWERTIME,T_REQUEST.ANSWERMEMO,T_REQUEST.SHIWUGGLXDM,T_REQUEST.SHIWUFJLXDM,T_REQUEST.SENDER FROM T_REQUEST

SELECT  case T_REQUEST.ANSWER when 1 then  to_char('已同意') when  -1 then  '已拒绝' end as ANSWERCN,decode(T_REQUEST.ASK, 'Delete', '撤件', '增件') as ASKCN, T_REQUEST.PUBDATE,T_REQUEST.PUBTYPE,T_REQUEST.ASK,T_REQUEST.AN,T_REQUEST.ASKTIME,T_REQUEST.ASKMEMO,T_REQUEST.ANSWER,T_REQUEST.ANSWERTIME,T_REQUEST.ANSWERMEMO,T_REQUEST.SHIWUGGLXDM,T_REQUEST.SHIWUFJLXDM,T_REQUEST.SENDER FROM T_REQUEST

已同

select * from VIEW_T_REQUEST;

select * from t_request;

select * from BC_T_ERR_FMGB_CB;

select * from VIEW_T_PUB_INFO_SINGLE;


select s.*, s.rowid from T_PUB_INFO_SINGLE s;


select * from T_PUB_LIST;




