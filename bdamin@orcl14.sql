select * from t_task_package;
select * from t_task_buffer;




























select * from View_T_CATALOG

select * from user_tab_columns t where t.TABLE_NAME='View_T_CATALOG';

select * from user_views;











select * from view_wf_instance_data;

select * from t_err_f

select * from view_gj_taskinfo;
select * from t_pb_err_check;





create or replace view view_gj_taskinfo as
select
t1.F_JOBID,
t1.F_JOBCODE as F_JOBCODE,
CASE
   WHEN F_JOBCODE LIKE '10%' THEN '说明书错误修改'
   WHEN F_JOBCODE LIKE '11%' THEN '说明书预处理'
   WHEN F_JOBCODE LIKE '31%' THEN '说明书检查修改'
   WHEN F_JOBCODE LIKE '32%' THEN '扉页检查修改'
   WHEN F_JOBCODE LIKE '51%' THEN '说明书质检'
   WHEN F_JOBCODE LIKE '52%' THEN '扉页质检'
END 
as F_JOBCODECN,
t1.F_APPLYNO,
t1.F_PUBTYPE,
t1.F_INSTANCEID,t1.REGNO,t1.BDDATE,t1.ISFINISHED,
t1.ISBACK,t2.F_JOBTYPE,t2.F_JOBSTATE,
t2.F_OPERID,t2.F_OPERNAME,t2.F_ASSIGNTIME,
t2.F_PATENTCOUNT,t2.F_PAGECOUNT,t2.F_FINISHTIME,
t2.F_IMAGECOUNT,t2.F_ERRCOUNT,
t2.F_ISFAST,t2.F_ISSECOND,
t2.F_ISERR,
t3.f_userid,      /*图片修改员*/
t3.f_path,        /*图片路径*/
t3.f_flag        /*图片备注*/     
from
t_task_package t1
left join
t_task_buffer t2
on t1.f_jobid = t2.f_jobid
left join 
pictureinfo t3
on t1.f_applyno = t3.f_applyno and t1.bddate = t3.bddate








create or replace view view_gj_taskinfo as
select
t1.F_JOBID,
t1.F_JOBCODE as F_JOBCODE,
CASE
   WHEN F_JOBCODE LIKE '10%' THEN '说明书错误修改'
   WHEN F_JOBCODE LIKE '11%' THEN '说明书预处理'
   WHEN F_JOBCODE LIKE '31%' THEN '说明书检查修改'
   WHEN F_JOBCODE LIKE '32%' THEN '扉页检查修改'
   WHEN F_JOBCODE LIKE '51%' THEN '说明书质检'
   WHEN F_JOBCODE LIKE '52%' THEN '扉页质检'
END 
as F_JOBCODECN,
t1.F_APPLYNO,
t1.F_PUBTYPE,
t1.F_INSTANCEID,t1.REGNO,t1.BDDATE,t1.ISFINISHED,
t1.ISBACK,t2.F_JOBTYPE,t2.F_JOBSTATE,
t2.F_OPERID,t2.F_OPERNAME,t2.F_ASSIGNTIME,
t2.F_PATENTCOUNT,t2.F_PAGECOUNT,t2.F_FINISHTIME,
t2.F_IMAGECOUNT,t2.F_ERRCOUNT,
t2.F_ISFAST,t2.F_ISSECOND,
t2.F_ISERR,
t3.f_userid,      /*图片修改员*/
t3.f_path,        /*图片路径*/
t3.f_flag,        /*图片备注*/     
t4.describ,        /*排版错误描述*/     
t4.pageno,        /*页码*/
t4.posx,        /**/
t4.posy,        /**/
t4.posdx,        /**/
t4.posdy,        /**/
t4.num,        /*数量*/
t4.recdate        /**/
from
t_task_package t1
left join
t_task_buffer t2
on t1.f_jobid = t2.f_jobid
left join 
pictureinfo t3
on t1.f_applyno = t3.f_applyno and t1.bddate = t3.bddate
left join
t_pb_err_check t4
on t1.f_applyno = t4.an and t1.bddate = t4.bddate



























select * from t_pb_err_check;

select * from pictureinfo;

select userenv('language') from dual;


SELECT T_ERR_FMGB.RECKEY,T_ERR_FMGB.REGNO,T_ERR_FMGB.AN,T_ERR_FMGB.JOBCODE,T_ERR_FMGB.TYPECODE,T_ERR_FMGB.ERRORNO,T_ERR_FMGB.ERRORSEQ,T_ERR_FMGB.CONTENT,T_ERR_FMGB.STATUS,T_ERR_FMGB.COMMITOR,T_ERR_FMGB.COMMITTIME,T_ERR_FMGB.MEMO,T_ERR_FMGB.CONFIRMED,T_ERR_FMGB.CONFIRMTIME,T_ERR_FMGB.MANUAL,T_ERR_FMGB.CONFIRMER,T_ERR_FMGB.TIMES,T_ERR_FMGB.FINALCONFIRMOR,T_ERR_FMGB.FINALCOMIRMTIME,T_ERR_FMGB.NOTIFY,T_ERR_FMGB.RECTIME,T_ERR_FMGB.FINALDES,T_ERR_FMGB.SCKMEMO,T_ERR_FMGB.PAGENO,T_ERR_FMGB.POSX,T_ERR_FMGB.POSY,T_ERR_FMGB.POSDX,T_ERR_FMGB.POSDY,T_ERR_FMGB.ITEMNO,T_ERR_FMGB.FILENO,T_ERR_FMGB.SCYISEDIT,T_ERR_FMGB.SCYNOEDITMEMO,T_ERR_FMGB.BDDATE,T_ERR_FMGB.ISZLXM,T_ERR_FMGB.ISCOVER,T_ERR_FMGB.HASZLERR,T_ERR_FMGB.HASQWERR,CASE WHEN jobcode LIKE '10%' THEN '说明书错误修改' WHEN jobcode LIKE '11%' THEN '说明书预处理' WHEN jobcode LIKE '31%' THEN '说明书检查修改' WHEN jobcode LIKE '32%' THEN '扉页检查修改' WHEN jobcode LIKE '51%' THEN '说明书质检' WHEN jobcode LIKE '52%' THEN '扉页质检' END FROM T_ERR_FMGB




select * from T_ERR_FMGB;










select * from PICTUREINFO;

select e.an, e.bddate, e.* from t_err_fmgb e;


select CASE   WHEN jobcode LIKE '10%' THEN '说明书错误修改'   WHEN jobcode LIKE '11%' THEN '说明书预处理'   WHEN jobcode LIKE '31%' THEN '说明书检查修改'   WHEN jobcode LIKE '32%' THEN '扉页检查修改'   WHEN jobcode LIKE '51%' THEN '说明书质检'   WHEN jobcode LIKE '52%' THEN '扉页质检' END from t_err_fmgb t
select 
CASE
   WHEN jobcode LIKE '10%' THEN '说明书错误修改'
   WHEN jobcode LIKE '11%' THEN '说明书预处理'
   WHEN jobcode LIKE '31%' THEN '说明书检查修改'
   WHEN jobcode LIKE '32%' THEN '扉页检查修改'
   WHEN jobcode LIKE '51%' THEN '说明书质检'
   WHEN jobcode LIKE '52%' THEN '扉页质检'
END 
from
t_err_fmgb t





select e.an, e.bddate,e.jobcode e.* from t_err_fmgb e;













select 
CASE
   WHEN F_JOBCODE LIKE '10%' THEN '说明书错误修改'
   WHEN F_JOBCODE LIKE '11%' THEN '说明书预处理'
   WHEN F_JOBCODE LIKE '31%' THEN '说明书检查修改'
   WHEN F_JOBCODE LIKE '32%' THEN '扉页检查修改'
   WHEN F_JOBCODE LIKE '51%' THEN '说明书质检'
   WHEN F_JOBCODE LIKE '52%' THEN '扉页质检'
END 
from
t_task_package t1
left join
t_task_buffer t2
on t1.f_jobid = t2.f_jobid;





create or replace view view_gj_taskinfo as
select
t1.F_JOBID,
t1.F_JOBCODE as F_JOBCODE,
select 
CASE
   WHEN F_JOBCODE LIKE '10%' THEN '说明书错误修改'
   WHEN F_JOBCODE LIKE '11%' THEN '说明书预处理'
   WHEN F_JOBCODE LIKE '31%' THEN '说明书检查修改'
   WHEN F_JOBCODE LIKE '32%' THEN '扉页检查修改'
   WHEN F_JOBCODE LIKE '51%' THEN '说明书质检'
   WHEN F_JOBCODE LIKE '52%' THEN '扉页质检'
END 
as F_JOBCODECN,
t1.F_APPLYNO,
t1.F_PUBTYPE,
t1.F_INSTANCEID,t1.REGNO,t1.BDDATE,t1.ISFINISHED,
t1.ISBACK,t2.F_JOBTYPE,t2.F_JOBSTATE,
t2.F_OPERID,t2.F_OPERNAME,t2.F_ASSIGNTIME,
t2.F_PATENTCOUNT,t2.F_PAGECOUNT,t2.F_FINISHTIME,
t2.F_IMAGECOUNT,t2.F_ERRCOUNT,
t2.F_ISFAST,t2.F_ISSECOND,t2.F_ISERR
from
t_task_package t1
left join
t_task_buffer t2
on t1.f_jobid = t2.f_jobid;

































select V.F_APPLYNO, v.BDDATE, V.F_PUBTYPE, v.F_JOBCODE from VIEW_GJ_TASKINFO V;

select v.F_JOBCODE, v.f_jobtype from VIEW_GJ_TASKINFO v

2011800027935 20160214103641



select * from t_zj_package;



select count(*) from view_wf_instance_data;
select * from VIEW_BD_TASKINFO;

CREATE OR REPLACE VIEW VIEW_BD_TASKINFO AS
select sys_guid() || '' as VIEW_BD_TASKINFOOID,
t1."PUBTYPE",t1."REGIONNO",
t1."PACKGENO",t1.userName,
t1."PATENTCOUNT",t1."TOTALPAGE",
t1."TOTALIMAGECOUNT",t1."ISFAST",
t1."ISSECOND",t1."ISERR",t1."PAGECOUNT",
t1."UCML_USEROID",
t1."ACTIVITYCHINESENAME",
t1."JOBSTATE",
t1."JOBCODE"
  from (
  SELECT  F_PUBTYPE AS PUBTYPE,
       SUBSTR(F_REGNO, 0, 8) AS RegionNO,
       F_JOBID AS PACKGENO,
       F_PATENTCOUNT AS PATENTCOUNT,
       F_PAGECOUNT AS TotalPage,
       F_IMAGECOUNT AS TotalImageCount,
        decode(F_ISFAST,1,'True','False') as isfast,
        decode(F_ISSECOND,1,'True','False') as ISSECOND,
        decode(F_ISERR,1,'True','False') as ISERR,
       F_PATENTCOUNT AS pagecount,
       F_OPERID AS UCML_UserOID,
       F_OPERNAME AS userName,
       F_JOBTYPE AS JobCode,
       CASE
       WHEN F_JOBTYPE LIKE '10%' THEN '说明书错误修改'
       WHEN F_JOBTYPE LIKE '11%' THEN '说明书预处理'
       WHEN F_JOBTYPE LIKE '31%' THEN '说明书检查修改'
       WHEN F_JOBTYPE LIKE '32%' THEN '扉页检查修改'
       WHEN F_JOBTYPE LIKE '51%' THEN '说明书质检'
       WHEN F_JOBTYPE LIKE '51%' THEN '扉页质检'
       WHEN F_JOBTYPE LIKE '51%' THEN '扉页质检'
       WHEN F_JOBTYPE LIKE '51%' THEN '扉页质检'         
       END
       AS ActivityChineseName,
       f_jobstate as jobstate
  FROM T_TASK_BUFFER) T1;


select * from view_gj_taskinfo;















select value from nls_database_parameters where parameter='NLS_CHARACTERSET';
select * from nls_instance_parameters;


















SELECT * FROM VIEW_BD_TODOLIST;



CREATE OR REPLACE VIEW VIEW_BD_TODOLIST AS
select sys_guid() || '' as VIEW_BD_TODOLISTOID,
t1."PUBTYPE",t1."REGIONNO",t1."PACKGENO",t1.userName,
t1."PATENTCOUNT",t1."TOTALPAGE",t1."TOTALIMAGECOUNT",t1."ISFAST",t1."ISSECOND",
t1."ISERR",t1."PAGECOUNT",t1."UCML_USEROID",
t1."ACTIVITYCHINESENAME",
t1."JOBSTATE"
  from (
    SELECT  F_PUBTYPE AS PUBTYPE,
       SUBSTR(F_REGNO, 0, 8) AS RegionNO,
       F_JOBID AS PACKGENO,
       F_PATENTCOUNT AS PATENTCOUNT,
       F_PAGECOUNT AS TotalPage,
       F_IMAGECOUNT AS TotalImageCount,
        decode(F_ISFAST,1,'True','False') as isfast,
        decode(F_ISSECOND,1,'True','False') as ISSECOND,
        decode(F_ISERR,1,'True','False') as ISERR,
       F_PATENTCOUNT AS pagecount,
       F_OPERID AS UCML_UserOID,
       F_OPERNAME AS userName,
       CASE 
       WHEN F_JOBTYPE LIKE '10%' THEN '说明书错误修改'
       WHEN F_JOBTYPE LIKE '11%' THEN '说明书预处理'
       WHEN F_JOBTYPE LIKE '31%' THEN '说明书检查修改'
       WHEN F_JOBTYPE LIKE '32%' THEN '扉页检查修改'
       WHEN F_JOBTYPE LIKE '14%' THEN '错误流程'
       WHEN F_JOBTYPE LIKE '51%' THEN '说明书质检'
       WHEN F_JOBTYPE LIKE '52%' THEN '扉页质检'
       END
       AS ActivityChineseName, 
       f_jobstate as jobstate
       FROM T_TASK_BUFFER
   ) T1;




SELECT View_BD_ToDoList.View_BD_ToDoListOID,View_BD_ToDoList.PUBTYPE,View_BD_ToDoList.RegionNO,View_BD_ToDoList.PACKGENO,View_BD_ToDoList.TotalPage,View_BD_ToDoList.TotalImageCount,View_BD_ToDoList.IsFast,View_BD_ToDoList.pagecount,View_BD_ToDoList.IsSecond,View_BD_ToDoList.IsErr,View_BD_ToDoList.ActivityChineseName,View_BD_ToDoList.UCML_UserOID,View_BD_ToDoList.userName,View_BD_ToDoList.Jobstate FROM View_BD_ToDoList

SELECT View_BD_ToDoList.View_BD_ToDoListOID,View_BD_ToDoList.PUBTYPE,View_BD_ToDoList.RegionNO,View_BD_ToDoList.PACKGENO,View_BD_ToDoList.TotalPage,View_BD_ToDoList.TotalImageCount,View_BD_ToDoList.IsFast,View_BD_ToDoList.pagecount,View_BD_ToDoList.IsSecond,View_BD_ToDoList.IsErr,View_BD_ToDoList.ActivityChineseName,View_BD_ToDoList.UCML_UserOID,View_BD_ToDoList.userName,View_BD_ToDoList.Jobstate FROM View_BD_ToDoList

select * from VIEW_BD_TODOLIST;

SELECT  *  FROM T_TASK_BUFFER

SELECT  F_PUBTYPE AS PUBTYPE,
       SUBSTR(F_REGNO, 0, 8) AS RegionNO,
       F_JOBID AS PACKGENO,
       F_PATENTCOUNT AS PATENTCOUNT,
       F_PAGECOUNT AS TotalPage,
       F_IMAGECOUNT AS TotalImageCount,
        decode(F_ISFAST,1,'True','False') as isfast,
        decode(F_ISSECOND,1,'True','False') as ISSECOND,
        decode(F_ISERR,1,'True','False') as ISERR,
       F_PATENTCOUNT AS pagecount,
       F_OPERID AS UCML_UserOID,
       F_OPERNAME AS userName,
       F_JOBTYPE AS jobCode,
       c.jobname AS ActivityChineseName,
       f_jobstate AS Jobstate
  FROM T_TASK_BUFFER b left join gongxucodetable c
  on b.f_jobtype = c.jobcode

CREATE OR REPLACE VIEW VIEW_BD_TODOLIST AS
select sys_guid() || '' as VIEW_BD_TODOLISTOID, t1."PUBTYPE",t1."REGIONNO",
t1."PACKGENO",t1.userName,t1."PATENTCOUNT",t1."TOTALPAGE",
t1."TOTALIMAGECOUNT",t1."ISFAST",t1."ISSECOND",t1."ISERR",t1."PAGECOUNT",
t1."UCML_USEROID",t1."ACTIVITYCHINESENAME",
t1."JOBSTATE"
  from (
SELECT  F_PUBTYPE AS PUBTYPE,
       SUBSTR(F_REGNO, 0, 8) AS RegionNO,
       F_JOBID AS PACKGENO,
       F_PATENTCOUNT AS PATENTCOUNT,
       F_PAGECOUNT AS TotalPage,
       F_IMAGECOUNT AS TotalImageCount,
        decode(F_ISFAST,1,'True','False') as isfast,
        decode(F_ISSECOND,1,'True','False') as ISSECOND,
        decode(F_ISERR,1,'True','False') as ISERR,
       F_PATENTCOUNT AS pagecount,
       F_OPERID AS UCML_UserOID,
       F_OPERNAME AS userName,
       F_JOBTYPE AS ActivityChineseName,
       f_jobstate AS Jobstate
  FROM T_TASK_BUFFER) T1;


select * from VIEW_BD_TODOLIST;






select * from View_BD_FLOWINFO;

select * from wf_instance;

select * from View_BD_ToDoList;

select * from t_err_fmgb;

select * from t_task_package p left join t_task_buffer b on p.f_jobid = b.f_jobid;

select * from t_task_buffer t;

select * from t_zj_package t;

SELECT  t.COLUMN_NAME, t.* FROM user_tab_columns t WHERE t.TABLE_NAME= upper('t_task_buffer')

select * from view_GJ_TaskInfo where f_jobcode like '11%'  order by f_applyNo;
select * from view_GJ_TaskInfo where f_jobcode like '3%'  order by f_applyNo;


select * from T_PB_ERR_CHECK;



create or replace view view_GJ_TaskInfo as
select
t1.F_JOBID,t1.F_JOBCODE,t1.F_APPLYNO,t1.F_PUBTYPE,
t1.F_INSTANCEID,t1.REGNO,t1.BDDATE,t1.ISFINISHED,
t1.ISBACK,t2.F_JOBTYPE,t2.F_JOBSTATE,
t2.F_OPERID,t2.F_OPERNAME,t2.F_ASSIGNTIME,
t2.F_PATENTCOUNT,t2.F_PAGECOUNT,t2.F_FINISHTIME,
t2.F_IMAGECOUNT,t2.F_ERRCOUNT,
t2.F_ISFAST,t2.F_ISSECOND,t2.F_ISERR
from
t_task_package t1 
left join
t_task_buffer t2
on t1.f_jobid = t2.f_jobid;














select * from view_t_catalog v where v.AN = '2014800463590' and v.BDDATE = '20160302085329';

SELECT 
View_T_CATALOG.View_T_CATALOGOID,View_T_CATALOG.PubType,
View_T_CATALOG.REGNO,View_T_CATALOG.AN,View_T_CATALOG.PN,
View_T_CATALOG.PD,View_T_CATALOG.AD,
View_T_CATALOG.TI,View_T_CATALOG.E51,
View_T_CATALOG.E62,View_T_CATALOG.E73,
View_T_CATALOG.E71,View_T_CATALOG.EDZ,
View_T_CATALOG.E72,View_T_CATALOG.APC,
View_T_CATALOG.E74,View_T_CATALOG.EDL,
View_T_CATALOG.E56A,View_T_CATALOG.E56B,
View_T_CATALOG.E56C,View_T_CATALOG.ESC,
View_T_CATALOG.E86,View_T_CATALOG.E87,
View_T_CATALOG.E85,View_T_CATALOG.E30,
View_T_CATALOG.E15,View_T_CATALOG.E48,
View_T_CATALOG.E83,View_T_CATALOG.E66,
View_T_CATALOG.ESM,View_T_CATALOG.ECN,
View_T_CATALOG.ZYFT,View_T_CATALOG.BDDATE,
View_T_CATALOG.f_pages,
View_T_CATALOG.f_allpicnum
FROM 
View_T_CATALOG 


select 
*
from
view_t_catalog


create or replace view view_t_catalog as
select 
sys_guid()||'' as View_T_CATALOGOID,
t."PUBTYPE",t."REGNO",t."AN",t."PN",t."PD",
t."AD",t."TI",t."E51",t."E62",t."E73",t."E71",
t."EDZ",t."E72",t."APC",t."E74",t."EDL",t."E56A",
t."E56B",t."E56C",t."ESC",t."E86",t."E87",t."E85",
t."E30",t."E15",t."E48",t."E83",t."E66",t."ESM",
t."ECN",t."ZYFT",t."BDDATE",
t."f_pages" as f_pages,
t."f_allpicnum" as f_allpicnum,
t."f_orixmlname" as f_orixmlname
from (
select 
'FMGB' as PubType,
to_char(t1.AD) as "AD",to_char(t1.AN) as "AN",to_char(t1.APC) as "APC",
to_char(t1.BDDATE) as "BDDATE",to_char(t1.E15) as "E15",
to_char(t1.E30) as "E30",to_char(t1.E48) as "E48",to_char(t1.E51) as "E51",
to_char(t1.E56A) as "E56A",to_char(t1.E56B) as "E56B",to_char(t1.E56C) as "E56C",
to_char(t1.E62) as "E62",to_char(t1.E66) as "E66",to_char(t1.E71) as "E71",
to_char(t1.E72) as "E72",to_char(t1.E73) as "E73",to_char(t1.E74) as "E74",
to_char(t1.E83) as "E83",to_char(t1.E85) as "E85",to_char(t1.E86) as "E86",
to_char(t1.E87) as "E87",to_char(t1.ECN) as "ECN",to_char(t1.EDL) as "EDL",
to_char(t1.EDZ) as "EDZ",to_char(t1.ESC) as "ESC",to_char(t1.ESM) as "ESM",
to_char(t1.PD) as "PD",to_char(t1.PN) as "PN",to_char(t1.REGNO) as "REGNO",
to_char(t1.TI) as "TI",to_char(t1.ZYFT) as "ZYFT",
to_char(t2.f_pages) as "f_pages",
to_char(t2.f_allpicnum) as "f_allpicnum",
to_char(t2.f_orixmlname) as "f_orixmlname"
from
T_CATALOG_FMGB t1  left join t_desc_fmgb t2
on t1.an = t2.an and t1.bddate = t2.bddate
union
select 
'FMSQ' as PubType,
to_char(t1.AD) as "AD",to_char(t1.AN) as "AN",to_char(t1.APC) as "APC",
to_char(t1.BDDATE) as "BDDATE",to_char(t1.E15) as "E15",
to_char(t1.E30) as "E30",to_char(t1.E48) as "E48",to_char(t1.E51) as "E51",
to_char(t1.E56A) as "E56A",to_char(t1.E56B) as "E56B",to_char(t1.E56C) as "E56C",
to_char(t1.E62) as "E62",to_char(t1.E66) as "E66",to_char(t1.E71) as "E71",
to_char(t1.E72) as "E72",to_char(t1.E73) as "E73",to_char(t1.E74) as "E74",
to_char(t1.E83) as "E83",to_char(t1.E85) as "E85",to_char(t1.E86) as "E86",
to_char(t1.E87) as "E87",to_char(t1.ECN) as "ECN",to_char(t1.EDL) as "EDL",
to_char(t1.EDZ) as "EDZ",to_char(t1.ESC) as "ESC",to_char(t1.ESM) as "ESM",
to_char(t1.PD) as "PD",to_char(t1.PN) as "PN",to_char(t1.REGNO) as "REGNO",
to_char(t1.TI) as "TI",to_char(t1.ZYFT) as "ZYFT",
to_char(t2.f_pages) as "f_pages",
to_char(t2.f_allpicnum) as "f_allpicnum",
to_char(t2.f_orixmlname) as "f_orixmlname"
from 
T_CATALOG_FMSQ t1  left join t_desc_fmsq t2
on t1.an = t2.an and t1.bddate = t2.bddate
union
select 
'WGSQ' as PubType,
to_char(t1.AD) as "AD",to_char(t1.AN) as "AN",to_char(t1.APC) as "APC",
to_char(t1.BDDATE) as "BDDATE",to_char(t1.E15) as "E15",
to_char(t1.E30) as "E30",to_char(t1.E48) as "E48",to_char(t1.E51) as "E51",
to_char(t1.E56A) as "E56A",to_char(t1.E56B) as "E56B",to_char(t1.E56C) as "E56C",
to_char(t1.E62) as "E62",to_char(t1.E66) as "E66",to_char(t1.E71) as "E71",
to_char(t1.E72) as "E72",to_char(t1.E73) as "E73",to_char(t1.E74) as "E74",
to_char(t1.E83) as "E83",to_char(t1.E85) as "E85",to_char(t1.E86) as "E86",
to_char(t1.E87) as "E87",to_char(t1.ECN) as "ECN",to_char(t1.EDL) as "EDL",
to_char(t1.EDZ) as "EDZ",to_char(t1.ESC) as "ESC",to_char(t1.ESM) as "ESM",
to_char(t1.PD) as "PD",to_char(t1.PN) as "PN",to_char(t1.REGNO) as "REGNO",
to_char(t1.TI) as "TI",to_char(t1.ZYFT) as "ZYFT",
to_char(t2.f_pages) as "f_pages",
to_char(t2.f_allpicnum) as "f_allpicnum",
to_char(t2.f_orixmlname) as "f_orixmlname"
from 
T_CATALOG_WGSQ t1  left join t_desc_wgsq t2
on t1.an = t2.an and t1.bddate = t2.bddate
union
select
'XXSQ' as PubType,
to_char(t1.AD) as "AD",to_char(t1.AN) as "AN",to_char(t1.APC) as "APC",
to_char(t1.BDDATE) as "BDDATE",to_char(t1.E15) as "E15",
to_char(t1.E30) as "E30",to_char(t1.E48) as "E48",to_char(t1.E51) as "E51",
to_char(t1.E56A) as "E56A",to_char(t1.E56B) as "E56B",to_char(t1.E56C) as "E56C",
to_char(t1.E62) as "E62",to_char(t1.E66) as "E66",to_char(t1.E71) as "E71",
to_char(t1.E72) as "E72",to_char(t1.E73) as "E73",to_char(t1.E74) as "E74",
to_char(t1.E83) as "E83",to_char(t1.E85) as "E85",to_char(t1.E86) as "E86",
to_char(t1.E87) as "E87",to_char(t1.ECN) as "ECN",to_char(t1.EDL) as "EDL",
to_char(t1.EDZ) as "EDZ",to_char(t1.ESC) as "ESC",to_char(t1.ESM) as "ESM",
to_char(t1.PD) as "PD",to_char(t1.PN) as "PN",to_char(t1.REGNO) as "REGNO",
to_char(t1.TI) as "TI",to_char(t1.ZYFT) as "ZYFT",
to_char(t2.f_pages) as "f_pages",
to_char(t2.f_allpicnum) as "f_allpicnum",
to_char(t2.f_orixmlname) as "f_orixmlname"
from
T_CATALOG_XXSQ t1  left join t_desc_xxsq t2
on t1.an = t2.an and t1.bddate = t2.bddate
) 
t;




select * from view_t_catalog;






















select * from View_FlowProcessDate;


select t.iszlxm, t.jobcode, t.status, t.commitor, t.content, t.memo, t.confirmtime, t.finalconfirmor from T_ERR_FMGB t;
select t.iszlxm, t.jobcode, t.status, t.commitor, t.content, t.memo, t.confirmtime, t.finalconfirmor from T_ERR_FMSQ t;
select t.iszlxm, t.jobcode, t.status, t.commitor, t.content, t.memo, t.confirmtime, t.finalconfirmor from T_ERR_WGSQ t;
select t.iszlxm, t.jobcode, t.status, t.commitor, t.content, t.memo, t.confirmtime, t.finalconfirmor from T_ERR_XXSQ t;






























select 
'FMGB' as PubType,
to_char(t1."AD") as "AD"
from 
T_CATALOG_FMGB t1




select 
'FMGB' as PubType,
to_char(t1.AD) as "AD",to_char(t1.AN) as "AN",to_char(t1.APC) as "APC",to_char(t1.BDDATE) as "BDDATE",to_char(t1.E15) as "E15",to_char(t1.E30) as "E30",to_char(t1.E48) as "E48",to_char(t1.E51) as "E51",to_char(t1.E56A) as "E56A",to_char(t1.E56B) as "E56B",to_char(t1.E56C) as "E56C",to_char(t1.E62) as "E62",to_char(t1.E66) as "E66",to_char(t1.E71) as "E71",to_char(t1.E72) as "E72",to_char(t1.E73) as "E73",to_char(t1.E74) as "E74",to_char(t1.E83) as "E83",to_char(t1.E85) as "E85",to_char(t1.E86) as "E86",to_char(t1.E87) as "E87",to_char(t1.ECN) as "ECN",to_char(t1.EDL) as "EDL",to_char(t1.EDZ) as "EDZ",to_char(t1.ESC) as "ESC",to_char(t1.ESM) as "ESM",to_char(t1.PD) as "PD",to_char(t1.PN) as "PN",to_char(t1.REGNO) as "REGNO",to_char(t1.TI) as "TI",to_char(t1.ZYFT) as "ZYFT"
from
T_CATALOG_FMGB t1



















SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_FMGB') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_FMSQ') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_WGSQ') order by t.COLUMN_NAME asc;
SELECT  t.COLUMN_NAME FROM user_tab_columns t WHERE t.TABLE_NAME= upper('T_CATALOG_XXSQ') order by t.COLUMN_NAME asc;







select * from View_T_CATALOG;























/**

select * from wf_instance t where  iscurrent='1';

select * from wf_instance where bddate='20160302190426';

select  * from all_tables al where al.table_name='wf_instance';

select * from all_tab_columns at where at.TABLE_NAME='wf_instance';

select * from wf_instance t where t.an='2013800791586';

select * from View_FlowInstanceDate;

select * from wf_instance t where t.instanceid='dfa558c4-b2cd-4fda-8adb-09f65341763e';

select * from wf_instance t order by t.instanceid;

select * from wf_instance w

select * from BusiPortalMenu;

select * from wf_instance t order by t.instanceid;

create or replace view view_bddatepatentsum as

'错误流程'

//流程管理视图定义
select a.an, a.pubtype, a.bddate, a.flowtype, (case ancount when 1 then  a.persistnode else decode(a.flowtype , 'SMS', a.persistnode, '') end) as  sms,  case ancount when 1 then  a.persistnode else decode(a.flowtype , 'FY', a.persistnode, '') end as fy
from
(
select w.an, w.pubtype, w.bddate, w.flowtype, w.isfast, w.issecond, w.persistnode, (select count(*) from wf_instance t where (t.an = w.an and t.iscurrent = '1')) as anCount
from 
wf_instance w
where
w.iscurrent = '1'
order by w.an
) a
;



sys_guid()||'' 






//流程管理视图定义


create or replace view view_wf_instance_data as

select sys_guid()||'' as view_wf_instance_dataOID,
m.an, m.pubtype, m.bddate, 
wmsys.wm_concat(sms) as sms, 
wmsys.wm_concat(fy) as fy, 
decode(m.isfast, 1, '是', '否') as isfast,
decode(m.issecond, 1, '是', '否') as issecond
from 
(
select 
a.an, a.pubtype, a.bddate, a.isfast, a.issecond,
decode(a.ancount, 1,  a.persistnode, decode(a.flowtype , 'SMS', a.persistnode, '')) as  sms,  
decode(a.ancount, 1,  a.persistnode, decode(a.flowtype , 'FY', a.persistnode, '')) as fy
from
(
select 
w.an, w.pubtype, w.bddate, w.flowtype, w.isfast, w.issecond, w.persistnode,
(select count(*) from wf_instance t where (t.an = w.an and t.iscurrent = '1')) as anCount
from
wf_instance w
where
w.iscurrent = '1'
) a
)
m
group by(m.an, m.pubtype, m.bddate, m.isfast, m.issecond)
;












select sys_guid() from dual;






select 1 from dual;



select * from view_wf_instance_data w where  1=1 AND PUBTYPE='FMGB' AND substr(BDDATE, 0, 8)>='20150322' AND substr(BDDATE, 0, 8)<='20160322' order by w.bddate;


view_wf_instance_data.view_wf_instance_dataOID,


SELECT 

view_wf_instance_data.BDDATE,view_wf_instance_data.PUBTYPE,view_wf_instance_data.AN,
view_wf_instance_data.ISSECOND,view_wf_instance_data.ISFAST,
view_wf_instance_data.sms,view_wf_instance_data.FY 
FROM view_wf_instance_data 



select * from wf_instance w where w.an='2014800238111';


select * from view_wf_instance_data w where  1=1 AND PUBTYPE='FMSQ' AND IsSecond='是'  AND  substr(BDDATE, 0, 8)>='20160322' AND  substr(BDDATE, 0, 8)<='20160322'



select * from View_BD_ToDoList;

select * from UCML_User;

select * from alUCML_UserOID


SELECT COUNT(*) cn1 FROM View_BD_ToDoList ,UCML_User alUCML_UserOID WHERE (View_BD_ToDoList.UCML_UserOID = alUCML_UserOID.UCML_UserOID (+))


SELECT COUNT(*) cn1 FROM View_BD_ToDoList

SELECT 
View_BD_ToDoList.View_BD_ToDoListOID,
View_BD_ToDoList.PUBTYPE,
View_BD_ToDoList.TotalPage,
View_BD_ToDoList.IsFast,
View_BD_ToDoList.RegionNO,
View_BD_ToDoList.IsSecond,
View_BD_ToDoList.IsErr,
View_BD_ToDoList.ActivityChineseName,
View_BD_ToDoList.TotalImageCount,
View_BD_ToDoList.pagecount,
View_BD_ToDoList.PACKGENO,
View_BD_ToDoList.UCML_UserOID,
View_BD_ToDoList.userName 
FROM 
View_BD_ToDoList






 
WHERE (View_BD_ToDoList.IsSecond = :ucmlSqlParam0)AND (View_BD_ToDoList.IsErr = :ucmlSqlParam1)AND (1=1) 


select * from View_BD_ToDoList;

CREATE OR REPLACE VIEW VIEW_BD_TODOLIST AS
select sys_guid() || '' as VIEW_BD_TODOLISTOID, 
t1."PUBTYPE",
t1."REGIONNO",
t1."PACKGENO",
t1.userName,
t1."PATENTCOUNT",
t1."TOTALPAGE",
t1."TOTALIMAGECOUNT",
t1."ISFAST",
t1."ISSECOND",
t1."ISERR",
t1."PAGECOUNT",
t1."UCML_USEROID",
t1."ACTIVITYCHINESENAME"
from 
(
SELECT  F_PUBTYPE AS PUBTYPE,
       SUBSTR(F_REGNO, 0, 8) AS RegionNO,
       F_JOBID AS PACKGENO,
       F_PATENTCOUNT AS PATENTCOUNT,
       F_PAGECOUNT AS TotalPage,
       F_IMAGECOUNT AS TotalImageCount,
        decode(F_ISFAST,1,'True','False') as isfast,
        decode(F_ISSECOND,1,'True','False') as ISSECOND,
        decode(F_ISERR,1,'True','False') as ISERR,
       F_PATENTCOUNT AS pagecount,
       F_OPERID AS UCML_UserOID,
       F_OPERNAME AS userName,
       F_JOBTYPE AS ActivityChineseName

  FROM T_TASK_BUFFER 
  where  
  f_jobstate <>'已完成'
)
T1;


select * from T_TASK_BUFFER;


select * from VIEW_BD_TODOLIST;






select * from View_BD_ToDoList;







select * from t_backrequestinfo t;


select * from view_wf_instance_data;


select w.an, w.flowtype, w.prenode, w.jobcode from wf_instance w where w.iscurrent='1' order by an;

2013800787275


select w.pubtype  from wf_instance w where w.an='2013800787275';


select distinct pubtype from wf_instance;

select * from  wf_instance;

select t.*, t.rowid from t_backrequestinfo t;


select sys_guid() from dual;





("BDADMIN"."T_BACKREQUESTINFO"."OPERATORTIME")


select *, w.instanceid from wf_instance w ;



select * from View_BD_ToDoList;


select * from t_task_buffer;


select t.*, t.rowid from T_TASK_BUFFER t where t.f_operid='00000000-0000-0000-0000-000000000001';

00000000-0000-0000-0000-000000000001
select u.ucml_useroid, u.usr_login, u.employeename from UCML_User u;


select t.*, t.rowid from T_TASK_BUFFER t;


select * from t_task_package;

select distinct p.f_jobcode from t_task_package p;

select t.*, t.rowid from t_backrequestinfo t;
select distinct v.PACKGENO from View_BD_ToDoList v




select t.*, t.rowid from t_task_package t where t.f_jobid  in (select distinct v.PACKGENO from View_BD_ToDoList v);








select t.*, t.rowid from t_task_package t order by t.f_instanceid;



select * from t_task_package t, wf_instance w where t.f_instanceid = w.instanceid ;

select t.*, t.rowid from t_task_package t where t.f_jobid  in (select distinct v.PACKGENO from View_BD_ToDoList v where v.UCML_USEROID = '00000000-0000-0000-0000-000000000001');


select w.instanceid, w.jobcode from wf_instance w where w.iscurrent=1;
**/


/*
RECID：GUI
REGNO：wf_instance
BDDATE：wf_instance
AN：wf_instance.an
CURRENTJOBCODE：
TOJOBCODE：
OPERATORUSERID： 当前用户名
OPERATORTIME： 2016-03-15 08:51:59
STATE：0
PUBTYPE：wf_instance.PUBTYPE


select v.* from View_BD_ToDoList v where v.UCML_USEROID = '00000000-0000-0000-0000-000000000001';

select t.*, t.rowid from t_task_package t where t.f_jobid  in (select distinct v.PACKGENO from View_BD_ToDoList v where v.UCML_USEROID = '00000000-0000-0000-0000-000000000001');

select t.rowid, t.f_jobid, t.regno, t.bddate, t.f_applyno,  t.f_pubtype, t.f_instanceid, t.f_jobcode, w.jobcode   from t_task_package t, wf_instance w where  t.f_jobid  in (select distinct v.PACKGENO from View_BD_ToDoList v where v.UCML_USEROID = '00000000-0000-0000-0000-000000000001') and t.f_instanceid = w.instanceid and w.iscurrent=1;

select * from  View_BD_ToDoList v;

select t.*, t.rowid from t_task_buffer t where t.f_operid='00000000-0000-0000-0000-000000000001';


select t.rowid, t.f_jobid, t.regno, t.bddate, t.f_applyno,  t.f_pubtype, t.f_instanceid, t.f_jobcode, w.jobcode   from t_task_package t, wf_instance w where  t.f_jobid  in (select distinct v.PACKGENO from View_BD_ToDoList v where v.UCML_USEROID = '00000000-0000-0000-0000-000000000001') and t.f_instanceid = w.instanceid and w.iscurrent=1;



select * from View_instance_With_PKG_INFO;


create or replace view View_instance_With_PKG_INFO as
select sys_guid()||'' as View_instance_With_PKG_INFOOID,
t.f_instanceid as instanceID, 
t.f_jobid as packageNo, 
w.an as an,
w.bddate as bddate,
w.regno as regno,
w.pubtype as pubType,
w.jobcode as currentInsJobCode, 
t.f_jobcode as packageJobCode
from
t_task_package t,
wf_instance w
where
t.f_instanceid = w.instanceid
and 
w.iscurrent=1;


select v.instanceID, v.packageNo, v.an, v.bddate, v.regno, v.pubtype, v.currentInsJobCode, v.packageJobCode from View_instance_With_PKG_INFO v where 1=1;

select 
v.instanceID as "instanceID", 
v.packageNo as "packageNo", 
v.an as "an", 
v.bddate as "bddate", 
v.regno as "regno", 
v.pubtype as "pubtype", 
v.currentInsJobCode as "currentInsJobCode", 
v.packageJobCode as "packageJobCode" 
from View_instance_With_PKG_INFO v where 1=1 and  v.packageNo='20160325000051120002';

select t.*, t.rowid from t_backrequestinfo t;

20160325000051120004


20160325000051120001

select 
sys_guid() || '' as view_bderrormodifyOID, 
t1."F_JOBID",
t1."F_PUBTYPE",
t1."BDDATE",
t1."F_APPLYNO",
t1."F_ISFAST",
t1."F_ISSECOND",
t1."F_ISERR",
t1."ALLERRCOUNT",
t1."OKERRCOUNT",
t1."F_JOBCODE"
from (
select f_jobid,
      f_jobcode,
       f_pubtype,
       bddate,
       f_applyno,
       f_isfast,
       f_issecond,
       f_iserr,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
       from (select b.f_jobid,
               f_jobcode,
               b.f_pubtype,
               p.bddate,
               f_applyno,
               f_isfast,
               f_issecond,
               f_iserr,
               e.status,
               decode(e.status, '已忽略', '1','已修改','1', 0) as okErrcount
              from t_task_buffer b, t_task_package p, t_err_fmgb e
              where b.f_jobtype in ('1012', '1912')
              and b.f_jobid = p.f_jobid
             and p.f_applyno = e.an)
            group by f_jobid,
            f_jobcode,
          f_pubtype,
          bddate,
          f_applyno,
          f_isfast,
          f_issecond,
          f_iserr

union
select f_jobid,
    f_jobcode,
       f_pubtype,
       bddate,
       f_applyno,
       f_isfast,
       f_issecond,
       f_iserr,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
    f_jobcode,
               b.f_pubtype,
               p.bddate,
               f_applyno,
               f_isfast,
               f_issecond,
               f_iserr,
               e.status,
                decode(e.status, '已忽略', '1','已修改','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_fmsq e
         where b.f_jobtype in ('1011', '1911')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
   f_jobcode,
          f_pubtype,
          bddate,
          f_applyno,
          f_isfast,
          f_issecond,
          f_iserr
union
select f_jobid,
  f_jobcode,
       f_pubtype,
       bddate,
       f_applyno,
       f_isfast,
       f_issecond,
       f_iserr,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
    f_jobcode,
               b.f_pubtype,
               p.bddate,
               f_applyno,
               f_isfast,
               f_issecond,
               f_iserr,
               e.status,
               decode(e.status, '已忽略', '1','已修改','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_xxsq e
         where b.f_jobtype in ('1021', '1921')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
   f_jobcode,
          f_pubtype,
          bddate,
          f_applyno,
          f_isfast,
          f_issecond,
          f_iserr
union
select f_jobid,
  f_jobcode,
       f_pubtype,
       bddate,
       f_applyno,
       f_isfast,
       f_issecond,
       f_iserr,
       count(*) as allErrcount,
       sum(okErrcount) as okErrcount
  from (select b.f_jobid,
    f_jobcode,
               b.f_pubtype,
               p.bddate,
               f_applyno,
               f_isfast,
               f_issecond,
               f_iserr,
               e.status,
                decode(e.status, '已忽略', '1','已修改','1', 0) as okErrcount
          from t_task_buffer b, t_task_package p, t_err_wgsq e
         where b.f_jobtype in ('1031', '1931')
           and b.f_jobid = p.f_jobid
           and p.f_applyno = e.an)
 group by f_jobid,
   f_jobcode,
          f_pubtype,
          bddate,
          f_applyno,
          f_isfast,
          f_issecond,
          f_iserr

                      )T1;







select b.f_jobid,            
f_jobcode,
b.f_pubtype,
p.bddate,
f_applyno,
f_isfast,
f_issecond,
f_iserr,
e.status,
decode(e.status, '已忽略', '1','已修改','1', 0) as okErrcount
from 
t_task_buffer b, 
t_task_package p, 
t_err_fmgb e
where b.f_jobtype in ('1012', '1912')
and b.f_jobid = p.f_jobid
 and p.f_applyno = e.an









2015800016322
2014800424666
2015109382330
2015800016286
2014800467303
2014800465810
2015109355117
select * from t_task_buffer b, t_task_package p where  b.f_jobtype in ('1012', '1912') and  b.f_jobid = p.f_jobid;

select t.*, t.rowid from t_err_fmgb t;

jobID
c8d22a5d-5609-47c6-a5a9-aea762f16464
fb852438-62c2-41f4-86ca-f152a0506255
fb852438-62c2-41f4-86ca-f152a0506255
c8d22a5d-5609-47c6-a5a9-aea762f16464




3ba842bd-3cf7-4b0e-b516-c0e66b628caa
select v.rowid,v.* from t_err_WGSQ v where v.an = '2015302636178';

select * from t_err_fmgb f where f.reckey='3ba842bd-3cf7-4b0e-b516-c0e66b628caa';

fmgb
3ba842bd-3cf7-4b0e-b516-c0e66b628caa
xxsq
efff6ad4-51dc-4bf3-aca6-88c3484adc59
e0577223-fd75-4b75-9222-4375709add63
select * from t_err_xxsq f where f.reckey='e0577223-fd75-4b75-9222-4375709add63'
xxsq



select * from t_err_fmgb;

select * from VIEW_SCK_LIST;

select 'FMGB' AS pubtype,t.* from t_err_FMGB t  where status like'%生产科%'  union

select 'FMSQ' AS pubtype,t.* from t_err_FMsq t  where status like'%生产科%' union

select 'XXSQ' AS pubtype,t.* from t_err_xxsq t  where status like'%生产科%' union

select 'WGSQ' AS pubtype,t.* from t_err_WGSQ t  where status like'%生产科%'


//生产科

select * from
(
select 'FMGB' AS pubtype,t.* from t_err_FMGB t    union

select 'FMSQ' AS pubtype,t.* from t_err_FMsq t   union

select 'XXSQ' AS pubtype,t.* from t_err_xxsq t   union

select 'WGSQ' AS pubtype,t.* from t_err_WGSQ t 
) t1
where 
t1.SCKMEMO is not null 


select t.rowid, 'XXSQ' AS pubtype,t.* from t_err_xxsq t where t.reckey='efff6ad4-51dc-4bf3-aca6-88c3484adc59'

 efff6ad4-51dc-4bf3-aca6-88c3484adc59
 

select * from view_sck_list v where v.SCKMEMO is not null;


select 
*
  from (

select 'FMGB' AS pubtype,t.* from t_err_FMGB t   union


select 'FMSQ' AS pubtype,t.* from t_err_FMsq t  union

select 'XXSQ' AS pubtype,t.* from t_err_xxsq t  union

select 'WGSQ' AS pubtype,t.* from t_err_WGSQ t
       ) T1


SELECT BUSINESSFLOWID,COUNT(1) RESULT FROM 
(select * from 
FLOWINSTANCE where flowstatus=0 and BUSINESSFLOWID LIKE 'FLow_BD_%_VER10') GROUP BY  BUSINESSFLOWID HAVING BUSINESSFLOWID LIKE 'FLow_BD_%_VER10'  ORDER BY BUSINESSFLOWID





SELECT 
  SUM (JS_DOING_COUNT) + SUM (JS_FAST_DOING_COUNT) AS JS_DOING_COUNT,
  SUM (JS_ERR_COUNT) AS JS_ERR_COUNT,
  SUM (JY_DOING_COUNT) + SUM (JY_FAST_DOING_COUNT) AS JY_DOING_COUNT,
  SUM (JY_ERR_COUNT) AS JY_ERR_COUNT,
  SUM (NVL(cwxg_FY_DOING_COUNT,0)) + SUM (NVL(cwxg_FY_FAST_DOING_COUNT,0))+ SUM (NVL(cwxg_SMS_DOING_COUNT,0)) + SUM (NVL(cwxg_SMS_FAST_DOING_COUNT,0)) AS cwxg_DOING_COUNT,
  SUM (NVL(cwxg_FY_ERR_COUNT,0)) + SUM (NVL(cwxg_SMS_ERR_COUNT,0))  AS cwxg_ERR_COUNT,
  SUM (YCL_FY_DOING_COUNT) + SUM (YCL_FY_FAST_DOING_COUNT) + SUM (YCL_SMS_DOING_COUNT) + SUM (YCL_SMS_FAST_DOING_COUNT) AS YCL_DOING_COUNT,
  SUM (YCL_FY_ERR_COUNT) + SUM (YCL_SMS_ERR_COUNT) AS YCL_ERR_COUNT,
  SUM (PB_FY_DOING_COUNT) + SUM (PB_FY_FAST_DOING_COUNT) AS PB_FY_DOING_COUNT,
  SUM (PB_FY_ERR_COUNT) AS PB_FY_ERR_COUNT,
  SUM (PB_SMS_DOING_COUNT) + SUM (PB_SMS_FAST_DOING_COUNT) AS PB_SMS_DOING_COUNT,
  SUM (PB_SMS_ERR_COUNT) AS PB_SMS_ERR_COUNT,
  SUM (JCXG_FY_DOING_COUNT) + SUM (JCXG_FY_FAST_DOING_COUNT) AS JCXG_FY_DOING_COUNT,
  SUM (JCXG_FY_ERR_COUNT) AS JCXG_FY_ERR_COUNT,
  SUM (JCXG_SMS_DOING_COUNT) + SUM (JCXG_SMS_FAST_DOING_COUNT) AS JCXG_SMS_DOING_COUNT,
  SUM (JCXG_SMS_ERR_COUNT) AS JCXG_SMS_ERR_COUNT,
  SUM (ZJ_FY_DOING_COUNT) + SUM (ZJ_FY_FAST_DOING_COUNT) AS ZJ_FY_DOING_COUNT,
  SUM (ZJ_FY_ERR_COUNT) AS ZJ_FY_ERR_COUNT,
  SUM (ZJ_SMS_DOING_COUNT) + SUM (ZJ_SMS_FAST_DOING_COUNT) AS ZJ_SMS_DOING_COUNT,
  SUM (ZJ_SMS_ERR_COUNT) AS ZJ_SMS_ERR_COUNT,
  SUM (FK_DOING_COUNT) + SUM (FK_FAST_DOING_COUNT) AS FK_DOING_COUNT,
  SUM (FK_ERR_COUNT) AS FK_ERR_COUNT,
  SUM (FK_OK_COUNT) AS FK_OK_COUNT 
FROM JK_BD_STATE_INFO

select * from JK_BD_STATE_INFO


select CURWAITCOUNT,JS_DOING_COUNT,FK_OK_COUNT,to_char(TIMEPOINT,'hh24:mi')TIMEPOINT from (
select * from (
select JS_DOING_COUNT,CURWAITCOUNT,nvl(FK_OK_COUNT,0)as FK_OK_COUNT,TIMEPOINT from JK_BD_HISTORY_INFO where rownum<=30
order by TIMEPOINT desc 
)  order by TIMEPOINT asc )

select * from  FLOWINSTANCE;

select * from JK_BD_HISTORY_INFO;

select * from JK_BD_STATE_INFO;

select w.pubtype, count(*) as result from wf_instance w where w.iscurrent = 1 group by w.pubtype order by w.pubtype ;


select w.*, w.rowid from wf_instance w

SELECT 
BUSINESSFLOWID,
COUNT(1) RESULT FROM 
(select 
*
from
FLOWINSTANCE 
where 
flowstatus=0 
and 
BUSINESSFLOWID 
LIKE 
'FLow_BD_%_VER10'
) 
GROUP BY  
BUSINESSFLOWID 
HAVING 
BUSINESSFLOWID 
LIKE 'FLow_BD_%_VER10'  
ORDER BY 
BUSINESSFLOWID


insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160602', 'XXSQ', to_date('06-04-2016 16:05:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 43, 0, 0, 10, 0, 0, 10, 0, 0, 1, 0, 0, 14, 0, 0, 3, 0, 0, 2, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);

insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160703', 'XXSQ', to_date('06-04-2016 16:11:33', 'dd-mm-yyyy hh24:mi:ss'), 0, 20, 0, 0, 9, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);

insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160804', 'WGSQ', to_date('06-04-2016 16:11:33', 'dd-mm-yyyy hh24:mi:ss'), 0, 43, 0, 0, 10, 0, 0, 10, 0, 0, 1, 0, 0, 14, 0, 0, 3, 0, 0, 2, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);

insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160726', 'WGSQ', to_date('06-04-2016 16:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 20, 0, 0, 9, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);

insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160212', 'XXSQ', to_date('06-04-2016 16:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 43, 0, 0, 10, 0, 0, 10, 0, 0, 1, 0, 0, 14, 0, 0, 3, 0, 0, 2, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);

insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160323', 'FMSQ', to_date('06-04-2016 16:04:35', 'dd-mm-yyyy hh24:mi:ss'), 0, 43, 0, 0, 10, 0, 0, 10, 0, 0, 1, 0, 0, 14, 0, 0, 3, 0, 0, 2, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);

insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160117', 'FMGB', to_date('06-04-2016 16:11:33', 'dd-mm-yyyy hh24:mi:ss'), null, 20, null, 0, 9, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);

insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160318', 'FMGB', to_date('06-04-2016 16:11:33', 'dd-mm-yyyy hh24:mi:ss'), null, 43, null, 0, 10, 0, 0, 10, 0, 0, 1, 0, 0, 14, 0, 0, 3, 0, 0, 2, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);

insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160119', 'FMSQ', to_date('06-04-2016 16:04:35', 'dd-mm-yyyy hh24:mi:ss'), null, 20, null, 0, 9, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);

insert into JK_BD_HISTORY_INFO (REGNO, PUBTYPE, TIMEPOINT, TOTALCOUNT, CURWAITCOUNT, FEEDBACKCOUNTOFDAY, EXCEPTIONCOUNT, JS_DOING_COUNT, JS_FAST_DOING_COUNT, JS_ERR_COUNT, JY_DOING_COUNT, JY_FAST_DOING_COUNT, JY_ERR_COUNT, CWXG_DOING_COUNT, CWXG_FAST_DOING_COUNT, CWXG_ERR_COUNT, YCL_DOING_COUNT, YCL_FAST_DOING_COUNT, YCL_ERR_COUNT, PB_FY_DOING_COUNT, PB_FY_FAST_DOING_COUNT, PB_FY_ERR_COUNT, PB_SMS_DOING_COUNT, PB_SMS_FAST_DOING_COUNT, PB_SMS_ERR_COUNT, JCXG_FY_DOING_COUNT, JCXG_FY_FAST_DOING_COUNT, JCXG_FY_ERR_COUNT, JCXG_SMS_DOING_COUNT, JCXG_SMS_FAST_DOING_COUNT, JCXG_SMS_ERR_COUNT, ZJ_FY_DOING_COUNT, ZJ_FY_FAST_DOING_COUNT, ZJ_FY_ERR_COUNT, ZJ_SMS_DOING_COUNT, ZJ_SMS_FAST_DOING_COUNT, ZJ_SMS_ERR_COUNT, FK_DOING_COUNT, FK_FAST_DOING_COUNT, FK_ERR_COUNT, FK_OK_COUNT)
values ('20160307', 'FMSQ', to_date('06-04-2016 16:04:35', 'dd-mm-yyyy hh24:mi:ss'), null, 43, null, 0, 10, 0, 0, 10, 0, 0, 1, 0, 0, 14, 0, 0, 3, 0, 0, 2, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, null);


select CURWAITCOUNT,JS_DOING_COUNT,FK_OK_COUNT,to_char(TIMEPOINT,'hh24:mi')TIMEPOINT from (
select * from (
select JS_DOING_COUNT,CURWAITCOUNT,nvl(FK_OK_COUNT,0)as FK_OK_COUNT,TIMEPOINT from JK_BD_HISTORY_INFO where 1=1 and rownum<=30
order by TIMEPOINT desc 
)  order by TIMEPOINT asc )



select i.*,  i.rowid from JK_BD_HISTORY_INFO i where 1=1 and pubtype = 'FMSQ';




SELECT ABS(MOD(DBMS_RANDOM.RANDOM,300)) FROM DUAL;




update JK_BD_HISTORY_INFO i set i.curwaitcount =  ABS(MOD(DBMS_RANDOM.RANDOM,1000)) ;
update JK_BD_HISTORY_INFO i set i.curwaitcount =  ABS(MOD(DBMS_RANDOM.RANDOM,1000)) ;
update JK_BD_HISTORY_INFO i set i.curwaitcount =  ABS(MOD(DBMS_RANDOM.RANDOM,1000)) ;

update JK_BD_HISTORY_INFO i set i.curwaitcount =  ABS(MOD(DBMS_RANDOM.RANDOM,1000)) ;
update JK_BD_HISTORY_INFO i set i.JS_DOING_COUNT =  ABS(MOD(DBMS_RANDOM.RANDOM,1000)) ;
update JK_BD_HISTORY_INFO i set i.FK_OK_COUNT =  ABS(MOD(DBMS_RANDOM.RANDOM,1000)) ;



SELECT 
  SUM (JS_DOING_COUNT) + SUM (JS_FAST_DOING_COUNT) AS JS_DOING_COUNT, 
  SUM (JS_ERR_COUNT) AS JS_ERR_COUNT,
  SUM (JY_DOING_COUNT) + SUM (JY_FAST_DOING_COUNT) AS JY_DOING_COUNT,
  SUM (JY_ERR_COUNT) AS JY_ERR_COUNT,
  SUM (NVL(cwxg_FY_DOING_COUNT,0)) + SUM (NVL(cwxg_FY_FAST_DOING_COUNT,0))+ SUM (NVL(cwxg_SMS_DOING_COUNT,0)) + SUM (NVL(cwxg_SMS_FAST_DOING_COUNT,0)) AS cwxg_DOING_COUNT,
  SUM (NVL(cwxg_FY_ERR_COUNT,0)) + SUM (NVL(cwxg_SMS_ERR_COUNT,0))  AS cwxg_ERR_COUNT,
  SUM (YCL_FY_DOING_COUNT) + SUM (YCL_FY_FAST_DOING_COUNT) + SUM (YCL_SMS_DOING_COUNT) + SUM (YCL_SMS_FAST_DOING_COUNT) AS YCL_DOING_COUNT,
  SUM (YCL_FY_ERR_COUNT) + SUM (YCL_SMS_ERR_COUNT) AS YCL_ERR_COUNT,
  SUM (PB_FY_DOING_COUNT) + SUM (PB_FY_FAST_DOING_COUNT) AS PB_FY_DOING_COUNT,
  SUM (PB_FY_ERR_COUNT) AS PB_FY_ERR_COUNT,
  SUM (PB_SMS_DOING_COUNT) + SUM (PB_SMS_FAST_DOING_COUNT) AS PB_SMS_DOING_COUNT,
  SUM (PB_SMS_ERR_COUNT) AS PB_SMS_ERR_COUNT,
  SUM (JCXG_FY_DOING_COUNT) + SUM (JCXG_FY_FAST_DOING_COUNT) AS JCXG_FY_DOING_COUNT,
  SUM (JCXG_FY_ERR_COUNT) AS JCXG_FY_ERR_COUNT,
  SUM (JCXG_SMS_DOING_COUNT) + SUM (JCXG_SMS_FAST_DOING_COUNT) AS JCXG_SMS_DOING_COUNT,
  SUM (JCXG_SMS_ERR_COUNT) AS JCXG_SMS_ERR_COUNT,
  SUM (ZJ_FY_DOING_COUNT) + SUM (ZJ_FY_FAST_DOING_COUNT) AS ZJ_FY_DOING_COUNT,
  SUM (ZJ_FY_ERR_COUNT) AS ZJ_FY_ERR_COUNT,
  SUM (ZJ_SMS_DOING_COUNT) + SUM (ZJ_SMS_FAST_DOING_COUNT) AS ZJ_SMS_DOING_COUNT,
  SUM (ZJ_SMS_ERR_COUNT) AS ZJ_SMS_ERR_COUNT,
  SUM (FK_DOING_COUNT) + SUM (FK_FAST_DOING_COUNT) AS FK_DOING_COUNT,
  SUM (FK_ERR_COUNT) AS FK_ERR_COUNT,
  SUM (FK_OK_COUNT) AS FK_OK_COUNT 
FROM JK_BD_STATE_INFO
**/
/* Original SQL*/
/
SELECT 
  SUM (JS_DOING_COUNT) + SUM (JS_FAST_DOING_COUNT) AS JS_DOING_COUNT, /*接收*/
  SUM (JS_ERR_COUNT) AS JS_ERR_COUNT,/*接收错误*/
  SUM (JY_DOING_COUNT) + SUM (JY_FAST_DOING_COUNT) AS JY_DOING_COUNT,/*校验*/
  SUM (JY_ERR_COUNT) AS JY_ERR_COUNT,/*校验错误*/
  SUM (NVL(cwxg_FY_DOING_COUNT,0)) + SUM (NVL(cwxg_FY_FAST_DOING_COUNT,0))+ SUM (NVL(cwxg_SMS_DOING_COUNT,0)) + SUM (NVL(cwxg_SMS_FAST_DOING_COUNT,0)) AS cwxg_DOING_COUNT,/*错误修改*/
  SUM (NVL(cwxg_FY_ERR_COUNT,0)) + SUM (NVL(cwxg_SMS_ERR_COUNT,0))  AS cwxg_ERR_COUNT,/*错误修改错误*/
  SUM (YCL_FY_DOING_COUNT) + SUM (YCL_FY_FAST_DOING_COUNT) + SUM (YCL_SMS_DOING_COUNT) + SUM (YCL_SMS_FAST_DOING_COUNT) AS YCL_DOING_COUNT,/*预处理*/
  SUM (YCL_FY_ERR_COUNT) + SUM (YCL_SMS_ERR_COUNT) AS YCL_ERR_COUNT,/*预处理错误*/
  SUM (PB_FY_DOING_COUNT) + SUM (PB_FY_FAST_DOING_COUNT) AS PB_FY_DOING_COUNT,/*扉页排版*/
  SUM (PB_FY_ERR_COUNT) AS PB_FY_ERR_COUNT,/*扉页排版错误*/
  SUM (PB_SMS_DOING_COUNT) + SUM (PB_SMS_FAST_DOING_COUNT) AS PB_SMS_DOING_COUNT,/*说明书排版*/
  SUM (PB_SMS_ERR_COUNT) AS PB_SMS_ERR_COUNT,/*说明书排版错误*/
  SUM (JCXG_FY_DOING_COUNT) + SUM (JCXG_FY_FAST_DOING_COUNT) AS JCXG_FY_DOING_COUNT,/*扉页检查修改*/
  SUM (JCXG_FY_ERR_COUNT) AS JCXG_FY_ERR_COUNT,/*扉页检查修改错误*/
  SUM (JCXG_SMS_DOING_COUNT) + SUM (JCXG_SMS_FAST_DOING_COUNT) AS JCXG_SMS_DOING_COUNT,/*说明书检查修改*/
  SUM (JCXG_SMS_ERR_COUNT) AS JCXG_SMS_ERR_COUNT,/*说明书检查修改错误*/
  SUM (ZJ_FY_DOING_COUNT) + SUM (ZJ_FY_FAST_DOING_COUNT) AS ZJ_FY_DOING_COUNT,/*扉页质检*/
  SUM (ZJ_FY_ERR_COUNT) AS ZJ_FY_ERR_COUNT,/*扉页质检错误*/
  SUM (ZJ_SMS_DOING_COUNT) + SUM (ZJ_SMS_FAST_DOING_COUNT) AS ZJ_SMS_DOING_COUNT,/*说明书质检*/
  SUM (ZJ_SMS_ERR_COUNT) AS ZJ_SMS_ERR_COUNT,/*说明书质检错误*/
  SUM (FK_DOING_COUNT) + SUM (FK_FAST_DOING_COUNT) AS FK_DOING_COUNT,/*反馈*/
  SUM (FK_ERR_COUNT) AS FK_ERR_COUNT,/*反馈错误*/
  SUM (FK_OK_COUNT) AS FK_OK_COUNT /*已反馈错误*/
FROM JK_BD_STATE_INFO


/*Altered SQL*/
SELECT 
  SUM (JS_DOING_COUNT) + SUM (JS_FAST_DOING_COUNT) AS JS_DOING_COUNT, /*接收*/
  SUM (JS_ERR_COUNT) AS JS_ERR_COUNT,/*接收错误*/
  SUM (JY_DOING_COUNT) + SUM (JY_FAST_DOING_COUNT) AS JY_DOING_COUNT,/*校验*/
  SUM (JY_ERR_COUNT) AS JY_ERR_COUNT,/*校验错误*/
  SUM (NVL(cwxg_FY_DOING_COUNT,0)) + SUM (NVL(cwxg_FY_FAST_DOING_COUNT,0)) as cwxg_FY_DOING_COUNT,
  SUM (NVL(cwxg_FY_ERR_COUNT,0)) as cwxg_FY_ERR_COUNT,
  SUM (NVL(cwxg_SMS_DOING_COUNT,0)) + SUM (NVL(cwxg_SMS_FAST_DOING_COUNT,0)) AS cwxg_SMS_DOING_COUNT,/*错误修改*/
  SUM (NVL(cwxg_SMS_ERR_COUNT,0))  AS cwxg_SMS_ERR_COUNT,/*错误修改错误*/
  SUM (YCL_FY_DOING_COUNT) + SUM (YCL_FY_FAST_DOING_COUNT) as YCL_FY_DOING_COUNT,
  SUM (YCL_FY_ERR_COUNT)  as YCL_FY_ERR_COUNT, 
  SUM (YCL_SMS_DOING_COUNT) + SUM (YCL_SMS_FAST_DOING_COUNT) AS YCL_SMS_DOING_COUNT,/*预处理*/
  SUM (YCL_SMS_ERR_COUNT) AS YCL_SMS_ERR_COUNT,/*预处理错误*/
  SUM (PB_FY_DOING_COUNT) + SUM (PB_FY_FAST_DOING_COUNT) AS PB_FY_DOING_COUNT,/*扉页排版*/
  SUM (PB_FY_ERR_COUNT) AS PB_FY_ERR_COUNT,/*扉页排版错误*/
  SUM (PB_SMS_DOING_COUNT) + SUM (PB_SMS_FAST_DOING_COUNT) AS PB_SMS_DOING_COUNT,/*说明书排版*/
  SUM (PB_SMS_ERR_COUNT) AS PB_SMS_ERR_COUNT,/*说明书排版错误*/
  SUM (JCXG_FY_DOING_COUNT) + SUM (JCXG_FY_FAST_DOING_COUNT) AS JCXG_FY_DOING_COUNT,/*扉页检查修改*/
  SUM (JCXG_FY_ERR_COUNT) AS JCXG_FY_ERR_COUNT,/*扉页检查修改错误*/
  SUM (JCXG_SMS_DOING_COUNT) + SUM (JCXG_SMS_FAST_DOING_COUNT) AS JCXG_SMS_DOING_COUNT,/*说明书检查修改*/
  SUM (JCXG_SMS_ERR_COUNT) AS JCXG_SMS_ERR_COUNT,/*说明书检查修改错误*/
  SUM (ZJ_FY_DOING_COUNT) + SUM (ZJ_FY_FAST_DOING_COUNT) AS ZJ_FY_DOING_COUNT,/*扉页质检*/
  SUM (ZJ_FY_ERR_COUNT) AS ZJ_FY_ERR_COUNT,/*扉页质检错误*/
  SUM (ZJ_SMS_DOING_COUNT) + SUM (ZJ_SMS_FAST_DOING_COUNT) AS ZJ_SMS_DOING_COUNT,/*说明书质检*/
  SUM (ZJ_SMS_ERR_COUNT) AS ZJ_SMS_ERR_COUNT,/*说明书质检错误*/
  SUM (FK_DOING_COUNT) + SUM (FK_FAST_DOING_COUNT) AS FK_DOING_COUNT,/*反馈*/
  SUM (FK_ERR_COUNT) AS FK_ERR_COUNT/*反馈错误*/
FROM JK_BD_STATE_INFO


/* 
SELECT 
  SUM (JS_DOING_COUNT) + SUM (JS_FAST_DOING_COUNT) AS JS_DOING_COUNT, 
  SUM (JS_ERR_COUNT) AS JS_ERR_COUNT,
  SUM (JY_DOING_COUNT) + SUM (JY_FAST_DOING_COUNT) AS JY_DOING_COUNT,
  SUM (JY_ERR_COUNT) AS JY_ERR_COUNT,
  SUM (NVL(cwxg_FY_DOING_COUNT,0)) + SUM (NVL(cwxg_FY_FAST_DOING_COUNT,0)) as cwxg_FY_DOING_COUNT,
  SUM (NVL(cwxg_FY_ERR_COUNT,0)) as cwxg_FY_ERR_COUNT,
  SUM (NVL(cwxg_SMS_DOING_COUNT,0)) + SUM (NVL(cwxg_SMS_FAST_DOING_COUNT,0)) AS cwxg_SMS_DOING_COUNT,
  SUM (NVL(cwxg_SMS_ERR_COUNT,0))  AS cwxg_SMS_ERR_COUNT,
  SUM (YCL_FY_DOING_COUNT) + SUM (YCL_FY_FAST_DOING_COUNT) as YCL_FY_DOING_COUNT,
  SUM (YCL_FY_ERR_COUNT)  as YCL_FY_ERR_COUNT, 
  SUM (YCL_SMS_DOING_COUNT) + SUM (YCL_SMS_FAST_DOING_COUNT) AS YCL_SMS_DOING_COUNT,
  SUM (YCL_SMS_ERR_COUNT) AS YCL_SMS_ERR_COUNT,
  SUM (PB_FY_DOING_COUNT) + SUM (PB_FY_FAST_DOING_COUNT) AS PB_FY_DOING_COUNT,
  SUM (PB_FY_ERR_COUNT) AS PB_FY_ERR_COUNT,
  SUM (PB_SMS_DOING_COUNT) + SUM (PB_SMS_FAST_DOING_COUNT) AS PB_SMS_DOING_COUNT,
  SUM (PB_SMS_ERR_COUNT) AS PB_SMS_ERR_COUNT,
  SUM (JCXG_FY_DOING_COUNT) + SUM (JCXG_FY_FAST_DOING_COUNT) AS JCXG_FY_DOING_COUNT,
  SUM (JCXG_FY_ERR_COUNT) AS JCXG_FY_ERR_COUNT,
  SUM (JCXG_SMS_DOING_COUNT) + SUM (JCXG_SMS_FAST_DOING_COUNT) AS JCXG_SMS_DOING_COUNT,
  SUM (JCXG_SMS_ERR_COUNT) AS JCXG_SMS_ERR_COUNT,
  SUM (ZJ_FY_DOING_COUNT) + SUM (ZJ_FY_FAST_DOING_COUNT) AS ZJ_FY_DOING_COUNT,
  SUM (ZJ_FY_ERR_COUNT) AS ZJ_FY_ERR_COUNT,
  SUM (ZJ_SMS_DOING_COUNT) + SUM (ZJ_SMS_FAST_DOING_COUNT) AS ZJ_SMS_DOING_COUNT,
  SUM (ZJ_SMS_ERR_COUNT) AS ZJ_SMS_ERR_COUNT,
  SUM (FK_DOING_COUNT) + SUM (FK_FAST_DOING_COUNT) AS FK_DOING_COUNT,
  SUM (FK_ERR_COUNT) AS FK_ERR_COUNT
FROM JK_BD_STATE_INFO



select * from wf_instance w where w.iscurrent =1 and w.persistnode like '数据%';

select * from wf_instance w where w.iscurrent =1 and w.persistnode = '扉页错误修改';


select distinct w.persistnode from wf_instance w where  w.iscurrent =1;


SELECT 
  SUM (JS_DOING_COUNT) + SUM (JS_FAST_DOING_COUNT) AS JS_DOING_COUNT, 
  SUM (JS_ERR_COUNT) AS JS_ERR_COUNT,
  SUM (JY_DOING_COUNT) + SUM (JY_FAST_DOING_COUNT) AS JY_DOING_COUNT,
  SUM (JY_ERR_COUNT) AS JY_ERR_COUNT,
  SUM (NVL(cwxg_FY_DOING_COUNT,0)) + SUM (NVL(cwxg_FY_FAST_DOING_COUNT,0)) as cwxg_FY_DOING_COUNT,
  SUM (NVL(cwxg_FY_ERR_COUNT,0)) as cwxg_FY_ERR_COUNT,
  SUM (NVL(cwxg_SMS_DOING_COUNT,0)) + SUM (NVL(cwxg_SMS_FAST_DOING_COUNT,0)) AS cwxg_SMS_DOING_COUNT,
  SUM (NVL(cwxg_SMS_ERR_COUNT,0))  AS cwxg_SMS_ERR_COUNT,
  SUM (YCL_FY_DOING_COUNT) + SUM (YCL_FY_FAST_DOING_COUNT) as YCL_FY_DOING_COUNT,
  SUM (YCL_FY_ERR_COUNT)  as YCL_FY_ERR_COUNT, 
  SUM (YCL_SMS_DOING_COUNT) + SUM (YCL_SMS_FAST_DOING_COUNT) AS YCL_SMS_DOING_COUNT,
  SUM (YCL_SMS_ERR_COUNT) AS YCL_SMS_ERR_COUNT,
  SUM (PB_FY_DOING_COUNT) + SUM (PB_FY_FAST_DOING_COUNT) AS PB_FY_DOING_COUNT,
  SUM (PB_FY_ERR_COUNT) AS PB_FY_ERR_COUNT,
  SUM (PB_SMS_DOING_COUNT) + SUM (PB_SMS_FAST_DOING_COUNT) AS PB_SMS_DOING_COUNT,
  SUM (PB_SMS_ERR_COUNT) AS PB_SMS_ERR_COUNT,
  SUM (JCXG_FY_DOING_COUNT) + SUM (JCXG_FY_FAST_DOING_COUNT) AS JCXG_FY_DOING_COUNT,
  SUM (JCXG_FY_ERR_COUNT) AS JCXG_FY_ERR_COUNT,
  SUM (JCXG_SMS_DOING_COUNT) + SUM (JCXG_SMS_FAST_DOING_COUNT) AS JCXG_SMS_DOING_COUNT,
  SUM (JCXG_SMS_ERR_COUNT) AS JCXG_SMS_ERR_COUNT,
  SUM (ZJ_FY_DOING_COUNT) + SUM (ZJ_FY_FAST_DOING_COUNT) AS ZJ_FY_DOING_COUNT,
  SUM (ZJ_FY_ERR_COUNT) AS ZJ_FY_ERR_COUNT,
  SUM (ZJ_SMS_DOING_COUNT) + SUM (ZJ_SMS_FAST_DOING_COUNT) AS ZJ_SMS_DOING_COUNT,
  SUM (ZJ_SMS_ERR_COUNT) AS ZJ_SMS_ERR_COUNT,
  SUM (FK_DOING_COUNT) + SUM (FK_FAST_DOING_COUNT) AS FK_DOING_COUNT,
  SUM (FK_ERR_COUNT) AS FK_ERR_COUNT
FROM JK_BD_STATE_INFO
select i.*, i.rowid from JK_BD_STATE_INFO i
select * from UCML_SYSCONFIG
RealTimeMonitor
**/

/**
select * from wf_instance w, t_task_buffer t  where  w.iscurrent =1 and w.instanceid = t.f_jobId;


create or replace view view_wf_instance_With_OpInfo as
select w.*, t.f_opername, t.f_operid from wf_instance w, t_task_package p, t_task_buffer t where w.instanceid = p.f_instanceid(+) and p.f_jobid = t.f_jobid(+);


select * from view_wf_instance_With_OpInfo;

select * from t_task_buffer;

select * from t_task_package;


create or replace view view_wf_instance_With_OpInfo as
select w.*, t.f_opername, t.f_operid from wf_instance w, t_task_package p, t_task_buffer t where w.iscurrent = 1 and w.instanceid = p.f_instanceid(+) and p.f_jobid = t.f_jobid(+);




select * from view_wf_instance_With_OpInfo;




//加工量统计
select 
CREATEDDATE,
COUNT(1) RESULT 
from 
(
SELECT 
TO_CHAR(SYS_CREATED,'YYYY-MM-DD') CREATEDDATE 
FROM 
TASKTICKET 
WHERE 
ACTIVITYID 
LIKE 'BD_{0}_NODE_FEEDBACK_VER10'
) 
GROUP BY
CREATEDDATE 
having CREATEDDATE>='{1}' and CREATEDDATE<='{2}' 
ORDER BY CREATEDDATE

SELECT 
TO_CHAR(SYS_CREATED,'YYYY-MM-DD') CREATEDDATE 
FROM 
TASKTICKET ;


//拖期监控
select count(shouldfinishdate) as result,shouldfinishdate from (
select to_char(sys_created,'yyyy-MM-dd') as sys_created,to_char(sys_created+5,'yyyy-MM-dd') as shouldfinishdate  from flowinstance where flowstatus=0 
)
group by shouldfinishdate
 having  shouldfinishdate<='{0}' and shouldfinishdate>='{1}'
order by shouldfinishdate

select 
to_char(sys_created,'yyyy-MM-dd') as sys_created,
to_char(sys_created+5,'yyyy-MM-dd') as shouldfinishdate  
from 
flowinstance;





select fh.fddate, count(1) as count from t_desc_fmgb_history fh group by fh.fddate









select fh.fddate, count(1) as count,  'FMGB' as pubtype from t_desc_fmgb_history fh where 


select * from t_desc_fmgb_history;

update t_desc_fmgb_history bh set bh.fddate = TO_CHAR(TO_DATE(bh.regno, 'yyyymmdd') +7, 'yyyymmdd');

select * from t_desc_fmsq_history;

update t_desc_fmsq_history bh set bh.fddate = TO_CHAR(TO_DATE(bh.regno, 'yyyymmdd') +7, 'yyyymmdd');

select * from t_desc_wgsq_history;

update t_desc_wgsq_history bh set bh.fddate = TO_CHAR(TO_DATE(bh.regno, 'yyyymmdd') +7, 'yyyymmdd');

select * from t_desc_xxsq_history;

update t_desc_xxsq_history bh set bh.fddate = TO_CHAR(TO_DATE(bh.regno, 'yyyymmdd') +7, 'yyyymmdd');











select fh.*, fh.rowid from t_desc_fmgb_history fh









select fh.*, fh.rowid from t_desc_fmgb_history fh;


insert into t_desc_fmgb_history select * from t_desc_fmgb_history;



select fh.*, fh.rowid from t_desc_fmgb_history fh;






SELECT  TO_DATE('20140403', 'yyyymmdd') - ADD_MONTHS(TO_DATE('20140403', 'yyyymmdd'), -12) FROM dual;



SELECT  to_char(TO_DATE('20140403', 'yyyymmdd') - TO_DATE('20140404', 'yyyymmdd')) > 0 FROM dual;


select to_char( TO_DATE('20160404', 'yyyymmdd') -1,'d')  from dual



select distinct w.excuteresult from Wf_Instance w where w.iscurrent = 1;

select distinct w.persistnode from Wf_Instance w

select * from log_err w




select CREATEDDATE,COUNT(1) RESULT from (
SELECT TO_CHAR(SYS_CREATED,'YYYY-MM-DD') CREATEDDATE FROM TASKTICKET WHERE ACTIVITYID LIKE 'BD_{0}_NODE_FEEDBACK_VER10'
) GROUP BY CREATEDDATE having CREATEDDATE>='{1}' and CREATEDDATE<='{2}' ORDER BY CREATEDDATE 


select fh.regno, fh.regno + 30 from t_desc_fmgb_history fh;


select sysdate-to_date('20070523 21:23:34',  'yyyymmdd hh24:mi:ss') from dual


select sysdate, sysdate+3 from dual

SELECT  TO_CHAR(ADD_MONTHS(TO_DATE('20140403', 'yyyymmdd'), -12), 'yyyymmdd') FROM dual;



select t1.*,  from 
(
select fh.fddate, count(1) as count,  'FMGB' as pubtype from t_desc_fmgb_history fh group by fh.fddate
) t1, t_desc_fmgb_history t2



create or replace view view_sheng_chan_tj as
select "FDDATE","COUNT","OCOUNT","ECOUNT","PUBTYPE" from
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'FMGB' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_fmgb_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_fmgb_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_fmgb_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 5
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'FMSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_fmsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_fmsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_fmsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 5
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'WGSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_wgsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_wgsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_wgsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 5
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'XXSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_xxsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_xxsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_xxsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 5
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)







select 
v.FDDATE, v.COUNT, v.OCOUNT, v.ECOUNT, v.PUBTYPE 
from
view_sheng_chan_tj v 
where  
1 = 1 
and  
substr(v.FDDATE, 0, 8)>= '20131123' and substr(v.FDDATE, 0, 8) <= '20161123' 
and v.PUBTYPE = 'FMGB' 
order by v.FDDATE asc;



select
 v.FDDATE, v.COUNT, v.OCOUNT, v.ECOUNT, v.PUBTYPE
   from
 view_sheng_chan_tj v    
 where
 1 = 1
 and substr(v.FDDATE, 0, 8)>= '20160411' and substr(v.FDDATE, 0, 8) <= '20160411'
 and pubtype = 'FMGB'
 order by v.FDDATE asc;
 **/
 /***
SELECT dbms_random.value(5, 12) FROM dual
 
 
select v.FDDATE, v.COUNT, v.OCOUNT, v.ECOUNT, v.PUBTYPE from view_sheng_chan_tj v where 1 = 1 and substr(v.FDDATE, 0, 8)>= '20160411' and substr(v.FDDATE, 0, 8) <= '20160411'  order by v.FDDATE asc;

insert into t_desc_fmgb_history select t.*, TO_CHAR(TO_DATE(t.regno, 'yyyymmdd')  + 5,  'yyyymmdd') from t_desc_fmgb t;


select t.*, TO_CHAR(TO_DATE(t.regno, 'yyyymmdd')  + 5,  'yyyymmdd') from t_desc_fmgb t;


insert into t_desc_fmsq_history select t.*, null from t_desc_fmsq t;

insert into t_desc_wgsq_history select t.*, null from t_desc_wgsq t;

insert into t_desc_xxsq_history select t.*, null from t_desc_xxsq t;


select * from t_desc_fmgb_history t;

select * from t_desc_fmsq_history t;

select * from t_desc_wgsq_history t;

select * from t_desc_xxsq_history t;

update t_desc_fmgb_history h set h.fddate =to_char( (to_date(h.regno, 'yyyymmdd') + dbms_random.value(5, 12) ), 'yyyymmdd' );

update t_desc_fmsq_history h set h.fddate = to_char( (to_date(substr(h.regno, 0, 8), 'yyyymmdd') + dbms_random.value(5, 12) ), 'yyyymmdd' );

update t_desc_wgsq_history h set h.fddate =to_char( (to_date(substr(h.regno, 0, 8), 'yyyymmdd') + dbms_random.value(5, 12) ), 'yyyymmdd' );

update t_desc_xxsq_history h set h.fddate = to_char((to_date(substr(h.regno, 0, 8), 'yyyymmdd') + dbms_random.value(5, 12) ), 'yyyymmdd' );



select
 v.FDDATE, sum(v.COUNT), sum(v.OCOUNT), sum(v.ECOUNT)
   from
(
select "FDDATE","COUNT","OCOUNT","ECOUNT","PUBTYPE" from
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'FMGB' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_fmgb_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_fmgb_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_fmgb_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 5
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'FMSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_fmsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_fmsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_fmsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 5
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'WGSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_wgsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_wgsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_wgsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 5
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'XXSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_xxsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_xxsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_xxsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 5
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
) v  


 where 1 = 1 and substr(v.FDDATE, 0, 8)>= '{0}' and substr(v.FDDATE, 0, 8) <= '{1}' {2} order by v.FDDATE asc




where v.PUBTYPE='FMGB'
group by v.FDDATE
 order by fddate asc
 
 
 










select
 v.FDDATE, 
 sum(v.COUNT) as "COUNT", 
 sum(v.OCOUNT) as OCOUNT, 
 sum(v.ECOUNT) as ECOUNT
 from
(
select FDDATE,COUNT,OCOUNT,ECOUNT,PUBTYPE from
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'FMGB' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_fmgb_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_fmgb_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_fmgb_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 7
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'FMSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_fmsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_fmsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_fmsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 7
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'WGSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_wgsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_wgsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_wgsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 7
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'XXSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_xxsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_xxsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_xxsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 7
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
)
v  
group by v.FDDATE
order by v.FDDATE asc




/*-----------------------------------------*/

/**
select
 v.FDDATE, 
 sum(v.COUNT) as "COUNT", 
 sum(v.OCOUNT) as OCOUNT, 
 sum(v.ECOUNT) as ECOUNT
 from
(
select FDDATE,COUNT,OCOUNT,ECOUNT,PUBTYPE from
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'FMGB' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_fmgb_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_fmgb_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_fmgb_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 7
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'FMSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_fmsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_fmsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_fmsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 7
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'WGSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_wgsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_wgsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_wgsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 7
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
union all
(
select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'XXSQ' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_xxsq_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_xxsq_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_xxsq_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 7
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
)
)
v  
where 1 = 1 and substr(v.FDDATE, 0, 8) > '20150414' and  substr(v.FDDATE, 0, 8) < '20160413'
group by v.FDDATE
order by v.FDDATE asc




select t1.fddate, t1.count,  NVL(t2.ocount, 0) as ocount,  NVL(t3.ecount, 0) as ecount,  'FMGB' as pubType
from
(
select fh.fddate, count(1) as count from t_desc_fmgb_history fh group by fh.fddate
) t1
left join
(
select ofh.fddate, count(1) as ocount from t_desc_fmgb_history ofh group by ofh.fddate
) t2
on t2.fddate = TO_CHAR(ADD_MONTHS(TO_DATE(substr(t1.fddate, 0, 8), 'yyyymmdd'), -12), 'yyyymmdd')
left join
(
select f.fddate, count(1) as ecount
from
(
select
fh.fddate
from t_desc_fmgb_history fh
where
(TO_DATE(substr(fh.fddate, 0, 8), 'yyyymmdd') - TO_DATE(substr(fh.regno, 0, 8), 'yyyymmdd')) > 7
) f group by f.fddate
) t3
on t1.fddate = t3.fddate
where 1 = 1 and substr(t1.FDDATE, 0, 8) > '20150414' and  substr(t1.FDDATE, 0, 8) < '20160413' 
select h.*, h.rowid from t_desc_fmgb_history h;
*/



select * from BM_Activity;


select * from VIEW_SCK_LIST 
where 
 1=1  and status like '%生产科%' AND  REGNO>='20150415' AND  REGNO<='20160415'



select t.*, t.rowid from t_err_FMGB t;







create or replace view view_sck_list as
select sys_guid() || '' as VIEW_SCK_LISTOID, t1."PUBTYPE",t1."RECKEY",t1."REGNO",t1."AN",t1."JOBCODE",t1."TYPECODE",t1."ERRORNO",t1."ERRORSEQ",t1."CONTENT",t1."STATUS",t1."COMMITOR",t1."COMMITTIME",t1."MEMO",t1."CONFIRMED",t1."CONFIRMTIME",t1."MANUAL",t1."CONFIRMER",t1."TIMES",t1."FINALCONFIRMOR",t1."FINALCOMIRMTIME",t1."NOTIFY",t1."RECTIME",t1."FINALDES",t1."SCKMEMO",t1."PAGENO",t1."POSX",t1."POSY",t1."POSDX",t1."POSDY",t1."ITEMNO",t1."FILENO",t1."SCYISEDIT",t1."SCYNOEDITMEMO",t1."BDDATE",t1."ISZLXM",t1."ISCOVER",t1."HASZLERR",t1."HASQWERR"
  from (

select 'FMGB' AS pubtype,t.* from t_err_FMGB t    union


select 'FMSQ' AS pubtype,t.* from t_err_FMsq t  union

select 'XXSQ' AS pubtype,t.* from t_err_xxsq t union

select 'WGSQ' AS pubtype,t.* from t_err_WGSQ t
       ) T1;





select * from View_BDDatePatentSum
select * from View_BDDatePatentSum where jobcode is null


select * from view_bddatepatentsum;



create or replace view view_bddatepatentsum
(
View_BDDatePatentSumOID  ,
REGIONNO,PUBTYPE,
ACTIVITYCHINESENAME,
JOBCODE,
ISFAST,
ISSECOND,
ISERR,
PATENTCOUNT,
IMAGECOUNT,
ERRCOUNT,
TOTALPAGE 
UNIQUE RELY DISABLE NOVALIDATE,
CONSTRAINT id8_pk 
PRIMARY KEY (View_BDDatePatentSumOID) 
RELY 
DISABLE 
NOVALIDATE)
as
select s
ys_guid() || '' as  View_BDDatePatentSumOID , 
t1."REGIONNO",
t1."PUBTYPE",
t1."ACTIVITYCHINESENAME",
t1."JOBCODE",
t1."ISFAST",
t1."ISSECOND",
t1."ISERR",
t1."PATENTCOUNT",
t1."IMAGECOUNT",
t1."ERRCOUNT",
t1."TOTALPAGE"
  from (
        select f.regno as RegionNO,
                f.pubtype as PUBTYPE,
                f.persistnode as ActivityChineseName ,
                f.jobcode,
               decode(f.isfast,1,'True','False') as IsFast,
               decode(f.issecond,1,'True','False') as IsSecond,
               decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
               count( distinct f.an) as patentcount,
                sum(f_allpicnum) as ImageCount,
                sum(f_coverpages) as ErrCount,
                sum(f_pages) as TotalPage
          from ((select regno,pubtype,bddate,an,persistnode,jobcode,isfast,issecond
                    from wf_instance
                   where substr(jobcode, 0, 2) in
                         ('10', '19', '11', '12', '31', '32', '51', '52')
                     and iscurrent = '1'
                       and ( isfenpei<>'1' or isfenpei is null)
                     and PUBTYPE = 'FMGB') f join t_desc_fmgb d ON
                 f.bddate = d.bddate)
         group by f.regno,
                   f.pubtype,
                   persistnode,
                   f.jobcode,
                   f.isfast,
                   f.issecond
                   union
                   select f.regno as RegionNO,
                f.pubtype as PUBTYPE,
                f.persistnode as ActivityChineseName ,
                f.jobcode,
               decode(f.isfast,1,'True','False') as IsFast,
               decode(f.issecond,1,'True','False') as IsSecond,
               decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
               count( distinct f.an) as patentcount,
                sum(f_allpicnum) as ImageCount,
                sum(f_coverpages) as ErrCount,
                sum(f_pages) as TotalPage
          from ((select regno,pubtype,bddate,an,persistnode,jobcode,isfast,issecond
                    from wf_instance
                   where substr(jobcode, 0, 2) in
                         ('10', '19', '11', '12', '31', '32', '51', '52')
                     and iscurrent = '1'
                       and ( isfenpei<>'1' or isfenpei is null)
                     and PUBTYPE = 'FMSQ') f join t_desc_fmsq d ON
                 f.bddate = d.bddate)
         group by f.regno,
                   f.pubtype,
                   persistnode,
                   f.jobcode,
                   f.isfast,
                   f.issecond
                   union
                   select f.regno as RegionNO,
                f.pubtype as PUBTYPE,
                f.persistnode as ActivityChineseName ,
                f.jobcode,
               decode(f.isfast,1,'True','False') as IsFast,
               decode(f.issecond,1,'True','False') as IsSecond,
               decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
               count( distinct f.an) as patentcount,
                sum(f_allpicnum) as ImageCount,
                sum(f_coverpages) as ErrCount,
                sum(f_pages) as TotalPage
          from ((select regno,pubtype,bddate,an,persistnode,jobcode,isfast,issecond
                    from wf_instance
                   where substr(jobcode, 0, 2) in
                         ('10', '19', '11', '12', '31', '32', '51', '52')
                     and iscurrent = '1'
                       and ( isfenpei<>'1' or isfenpei is null)
                     and PUBTYPE = 'XXSQ') f join t_desc_XXSQ d ON
                 f.bddate = d.bddate)
         group by f.regno,
                   f.pubtype,
                   persistnode,
                   f.jobcode,
                   f.isfast,
                   f.issecond
                   union
                   select f.regno as RegionNO,
                f.pubtype as PUBTYPE,
                f.persistnode as ActivityChineseName ,
                f.jobcode,
               decode(f.isfast,1,'True','False') as IsFast,
               decode(f.issecond,1,'True','False') as IsSecond,
               decode(substr(f.jobcode,0,2),'99','True','False') as IsErr,
               count( distinct f.an) as patentcount,
                sum(f_allpicnum) as ImageCount,
                sum(f_coverpages) as ErrCount,
                sum(f_pages) as TotalPage
          from ((select regno,pubtype,bddate,an,persistnode,jobcode,isfast,issecond
                    from wf_instance
                   where substr(jobcode, 0, 2) in
                         ('10', '19', '11', '12', '31', '32', '51', '52')
                     and iscurrent = '1'
                       and ( isfenpei<>'1' or isfenpei is null)
                     and PUBTYPE = 'WGSQ') f join t_desc_WGSQ d ON
                 f.bddate = d.bddate)
         group by f.regno,
                   f.pubtype,
                   persistnode,
                   f.jobcode,
                   f.isfast,
                   f.issecond
       ) T1
       
       

SELECT View_BDDatePatentSum.View_BDDatePatentSumOID,View_BDDatePatentSum.RegionNO,View_BDDatePatentSum.patentcount,View_BDDatePatentSum.TotalPage,View_BDDatePatentSum.ImageCount,View_BDDatePatentSum.PUBTYPE,View_BDDatePatentSum.ActivityChineseName,View_BDDatePatentSum.jobcode,View_BDDatePatentSum.IsFast,View_BDDatePatentSum.IsSecond,View_BDDatePatentSum.IsErr FROM View_BDDatePatentSum WHERE ( View_BDDatePatentSum.jobcode like'10%' ) 


select * from VIEW_SCK_LIST;



select * from View_BDDatePatentSum;


Select * from View_BDErrorModify


select * from t_task_buffer;


select 'FMGB' AS pubtype,t.* from t_err_FMGB t  where status like'%生产科%'  

select 'FMSQ' AS pubtype,t.* from t_err_FMsq t  where status like'%生产科%' 

select 'XXSQ' AS pubtype,t.* from t_err_xxsq t  where status like'%生产科%' 

select 'WGSQ' AS pubtype,t.* from t_err_WGSQ t  where status like'%生产科%'

select p.*, p.rowid from t_task_package p;

select p.f_jobid, p.f_jobcode, p.f_pubtype, p.bddate, p.f_applyno p.rowid from t_task_package p;





select * from view_BDerrormodify


select * from VIEW_BD_ERR_LIST_TYPECODE









select * from View_BDDatePatentSum

select w.persistnode from wf_instance w;





create or replace view view_bddatepatentsum as
select sys_guid() || '' as  View_BDDatePatentSumOID , t1."REGIONNO",t1."PUBTYPE",t1."ACTIVITYCHINESENAME",t1."JOBCODE",t1."ISFAST",t1."ISSECOND",t1."ISERR",t1."PATENTCOUNT",t1."IMAGECOUNT",t1."ERRCOUNT",t1."TOTALPAGE"
  from (

select RegionNO,
       PUBTYPE,
       persistnode as ActivityChineseName,
       jobcode,
       IsFast,
       IsSecond,
       IsErr,
       count(distinct  an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
  from (
               select f.regno as RegionNO,
               f.pubtype as PUBTYPE,
               decode(f.persistnode,
                      '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      f.persistnode) as persistnode,
               decode(substr(f.jobcode, 0, 2),                    '19',
                      '10' || substr(f.jobcode, 3),
                      '12',
                      '11' || substr(f.jobcode, 3),
                      f.jobcode) as jobcode,
               decode(f.isfast, 1, 'True', 'False') as IsFast,
               decode(f.issecond, 1, 'True', 'False') as IsSecond,
               decode(substr(f.jobcode, 0, 2), '99', 'True', 'False') as IsErr,
               f.an,
               f_allpicnum ,
               f_coverpages ,
               f_pages


          from ((select regno,
                        pubtype,
                        bddate,
                        an,
                        persistnode,
                        jobcode,
                        isfast,
                        issecond
                   from wf_instance
                  where substr(jobcode, 0, 2) in
                        ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and (isfenpei <> '1' or isfenpei is null)
                    and PUBTYPE = 'FMGB') f join t_desc_fmgb d ON
                f.bddate = d.bddate))
 group by RegionNO, PUBTYPE, persistnode, jobcode, IsFast, issecond, IsErr
                   union

select RegionNO,
       PUBTYPE,
       persistnode as ActivityChineseName,
       jobcode,
       IsFast,
       IsSecond,
       IsErr,
       count(distinct  an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
  from (select f.regno as RegionNO,
               f.pubtype as PUBTYPE,
               decode(f.persistnode,
                    '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      f.persistnode) as persistnode,
               decode(substr(f.jobcode, 0, 2),
                      '19',
                      '10' || substr(f.jobcode, 3),
                      '12',
                      '11' || substr(f.jobcode, 3),
                      f.jobcode) as jobcode,
               decode(f.isfast, 1, 'True', 'False') as IsFast,
               decode(f.issecond, 1, 'True', 'False') as IsSecond,
               decode(substr(f.jobcode, 0, 2), '99', 'True', 'False') as IsErr,


              f.an,
       f_allpicnum ,
        f_coverpages ,
       f_pages


          from ((select regno,
                        pubtype,
                        bddate,
                        an,
                        persistnode,
                        jobcode,
                        isfast,
                        issecond
                   from wf_instance
                  where substr(jobcode, 0, 2) in
                        ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and (isfenpei <> '1' or isfenpei is null)
                    and PUBTYPE = 'FMSQ') f join t_desc_fmSQ d ON
                f.bddate = d.bddate))
 group by RegionNO, PUBTYPE, persistnode, jobcode, IsFast, issecond, IsErr
                   union

select RegionNO,
       PUBTYPE,
       persistnode as ActivityChineseName,
       jobcode,
       IsFast,
       IsSecond,
       IsErr,
       count(distinct  an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
  from (select f.regno as RegionNO,
               f.pubtype as PUBTYPE,
               decode(f.persistnode,
                    '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      f.persistnode) as persistnode,
               decode(substr(f.jobcode, 0, 2),
                      '19',
                      '10' || substr(f.jobcode, 3),
                      '12',
                      '11' || substr(f.jobcode, 3),
                      f.jobcode) as jobcode,
               decode(f.isfast, 1, 'True', 'False') as IsFast,
               decode(f.issecond, 1, 'True', 'False') as IsSecond,
               decode(substr(f.jobcode, 0, 2), '99', 'True', 'False') as IsErr,


              f.an,
       f_allpicnum ,
        f_coverpages ,
       f_pages


          from ((select regno,
                        pubtype,
                        bddate,
                        an,
                        persistnode,
                        jobcode,
                        isfast,
                        issecond
                   from wf_instance
                  where substr(jobcode, 0, 2) in
                        ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and (isfenpei <> '1' or isfenpei is null)
                    and PUBTYPE = 'XXSQ') f join t_desc_XXSQ d ON
                f.bddate = d.bddate))
 group by RegionNO, PUBTYPE, persistnode, jobcode, IsFast, issecond, IsErr
                   union

select RegionNO,
       PUBTYPE,
       persistnode as ActivityChineseName,
       jobcode,
       IsFast,
       IsSecond,
       IsErr,
       count(distinct  an) as patentcount,
       sum(f_allpicnum) as ImageCount,
       sum(f_coverpages) as ErrCount,
       sum(f_pages) as TotalPage
  from (select f.regno as RegionNO,
               f.pubtype as PUBTYPE,
               decode(f.persistnode,
                    '扉页错误修改',
                      '错误修改',
                      '说明书错误修改',
                      '错误修改',
                      '扉页预处理',
                      '预处理',
                      '说明书预处理',
                      '预处理',
                      f.persistnode) as persistnode,
               decode(substr(f.jobcode, 0, 2),
                      '19',
                      '10' || substr(f.jobcode, 3),
                      '12',
                      '11' || substr(f.jobcode, 3),
                      f.jobcode) as jobcode,
               decode(f.isfast, 1, 'True', 'False') as IsFast,
               decode(f.issecond, 1, 'True', 'False') as IsSecond,
               decode(substr(f.jobcode, 0, 2), '99', 'True', 'False') as IsErr,


              f.an,
       f_allpicnum ,
        f_coverpages ,
       f_pages


          from ((select regno,
                        pubtype,
                        bddate,
                        an,
                        persistnode,
                        jobcode,
                        isfast,
                        issecond
                   from wf_instance
                  where substr(jobcode, 0, 2) in
                        ('10', '19', '11', '12', '31', '32', '51', '52')
                    and iscurrent = '1'
                    and (isfenpei <> '1' or isfenpei is null)
                    and PUBTYPE = 'WGSQ') f join t_desc_WGSQ d ON
                f.bddate = d.bddate))
 group by RegionNO, PUBTYPE, persistnode, jobcode, IsFast, issecond, IsErr

       ) T1;
alter view VIEW_BDDATEPATENTSUM
  add constraint ID_PKSUM primary key (VIEW_BDDATEPATENTSUMOID)
  disable novalidate;
alter view VIEW_BDDATEPATENTSUM
  add unique (TOTALPAGE)
  disable novalidate;

select * from BD_PROCESS_Seting


select * from t_catalog_fmgb;











































































