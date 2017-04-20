CREATE OR REPLACE VIEW VIEW_CB_ASSIGNED AS
select sys_guid() || '' as VIEW_CB_ASSIGNEDOID, t1."PUBTYPE",t1."JN",t1."F_JOBID",t1."PATENTCOUNT",t1."TOTALPAGE",t1."TOTALIMAGECOUNT",t1."UCML_USEROID",t1."USERNAME",t1."ACTIVITYCHINESENAME",to_char('') AS SWSTATE 
from (
SELECT  F_PUBTYPE AS PUBTYPE,
       F_JOURNALNO AS JN ,
       F_JOBID AS F_JOBID,
       F_PATCOUNT AS PATENTCOUNT,
       F_PAGECOUNT AS TotalPage,
       F_PICCOUNT AS TotalImageCount,
       F_OPERID AS UCML_UserOID,
       F_OPERNAME AS userName,
       F_JOBTYPE AS ActivityChineseName
FROM T_TASK_BUFFER  where f_jobstate = '已分配' AND F_PUBTYPE NOT LIKE '%SW') T1
UNION
select sys_guid() || '' as VIEW_CB_ASSIGNEDOID, t1."PUBTYPE",t1."JN",t1."F_JOBID",t1."PATENTCOUNT",t1."TOTALPAGE",t1."TOTALIMAGECOUNT",t1."UCML_USEROID",t1."USERNAME",t1."ACTIVITYCHINESENAME",t1."SWSTATE" from (  
SELECT  F_PUBTYPE AS PUBTYPE,
       F_JOURNALNO AS JN ,
       F_JOBID AS F_JOBID,
       F_PATCOUNT AS PATENTCOUNT,
       F_PAGECOUNT AS TotalPage,
       F_PICCOUNT AS TotalImageCount,
       F_OPERID AS UCML_UserOID,
       F_OPERNAME AS userName,
       F_JOBTYPE AS ActivityChineseName,
       B.PERSISTNODE AS SWSTATE
FROM T_TASK_BUFFER A
JOIN WF_SW_INSTANCE B 
ON A.F_JOURNALNO=B.JN AND A.F_PUBTYPE=B.PUBTYPE AND B.ISCURRENT=1 AND  A.f_jobstate = '已分配' AND A.F_PUBTYPE LIKE '%SW'
) T1;





































string sqlStr = "select i.jn as \"jn\", i.persistnode as \"flowstate\" from wf_sw_instance i where i.pubtype like '%" + pubType + "%' and i.pubdate like '%" + pubDate + "%'";


select i.jn as jn, i.persistnode as flowstate from wf_sw_instance i where i.iscurrent = 1


select  * from t_desc_fm_gk where an='201410319744X' for update
select * from wf_instance


select s.*, s.rowid from t_sw_yl s where rownum < 10


pubtype=FMSW
jn=3144
2014104835166
1618
1625


select s.*, s.rowid from t_sw_yl s where s.pubtype='FMSW' and s.jn='3144' and s.swlxdm='1618' and s.swfjlxdm='1625' and s.e21 = '2014104835166';




select * from T_PUB_INFO_SINGLE;


select
count(*) as Num,
f_pubtype,jn
from
(
select
t1.f_jobid,
T1.f_pubtype,
t2.jn
from 
t_task_buffer t1
LEFT JOIN  
t_task_package t2 
on  
T1.f_jobid=t2.f_jobid
where 1=1 
)
GROUP BY f_pubtype,jn
ORDER BY jn























select 
t1.f_jobid,
T1.f_pubtype,
t2.jn
from 
t_task_buffer t1
LEFT JOIN  
t_task_package t2 
on  
T1.f_jobid=t2.f_jobid
where
{0}
{1}








select 
count(*) as Num,
f_pubtype,jn 
from 
(
select 
t1.f_jobid,
T1.f_pubtype,
t2.jn
from 
t_task_buffer t1
LEFT JOIN  
t_task_package t2 
on  
T1.f_jobid=t2.f_jobid
)
GROUP BY f_pubtype,jn
ORDER BY jn




























select * from VIEW_T_PUB_INFO_SINGLE;

select * from T_SINGLE_INFO;



select * from t_task_package;
select * from t_task_buffer;


select 
count(*) as Num,f_pubtype,jn 
from 
(
select t1.f_jobid,T1.f_pubtype,T2.Jn   from t_task_buffer t1
LEFT JOIN  t_task_package t2 
on  T1.f_jobid=t2.f_jobid
)  
GROUP BY f_pubtype,jn
ORDER BY jn












SELECT VIEW_EPEX_PUB_LIST.VIEW_EPEX_PUB_LISTOID,VIEW_EPEX_PUB_LIST.PUBDATE,VIEW_EPEX_PUB_LIST.PUBTYPE,VIEW_EPEX_PUB_LIST.PATENTCOUNT FROM VIEW_EPEX_PUB_LIST ORDER BY VIEW_EPEX_PUB_LIST.PUBDATE DESC, VIEW_EPEX_PUB_LIST.PATENTCOUNT DESC 




select f.reckey, count(*) from t_err_fmgb f group by f.reckey having count(*) = 1;

select * from view_t_err_fmgb;

drop view view_t_err_fmgb;


create or replace view view_t_err_fmgb as
select 
*
from
t_err_fmgb



select t.* from view_gj_taskinfo_CB t;


select * from t_task_package p




select * from view_gj_taskinfo_CB;


create or replace view view_gj_taskinfo_CB as
select
sys_guid()||'' as view_gj_taskinfo_CBOID,
t1.F_JOBID,
t1.F_JOBCODE as F_JOBCODE,
t1.F_APPLYNO,
t1.F_PUBTYPE,
t1.F_INSTANCEID,
t1.BDDATE,
t1.JN,
t1.ISBACK,
t2.F_JOBTYPE,
t2.F_JOBSTATE,
t2.F_OPERID,
t2.F_OPERNAME,
t2.F_ASSIGNTIME,
t2.F_PAGECOUNT,
t2.F_FINISHTIME   
from
t_task_package t1
left join
t_task_buffer t2
on t1.f_jobid = t2.f_jobid



select * from View_T_CATALOG;
VIEW_T_CATALOG_CB;
VIEW_GJ_TASKINFO_CB;










SELECT  t.COLUMN_NAME, t.* FROM user_tab_columns t WHERE t.TABLE_NAME= upper('t_task_package');
SELECT  t.COLUMN_NAME, t.* FROM user_tab_columns t WHERE t.TABLE_NAME= upper('t_task_buffer')

select * from t_task_package;
select * from t_task_buffer;


select count(*) from T_ERR_FMGB_CB;

select * from T_ERR_FMGB_CB;


CREATE SYNONYM T_ERR_FMGB_Test FOR T_ERR_FMGB;



select * from T_ERR_FMGB_Test;

























create or replace view view_t_catalog_CB as
select
sys_guid()||'' as view_t_catalog_CBOID,
t."PUBTYPE",t."AN",t."PN",t."PD",
t."AD",t."TI",t."E51",t."E62",t."E73",t."E71",
t."EDZ",t."E72",t."APC",t."E74",t."EDL",t."E56A",
t."E56B",t."E56C",t."ESC",t."E86",t."E87",t."E85",
t."E30",t."E15",t."E48",t."E83",t."E66",t."ESM",
t."ECN",t."JN",
t."f_pages" as f_pages,
t."f_allpicnum" as f_allpicnum,
t."f_orixmlname" as f_orixmlname
from (
select
'FMGB' as PubType,
to_char(t1.AD) as "AD",to_char(t1.AN) as "AN",to_char(t1.APC) as "APC",
to_char(t1.JN) as "JN",to_char(t1.E15) as "E15",
to_char(t1.E30) as "E30",to_char(t1.E48) as "E48",to_char(t1.E51) as "E51",
to_char(t1.E56A) as "E56A",to_char(t1.E56B) as "E56B",to_char(t1.E56C) as "E56C",
to_char(t1.E62) as "E62",to_char(t1.E66) as "E66",to_char(t1.E71) as "E71",
to_char(t1.E72) as "E72",to_char(t1.E73) as "E73",to_char(t1.E74) as "E74",
to_char(t1.E83) as "E83",to_char(t1.E85) as "E85",to_char(t1.E86) as "E86",
to_char(t1.E87) as "E87",to_char(t1.ECN) as "ECN",to_char(t1.EDL) as "EDL",
to_char(t1.EDZ) as "EDZ",to_char(t1.ESC) as "ESC",to_char(t1.ESM) as "ESM",
to_char(t1.PD) as "PD",
to_char(t1.PN) as "PN",
to_char(t1.TI) as "TI",
to_char(t2.f_pages) as "f_pages",
to_char(t2.f_allpicnum) as "f_allpicnum",
to_char(t2.f_orixmlname) as "f_orixmlname"
from
T_CATALOG_FM_GK t1  left join t_desc_fm_gk t2
on t1.an = t2.an and t1.PD = t2.PD
union
select
'FMSQ' as PubType,
to_char(t1.AD) as "AD",to_char(t1.AN) as "AN",to_char(t1.APC) as "APC",
to_char(t1.JN) as "JN",to_char(t1.E15) as "E15",
to_char(t1.E30) as "E30",to_char(t1.E48) as "E48",to_char(t1.E51) as "E51",
to_char(t1.E56A) as "E56A",to_char(t1.E56B) as "E56B",to_char(t1.E56C) as "E56C",
to_char(t1.E62) as "E62",to_char(t1.E66) as "E66",to_char(t1.E71) as "E71",
to_char(t1.E72) as "E72",to_char(t1.E73) as "E73",to_char(t1.E74) as "E74",
to_char(t1.E83) as "E83",to_char(t1.E85) as "E85",to_char(t1.E86) as "E86",
to_char(t1.E87) as "E87",to_char(t1.ECN) as "ECN",to_char(t1.EDL) as "EDL",
to_char(t1.EDZ) as "EDZ",to_char(t1.ESC) as "ESC",to_char(t1.ESM) as "ESM",
to_char(t1.PD) as "PD",
to_char(t1.PN) as "PN",
to_char(t1.TI) as "TI",
to_char(t2.f_pages) as "f_pages",
to_char(t2.f_allpicnum) as "f_allpicnum",
to_char(t2.f_orixmlname) as "f_orixmlname"
from
T_CATALOG_FM_SQ t1  left join t_desc_fm_sq t2
on t1.an = t2.an and t1.PD = t2.PD
union
select
'WGSQ' as PubType,
to_char(t1.AD) as "AD",to_char(t1.AN) as "AN",to_char(t1.APC) as "APC",
to_char(t1.JN) as "JN",to_char(t1.E15) as "E15",
to_char(t1.E30) as "E30",to_char(t1.E48) as "E48",to_char(t1.E51) as "E51",
to_char(t1.E56A) as "E56A",to_char(t1.E56B) as "E56B",to_char(t1.E56C) as "E56C",
to_char(t1.E62) as "E62",to_char(t1.E66) as "E66",to_char(t1.E71) as "E71",
to_char(t1.E72) as "E72",to_char(t1.E73) as "E73",to_char(t1.E74) as "E74",
to_char(t1.E83) as "E83",to_char(t1.E85) as "E85",to_char(t1.E86) as "E86",
to_char(t1.E87) as "E87",to_char(t1.ECN) as "ECN",to_char(t1.EDL) as "EDL",
to_char(t1.EDZ) as "EDZ",to_char(t1.ESC) as "ESC",to_char(t1.ESM) as "ESM",
to_char(t1.PD) as "PD",
to_char(t1.PN) as "PN",
to_char(t1.TI) as "TI",
to_char(t2.f_pages) as "f_pages",
to_char(t2.f_allpicnum) as "f_allpicnum",
to_char(t2.f_orixmlname) as "f_orixmlname"
from
T_CATALOG_WG_SQ t1  left join t_desc_wg_sq t2
on t1.an = t2.an and t1.PD = t2.PD
union
select
'XXSQ' as PubType,
to_char(t1.AD) as "AD",to_char(t1.AN) as "AN",to_char(t1.APC) as "APC",
to_char(t1.JN) as "JN",to_char(t1.E15) as "E15",
to_char(t1.E30) as "E30",to_char(t1.E48) as "E48",to_char(t1.E51) as "E51",
to_char(t1.E56A) as "E56A",to_char(t1.E56B) as "E56B",to_char(t1.E56C) as "E56C",
to_char(t1.E62) as "E62",to_char(t1.E66) as "E66",to_char(t1.E71) as "E71",
to_char(t1.E72) as "E72",to_char(t1.E73) as "E73",to_char(t1.E74) as "E74",
to_char(t1.E83) as "E83",to_char(t1.E85) as "E85",to_char(t1.E86) as "E86",
to_char(t1.E87) as "E87",to_char(t1.ECN) as "ECN",to_char(t1.EDL) as "EDL",
to_char(t1.EDZ) as "EDZ",to_char(t1.ESC) as "ESC",to_char(t1.ESM) as "ESM",
to_char(t1.PD) as "PD",
to_char(t1.PN) as "PN",
to_char(t1.TI) as "TI",
to_char(t2.f_pages) as "f_pages",
to_char(t2.f_allpicnum) as "f_allpicnum",
to_char(t2.f_orixmlname) as "f_orixmlname"
from
T_CATALOG_XX_SQ t1  left join t_desc_xx_sq t2
on t1.an = t2.an and t1.PD = t2.PD
)
t;




































SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_FM_GK') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_FM_SQ') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_FM_GZ') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_FM_JM') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_WG_GZ') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_WG_SQ') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_XX_GZ') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_XX_JM') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_XX_SQ') order by t.COLUMN_NAME asc;






SELECT  t.COLUMN_NAME, t.* FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_XX_SQ') order by t.COLUMN_NAME asc;





/**事务修改记录**/
select u.hpwjxh, u.oldvalue,u.newvalue, u.* from t_sw_update_info u where u.operid='ADMIN' order by u.opertime desc;




SELECT T_SW_WX.HPWJXH,T_SW_WX.HPWJLXDM,T_SW_WX.SWPUBDATE,T_SW_WX.E21,T_SW_WX.JN,T_SW_WX.TABLENAME, T_SW_WX.SUBTABLENAME,T_SW_WX.PUBTYPE,T_SW_WX.WXTYPE,T_SW_WX.GGLXDM,T_SW_WX.SWLXDM,T_SW_WX.SWFJLXDM,T_SW_WX.EZL,T_SW_WX.E22,T_SW_WX.E51,T_SW_WX.EWH,T_SW_WX.EWR,T_SW_WX.E45,T_SW_WX.E54,T_SW_WX.E73,T_SW_WX.WNBH,T_SW_WX.SCJL,T_SW_WX.LCBFWXJL FROM T_SW_WX




SELECT T_SW_WX.TABLENAME, T_SW_WX.SUBTABLENAME FROM T_SW_WX













/**事务修改记录**/
insert into t_sw_remove_back(ewr,ewh,hpwjxh,hpwjlxdm,swpubdate,jn,tablename,subtablename,pubtype,gglxdm,swlxdm,swfjlxdm,e51,e21,e43,e45,efq,zzrq,ezl,djh,edsr,edjr,bgr,ebx,ebrq,ebrh,htbah,ryr,srr,e54,xkzl,ebar,czr,zqr,esj,emc,yjdmc,yjdggr,qzxkdjh,qzxksxr,qqr,zlqr,e22) select ewr,ewh,hpwjxh,hpwjlxdm,swpubdate,jn,tablename,subtablename,pubtype,gglxdm,swlxdm,swfjlxdm,e51,e21,e43,e45,efq,zzrq,ezl,djh,edsr,edjr,bgr,ebx,ebrq,ebrh,htbah,ryr,srr,e54,xkzl,ebar,czr,zqr,esj,emc,yjdmc,yjdggr,qzxkdjh,qzxksxr,qqr,zlqr,e22 from t_sw_yl l where l.hpwjxh='101663905730';

select * from T_SW_UPDATE_INFO;

SELECT  lower(t.COLUMN_NAME) FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_SW_JM');

select * from T_SW_UPDATE_INFO;


select * from t_sw_yl;

select * from t_sw_err;




/****/
select * from T_SW_ERR where typecode is null;

delete from t_sw_err where typecode is null;

301733694437

select * from T_SW_ERR t where t.hpwjxh='301733694437';

select e.hpwjxh, e.errorseq, e.an,  e.jn, e.tablename, e.subtablename, e.pubtype, e.status from T_SW_ERR e where 1=1 and an like '%2014106391973%'

select lower(sys_guid()) from dual;

select * from t_sw_err e where e.an = '2014104999768';

select distinct e.status from t_sw_err e;

select e.hpwjxh, e.errorseq, e.an,  e.jn, e.tablename, e.subtablename, e.pubtype, e.status from T_SW_ERR e where 1=1

select * from t_sw_yl y where y.hpwjxh='301733694421';

select * from t_sw_yl;

select * from T_SW_REMOVE_BACK;

select * from t_sw_update_info i where i.operid = 'ADMIN';



























































































































/*====================================================================================================================*/
select t.*, t.rowid from t_extract_info t;

select i.jn, i.count, i.pubtype, i.pubdate, i.flowstate, i.tempstate  from t_extract_info i where i.pubtype like '%%' and i.pubdate like '%%';

select i.*, i.rowid, i.flowstate, i.tempstate from T_SINGLE_INFO i order by time desc;

select * from T_SINGLE_INFO;

select i.jn as "jn", i.flowstate as "flowstate", i.tempstate as "tempstate"  from T_SINGLE_INFO i where i.pubtype like '%FMGB%' and i.pubdate like '%20151104%' and (i.an like '%201480023445X%' or i.replacean like '%201480023445X%') order by i.time desc

select i.*, i.rowid from T_EXTRACT_INFO i

select * from t_task_buffer;

/*
出版错误修改列表视图
*/
create or replace view view_CBerrormodify as
select 
sys_guid() || '' as view_CBerrormodifyOID, 
t1."F_JOBID",
t1."F_PUBTYPE",
t1."BDDATE",
t1."F_APPLYNO",
t1."ALLERRCOUNT",
t1."OKERRCOUNT",
t1."F_JOBCODE"
  from (
select f_jobid,
      f_jobcode,
       f_pubtype,
       bddate,
       f_applyno,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
               f_jobcode,
               b.f_pubtype,
               p.bddate,
               f_applyno,
               e.status,
               decode(e.status, '已忽略', '1','已修改','1','已确认','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_fmgb e
         where b.f_jobtype in ('1012', '1912')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
            f_jobcode,
          f_pubtype,
          bddate,
          f_applyno
union


          select f_jobid,
          f_jobcode,
          f_pubtype,
          bddate,
          f_applyno,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
       from (select b.f_jobid,
    f_jobcode,
               b.f_pubtype,
               p.bddate,
               f_applyno,
               e.status,
                decode(e.status, '已忽略', '1','已修改','1','已确认','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_fmsq e
         where b.f_jobtype in ('1011', '1911')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
   f_jobcode,
          f_pubtype,
          bddate,
          f_applyno
union

select f_jobid,
  f_jobcode,
       f_pubtype,
       bddate,
       f_applyno,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
    f_jobcode,
               b.f_pubtype,
               p.bddate,
               f_applyno,
               e.status,
               decode(e.status, '已忽略', '1','已修改','1','已确认','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_xxsq e
         where b.f_jobtype in ('1021', '1921')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
   f_jobcode,
          f_pubtype,
          bddate,
          f_applyno
union


select f_jobid,
  f_jobcode,
       f_pubtype,
       bddate,
       f_applyno,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
    f_jobcode,
               b.f_pubtype, 
               p.bddate,
               f_applyno,
               e.status,
                decode(e.status, '已忽略', '1','已修改','1','已确认','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_wgsq e
         where b.f_jobtype in ('1031', '1931')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
   f_jobcode,
          f_pubtype,
          bddate,
          f_applyno
          )T1
          
          
          
          
 
 
 
create or replace view view_cb_err_list_typecode as
select sys_guid() || '' as VIEW_CB_ERR_LIST_TYPECODEOID, t1."F_JOBID",t1."F_JOBCODE",t1."F_PUBTYPE",t1."TYPECODE",t1."ALLERRCOUNT",t1."OKERRCOUNT"
  from (
 select f_jobid,
      f_jobcode,
       f_pubtype,
       typecode,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
               f_jobcode,
               b.f_pubtype,
               e.typecode,
              decode(e.status, '已忽略', '1','已修改','1','已确认','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_fmgb e
         where b.f_jobtype in ('1012', '1912')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
          f_jobcode,
          f_pubtype,
          typecode
union
 select f_jobid,
      f_jobcode,
       f_pubtype,
       typecode,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
               f_jobcode,
               b.f_pubtype,
               e.typecode,
              decode(e.status, '已忽略', '1','已修改','1','已确认','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_fmSQ e
         where b.f_jobtype in ('1011', '1911')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
          f_jobcode,
          f_pubtype,
          typecode
union
 select f_jobid,
      f_jobcode,
       f_pubtype,
       typecode,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
               f_jobcode,
               b.f_pubtype,
               e.typecode,
              decode(e.status, '已忽略', '1','已修改','1','已确认','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_XXSQ e
         where b.f_jobtype in ('1021', '1921')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
          f_jobcode,
          f_pubtype,
          typecode
union
 select f_jobid,
      f_jobcode,
       f_pubtype,
       typecode,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
               f_jobcode,
               b.f_pubtype,
               e.typecode,
              decode(e.status, '已忽略', '1','已修改','1','已确认','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_WGSQ e
         where b.f_jobtype in ('1031', '1931')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
          f_jobcode,
          f_pubtype,
          typecode
                      )T1;

 





select f.*, f.rowid from  t_err_fmgb f;


 select b.*, b.rowid from t_task_buffer b;


 select * from view_CBerrormodify

 select * from view_cb_err_list_typecode

 









create or replace public synonym  T_ERR_FMGB_CB for T_ERR_FMGB;
create or replace public synonym  T_ERR_FMSQ_CB for T_ERR_FMSQ;
create or replace public synonym  T_ERR_WGSQ_CB for T_ERR_WGSQ;
create or replace public synonym  T_ERR_XXSQ_CB for T_ERR_XXSQ;







select t.*, t.rowid from T_ERR_FMGB_CB t where an = '201480011000X';



SELECT T_ERR_FMGB_CB.RECKEY,T_ERR_FMGB_CB.JN,T_ERR_FMGB_CB.AN,T_ERR_FMGB_CB.JOBCODE,T_ERR_FMGB_CB.TYPECODE,T_ERR_FMGB_CB.ERRORNO,T_ERR_FMGB_CB.ERRORSEQ,T_ERR_FMGB_CB.CONTENT,T_ERR_FMGB_CB.STATUS,T_ERR_FMGB_CB.COMMITOR,T_ERR_FMGB_CB.COMMITTIME,T_ERR_FMGB_CB.MEMO,T_ERR_FMGB_CB.CONFIRMED,T_ERR_FMGB_CB.CONFIRMTIME,T_ERR_FMGB_CB.MANUAL,T_ERR_FMGB_CB.CONFIRMER,T_ERR_FMGB_CB.TIMES,T_ERR_FMGB_CB.FINALCONFIRMOR,T_ERR_FMGB_CB.FINALCOMIRMTIME,T_ERR_FMGB_CB.NOTIFY,T_ERR_FMGB_CB.RECTIME,T_ERR_FMGB_CB.FINALDES,T_ERR_FMGB_CB.SCKMEMO,T_ERR_FMGB_CB.PAGENO,T_ERR_FMGB_CB.POSX,T_ERR_FMGB_CB.POSY,T_ERR_FMGB_CB.POSDX,T_ERR_FMGB_CB.POSDY,T_ERR_FMGB_CB.ITEMNO,T_ERR_FMGB_CB.FILENO,T_ERR_FMGB_CB.SCYISEDIT,T_ERR_FMGB_CB.SCYNOEDITMEMO,T_ERR_FMGB_CB.PD,T_ERR_FMGB_CB.ISZLXM,T_ERR_FMGB_CB.ISCOVER,T_ERR_FMGB_CB.HASZLERR,T_ERR_FMGB_CB.HASQWERR FROM T_ERR_FMGB_CB



select t.*, t.rowid from t_task_buffer t

select t.*, t.rowid from t_task_package t 

select t.*, t.rowid from t_err_fmgb t

select * from view_CBerrormodify;

t_task_buffer b, t_task_package p, t_err_fmgb e

update t_task_package t set t.bddate = '20160510';

update t_err_fmgb t set t.pd = '20160510';



select * from view_CBdatepatentsum;

select * from wf_instance w,  t_desc_fm_gk d where w.jn=d.jn  and w.an=d.an



select * from VIEW_CB_ASSIGNED


select  
substr(processno,0,2) 
from 
pub_process 
where 
ucml_post_fk 
in( select ucml_postoid from ucml_contact  where ucml_useroid ='" + userid + "') 


select * from pub_process;

select * from T_ERR_FMGB_CB ;


select * from view_CBerrormodify


select * from t_task_buffer; 错误修改校验已完成

select b.*, b.rowid from t_task_buffer b; 




select * from t_task_buffer b;
select * from t_task_package p;
select * from t_err_fmgb;


update t_task_buffer b set b.f_jobstate = '错误修改校验已完成', b.f_finishtime = '2016-05-17 11:00:49' where b.f_jobid='066c1bf3-06a0-4a1b-a023-7c5328eba723';


select * from  t_task_buffer b where b.f_jobid='795cbb5c-b43b-4bad-917d-78bcbfa8fdae';


select * from view_cbdatepatentsum;



create or replace view view_cbdatepatentsum as
select
sys_guid() || '' as  View_CBDatePatentSumOID ,
t1."JN",
t1."PUBTYPE",
t1."ACTIVITYCHINESENAME",
t1."JOBCODE",
t1."ISERR",
t1."PATENTCOUNT",
t1."IMAGECOUNT",
t1."ERRCOUNT",
t1."TOTALPAGE"
from (
    select
    f.jn as JN,
    f.pubtype as PUBTYPE,
    f.persistnode as ActivityChineseName ,
    f.jobcode,
   decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
   count( distinct f.an) as patentcount,
   sum(f_allpicnum) as ImageCount,
   sum(f_coverpages) as ErrCount,
   sum(f_pages) as TotalPage
   from
   (
                (
                select
                jn,
                pubtype,
                an,
               decode(persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      persistnode) as persistnode,
               decode(substr(jobcode, 0, 2),
                      '19',
                      '10' || substr(jobcode, 3),
                      '12',
                      '11' || substr(jobcode, 3),
                      jobcode) as jobcode
                from wf_instance
                where
                substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                and iscurrent = '1'
                and ( isfenpei<>'1' or isfenpei is null)
                and PUBTYPE = 'FMGB'
                ) f
                join
                t_desc_fm_gk d
                ON
                f.jn = d.jn
                and
                f.an = d.an
     )
     group by
       f.jn,
       f.pubtype,
       persistnode,
       f.jobcode

    union
    select
    f.jn as JN,
    f.pubtype as PUBTYPE,
    f.persistnode as ActivityChineseName ,
    f.jobcode,
   decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
   count( distinct f.an) as patentcount,
   sum(f_allpicnum) as ImageCount,
   sum(f_coverpages) as ErrCount,
   sum(f_pages) as TotalPage
   from
   (
                (
                select
                jn,
                pubtype,
                an,
               decode(persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      persistnode) as persistnode,
               decode(substr(jobcode, 0, 2),
                      '19',
                      '10' || substr(jobcode, 3),
                      '12',
                      '11' || substr(jobcode, 3),
                      jobcode) as jobcode
                from wf_instance
                where
                substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                and iscurrent = '1'
                and ( isfenpei<>'1' or isfenpei is null)
                and PUBTYPE = 'FMGZ'
                ) f
                join
                t_desc_fm_gz d
                ON
                f.jn = d.jn
                and
                f.an = d.an
     )
     group by
       f.jn,
       f.pubtype,
       persistnode,
       f.jobcode

      union
      select
      f.jn as JN,
      f.pubtype as PUBTYPE,
      f.persistnode as ActivityChineseName ,
      f.jobcode,
     decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
     count( distinct f.an) as patentcount,
     sum(f_allpicnum) as ImageCount,
     sum(f_coverpages) as ErrCount,
     sum(f_pages) as TotalPage
     from
     (
                  (
                  select
                  jn,
                  pubtype,
                  an,
               decode(persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      persistnode) as persistnode,
               decode(substr(jobcode, 0, 2),
                      '19',
                      '10' || substr(jobcode, 3),
                      '12',
                      '11' || substr(jobcode, 3),
                      jobcode) as jobcode
                  from wf_instance
                  where
                  substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                  and iscurrent = '1'
                  and ( isfenpei<>'1' or isfenpei is null)
                  and PUBTYPE = 'FMJM'
                  ) f
                  join
                  t_desc_fm_JM d
                  ON
                  f.jn = d.jn
                  and
                  f.an = d.an
       )
       group by
         f.jn,
         f.pubtype,
         persistnode,
         f.jobcode





        union
        select
        f.jn as JN,
        f.pubtype as PUBTYPE,
        f.persistnode as ActivityChineseName ,
        f.jobcode,
       decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
       count( distinct f.an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
       from
       (
                    (
                    select
                    jn,
                    pubtype,
                    an,
               decode(persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      persistnode) as persistnode,
               decode(substr(jobcode, 0, 2),
                      '19',
                      '10' || substr(jobcode, 3),
                      '12',
                      '11' || substr(jobcode, 3),
                      jobcode) as jobcode
                    from wf_instance
                    where
                    substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and ( isfenpei<>'1' or isfenpei is null)
                    and PUBTYPE = 'FMSQ'
                    ) f
                    join
                    t_desc_fm_sq d
                    ON
                    f.jn = d.jn
                    and
                    f.an = d.an
         )
         group by
           f.jn,
           f.pubtype,
           persistnode,
           f.jobcode



        union
        select
        f.jn as JN,
        f.pubtype as PUBTYPE,
        f.persistnode as ActivityChineseName ,
        f.jobcode,
       decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
       count( distinct f.an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
       from
       (
                    (
                    select
                    jn,
                    pubtype,
                    an,
               decode(persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      persistnode) as persistnode,
               decode(substr(jobcode, 0, 2),
                      '19',
                      '10' || substr(jobcode, 3),
                      '12',
                      '11' || substr(jobcode, 3),
                      jobcode) as jobcode
                    from wf_instance
                    where
                    substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and ( isfenpei<>'1' or isfenpei is null)
                    and PUBTYPE = 'WGGZ'
                    ) f
                    join
                    t_desc_wg_gz d
                    ON
                    f.jn = d.jn
                    and
                    f.an = d.an
         )
         group by
           f.jn,
           f.pubtype,
           persistnode,
           f.jobcode



        union
        select
        f.jn as JN,
        f.pubtype as PUBTYPE,
        f.persistnode as ActivityChineseName ,
        f.jobcode,
       decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
       count( distinct f.an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
       from
       (
                    (
                    select
                    jn,
                    pubtype,
                    an,
               decode(persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      persistnode) as persistnode,
               decode(substr(jobcode, 0, 2),
                      '19',
                      '10' || substr(jobcode, 3),
                      '12',
                      '11' || substr(jobcode, 3),
                      jobcode) as jobcode
                    from wf_instance
                    where
                    substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and ( isfenpei<>'1' or isfenpei is null)
                    and PUBTYPE = 'WGSQ'
                    ) f
                    join
                    t_desc_wg_sq d
                    ON
                    f.jn = d.jn
                    and
                    f.an = d.an
         )
         group by
           f.jn,
           f.pubtype,
           persistnode,
           f.jobcode



        union
        select
        f.jn as JN,
        f.pubtype as PUBTYPE,
        f.persistnode as ActivityChineseName ,
        f.jobcode,
       decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
       count( distinct f.an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
       from
       (
                    (
                    select
                    jn,
                    pubtype,
                    an,
               decode(persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      persistnode) as persistnode,
               decode(substr(jobcode, 0, 2),
                      '19',
                      '10' || substr(jobcode, 3),
                      '12',
                      '11' || substr(jobcode, 3),
                      jobcode) as jobcode
                    from wf_instance
                    where
                    substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and ( isfenpei<>'1' or isfenpei is null)
                    and PUBTYPE = 'XXGZ'
                    ) f
                    join
                    t_desc_xx_gz d
                    ON
                    f.jn = d.jn
                    and
                    f.an = d.an
         )
         group by
           f.jn,
           f.pubtype,
           persistnode,
           f.jobcode



        union
        select
        f.jn as JN,
        f.pubtype as PUBTYPE,
        f.persistnode as ActivityChineseName ,
        f.jobcode,
       decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
       count( distinct f.an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
       from
       (
                    (
                    select
                    jn,
                    pubtype,
                    an,
               decode(persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      persistnode) as persistnode,
               decode(substr(jobcode, 0, 2),
                      '19',
                      '10' || substr(jobcode, 3),
                      '12',
                      '11' || substr(jobcode, 3),
                      jobcode) as jobcode
                    from wf_instance
                    where
                    substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and ( isfenpei<>'1' or isfenpei is null)
                    and PUBTYPE = 'XXJM'
                    ) f
                    join
                    t_desc_xx_jm d
                    ON
                    f.jn = d.jn
                    and
                    f.an = d.an
         )
         group by
           f.jn,
           f.pubtype,
           persistnode,
           f.jobcode
        union
        select
        f.jn as JN,
        f.pubtype as PUBTYPE,
        f.persistnode as ActivityChineseName ,
        f.jobcode,
       decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
       count( distinct f.an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
       from
       (
                    (
                    select
                    jn,
                    pubtype,
                    an,
               decode(persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      persistnode) as persistnode,
               decode(substr(jobcode, 0, 2),
                      '19',
                      '10' || substr(jobcode, 3),
                      '12',
                      '11' || substr(jobcode, 3),
                      jobcode) as jobcode
                    from wf_instance
                    where
                    substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and ( isfenpei<>'1' or isfenpei is null)
                    and PUBTYPE = 'XXSQ'
                    ) f
                    join
                    t_desc_xx_sq d
                    ON
                    f.jn = d.jn
                    and
                    f.an = d.an
         )
         group by
           f.jn,
           f.pubtype,
           persistnode,
           f.jobcode
) T1;

select * from T_SW_ERR;

select e.*, e.rowid from T_SW_ERR e where e.pubtype='FMSW';

select e.hpwjxh,  e.an,  e.jn,  e.tablename,  e.subtablename,  e.pubtype,  e.rowid from T_SW_ERR e where e.pubtype='FMSW' and e.jn='3223';

select e.*,  e.rowid from T_SW_ERR e where e.pubtype='FMGZSW' and e.jn='3223';

SELECT  T_SW_ERR.HPWJXH,T_SW_ERR.JN,T_SW_ERR.AN,T_SW_ERR.JOBCODE,T_SW_ERR.TYPECODE,T_SW_ERR.ERRORNO,T_SW_ERR.ERRORSEQ,T_SW_ERR.CONTENT,T_SW_ERR.STATUS,T_SW_ERR.COMMITOR,T_SW_ERR.COMMITTIME,T_SW_ERR.MEMO,T_SW_ERR.CONFIRMED,T_SW_ERR.CONFIRMTIME,T_SW_ERR.MANUAL,T_SW_ERR.CONFIRMER,T_SW_ERR.TIMES,T_SW_ERR.FINALCONFIRMOR,T_SW_ERR.FINALCOMIRMTIME,T_SW_ERR.NOTIFY,T_SW_ERR.RECTIME,T_SW_ERR.FINALDES,T_SW_ERR.SCKMEMO,T_SW_ERR.PAGENO,T_SW_ERR.POSX,T_SW_ERR.POSY,T_SW_ERR.POSDX,T_SW_ERR.POSDY,T_SW_ERR.ITEMNO,T_SW_ERR.FILENO,T_SW_ERR.SCYISEDIT,T_SW_ERR.SCYNOEDITMEMO,T_SW_ERR.SWPUBDATE,T_SW_ERR.GGLXDM,T_SW_ERR.SWLXDM,T_SW_ERR.SWFJLXDM,T_SW_ERR.TABLENAME,T_SW_ERR.SUBTABLENAME,T_SW_ERR.PUBTYPE FROM T_SW_ERR


select e.*, e.rowid 
from
T_SW_ERR e 
where 
e.pubtype='FMSW' 
or  
e.pubtype='XXSW' 
or 
e.pubtype='WGSW'
and
e.hpwjxh not in(select  l.hpwjxh from t_sw_yl l)
order by e.pubtype
;



select e.*, e.rowid 
from
T_SW_ERR e 
where 
e.pubtype='FMSW' 
and
e.hpwjxh='801733694441'




select e.*, e.rowid 
from
T_SW_ERR e 
where 
e.pubtype='FMSW' 
or  
e.pubtype='XXSW' 
or 
e.pubtype='WGSW'
and
e.hpwjxh not in(select  l.hpwjxh from t_sw_yl l)
order by e.pubtype
;


FMSW
XXSW
WGSW


FMGZSW
XXGZSW
WGGZSW


FMBFWXSW
XXBFWXSW
WGBFWXSW


FMBMSQSW
XXBMSQSW


FMJMSW
XXJMSW


保密专利的解密

FMBMSQSW, XXBMSQSW

FMJMSW XXJMSW

select e.*, e.rowid 
from
T_SW_ERR e
where
e.pubtype='XXGZSW' ;





select y.*, y.rowid from t_sw_bm y  where y.pubtype='XXJMSW' order by y.hpwjxh;

select y.*, y.rowid from t_sw_yl y where 1=2;

select distinct y.hpwjxh, y.rowid from t_sw_yl y;

select y.hpwjxh  from t_sw_yl y  group by y.hpwjxh having count(y.hpwjxh) = 1;

select * from T_REC_PUBNO_FM WHERE JN= AND GGKIND='';

select * from T_REC_PUBNO_FM t

select * from VIEW_EPEX_PUB_LIST;

select * from t_extract_info;

select * from T_REC_PUBNO_FM where jn='3206' and ggkind = 'FMGB' order by pn;

select * from T_ERR_FMGB_CB;

select * from VIEW_CB_ASSIGNED;

SELECT T_ERR_FMGB_CB.RECKEY,T_ERR_FMGB_CB.JN,T_ERR_FMGB_CB.AN,T_ERR_FMGB_CB.JOBCODE,T_ERR_FMGB_CB.TYPECODE,T_ERR_FMGB_CB.ERRORNO,T_ERR_FMGB_CB.ERRORSEQ,T_ERR_FMGB_CB.CONTENT,T_ERR_FMGB_CB.STATUS,T_ERR_FMGB_CB.COMMITOR,T_ERR_FMGB_CB.COMMITTIME,T_ERR_FMGB_CB.MEMO,T_ERR_FMGB_CB.CONFIRMED,T_ERR_FMGB_CB.CONFIRMTIME,T_ERR_FMGB_CB.MANUAL,T_ERR_FMGB_CB.CONFIRMER,T_ERR_FMGB_CB.TIMES,T_ERR_FMGB_CB.FINALCONFIRMOR,T_ERR_FMGB_CB.FINALCOMIRMTIME,T_ERR_FMGB_CB.NOTIFY,T_ERR_FMGB_CB.RECTIME,T_ERR_FMGB_CB.FINALDES,T_ERR_FMGB_CB.SCKMEMO,T_ERR_FMGB_CB.PAGENO,T_ERR_FMGB_CB.POSX,T_ERR_FMGB_CB.POSY,T_ERR_FMGB_CB.POSDX,T_ERR_FMGB_CB.POSDY,T_ERR_FMGB_CB.ITEMNO,T_ERR_FMGB_CB.FILENO,T_ERR_FMGB_CB.SCYISEDIT,T_ERR_FMGB_CB.SCYNOEDITMEMO,T_ERR_FMGB_CB.PD,T_ERR_FMGB_CB.ISZLXM,T_ERR_FMGB_CB.ISCOVER,T_ERR_FMGB_CB.HASZLERR,T_ERR_FMGB_CB.HASQWERR FROM T_ERR_FMGB_CB

select * from T_CATALOG_FM_GK;

select * from T_CATALOG_FM_GK k where k.an = '201410325721X';

/*===========================事务错误================================*/
select t.*, t.rowid from t_sw_err t where t.pubtype = 'FMSW';

select * from t_Sw_Yl;

desc t_sw_yl;

select e.hpwjxh, e.an,  e.jn, e.tablename, e.subtablename, e.pubtype, e.status from T_SW_ERR e where 1=1

select * from VIEW_EPEX_PUB_LIST;

select e.*, e.rowid from t_sw_err e where e.hpwjxh = '301733694420';

select l.*, l.rowid from t_sw_yl l where l.hpwjxh = '301733694420';

select l.*, l.rowid from t_sw_yl l;

select * from VIEW_T_SW_INFO;

select * from t_extract_info;

select * from wf_sw_instance where iscurrent = 1;

select jn, persistnode from wf_sw_instance where iscurrent = 1;

select * from t_sw_remove_back;


insert into t_sw_remove_back(ewr,ewh,hpwjxh,hpwjlxdm,swpubdate,jn,tablename,subtablename,pubtype,gglxdm,swlxdm,swfjlxdm,e51,e21,e43,e45,efq,zzrq,ezl,djh,edsr,edjr,bgr,ebx,ebrq,ebrh,htbah,ryr,srr,e54,xkzl,ebar,czr,zqr,esj,emc,yjdmc,yjdggr,qzxkdjh,qzxksxr,qqr,zlqr,e22) select ewr,ewh,hpwjxh,hpwjlxdm,swpubdate,jn,tablename,subtablename,pubtype,gglxdm,swlxdm,swfjlxdm,e51,e21,e43,e45,efq,zzrq,ezl,djh,edsr,edjr,bgr,ebx,ebrq,ebrh,htbah,ryr,srr,e54,xkzl,ebar,czr,zqr,esj,emc,yjdmc,yjdggr,qzxkdjh,qzxksxr,qqr,zlqr,e22 from t_sw_yl l where l.hpwjxh='101663905730';


select * from t_sw_remove_back;

delete from t_sw_err l where l.hpwjxh = '';

SELECT  lower(t.COLUMN_NAME) FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_SW_JM');

select * from t_sw_err;

































































































































































































