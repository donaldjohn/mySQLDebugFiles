 select * from t_err_fmgb_cb where JN ='3217' AND  AN in ('2014105725854', '2015108629463')
 
 JN ='3217' AND  AN='2014106423391' 
 2015108629463
 

 
















select * from t_err_fmgb_cb where JN ='3217' AND  AN='2014105725854'



"JN ='3217' AND  AN='2014105725854'"





































create or replace view view_t_err_fmgb as
select
"RECKEY","JN","AN","JOBCODE","TYPECODE","ERRORNO","ERRORSEQ","CONTENT","STATUS","COMMITOR","COMMITTIME","MEMO","CONFIRMED","CONFIRMTIME","MANUAL","CONFIRMER","TIMES","FINALCONFIRMOR","FINALCOMIRMTIME","NOTIFY","RECTIME","FINALDES","SCKMEMO","PAGENO","POSX","POSY","POSDX","POSDY","ITEMNO","FILENO","SCYISEDIT","SCYNOEDITMEMO","PD","ISZLXM","ISCOVER","HASZLERR","HASQWERR"
from
t_err_fmgb;

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



create or replace view 
view_CBdatepatentsum
(
View_CBDatePatentSumOID,
JN,
PUBTYPE,
ACTIVITYCHINESENAME,
JOBCODE,
ISERR,
PATENTCOUNT,
IMAGECOUNT,
ERRCOUNT,
TOTALPAGE 
UNIQUE RELY DISABLE NOVALIDATE,
CONSTRAINT id8cb_pk
PRIMARY KEY (View_CBDatePatentSumOID) 
RELY DISABLE NOVALIDATE
)
as
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
                persistnode,
                jobcode
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
                persistnode,
                jobcode
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
                  persistnode,
                  jobcode
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
                    persistnode,
                    jobcode
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
                    persistnode,
                    jobcode
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
                    persistnode,
                    jobcode
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
                    persistnode,
                    jobcode
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
                    persistnode,
                    jobcode
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
                    persistnode,
                    jobcode
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
) T1
       
       
       



select * from wf_instance f;


select * from t_desc_fm_gk;

                            (
                            select 
                            jn,
                            pubtype,
                            an,
                            persistnode,
                            jobcode
                            from wf_instance
                            where 
                            substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                            and iscurrent = '1'
                            and ( isfenpei<>'1' or isfenpei is null)
                            and PUBTYPE = 'FMGB'
                            ) f 
                            join 
                            t_desc_fmgk d 
                            ON
                            f.bddate = d.bddate



                            select 
                            pubtype,
                            an,
                            persistnode,
                            jobcode
                            from 
                            wf_instance
                            where 
                            substr(jobcode, 0, 2) in ('10', '19', '11', '12', '31', '32', '51', '52')
                            and iscurrent = '1'
                            and ( isfenpei<>'1' or isfenpei is null)
                            and PUBTYPE = 'FMGB'


select w.instanceid, w.jn, t.jn,  w.an, t.an  from wf_instance w join t_desc_fm_gk t on w.jn=t.jn and w.an=t.an;


/*
               sum(f_allpicnum) as ImageCount,
               sum(f_coverpages) as ErrCount,
               sum(f_pages) as TotalPage
*/               
               

select * from view_CBdatepatentsum


select * from view_CBdatepatentsum;

SELECT COUNT(*) cn1 FROM view_CBdatepatentsum WHERE ( view_CBdatepatentsum.jobcode like'10%' )




CREATE OR REPLACE VIEW VIEW_BD_TODOLIST AS
select sys_guid() || '' as VIEW_BD_TODOLISTOID, t1."PUBTYPE",t1."REGIONNO",t1."PACKGENO",t1.userName,t1."PATENTCOUNT",t1."TOTALPAGE",t1."TOTALIMAGECOUNT",t1."ISFAST",t1."ISSECOND",t1."ISERR",t1."PAGECOUNT",t1."UCML_USEROID",t1."ACTIVITYCHINESENAME"
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
       F_JOBTYPE AS ActivityChineseName

FROM T_TASK_BUFFER  where f_jobstate <>'已完成') T1
  
  
  
select * from t_extract_info;
    
select * from epex.t_pub_list;
  
select sys_guid() from dual;

select  pubtype, date, coutn(*) from epex.t_pub_list  group by  pubtuy,date


create or replace view view_epex_pub_list as
select sys_guid() as view_epex_pub_listOID,  t.pubdate, t.pubtype, count(1) as PatentCount from epex.t_pub_list t group by t.pubdate, t.pubtype;

create or replace view view_epex_pub_list as
select  sys_guid() || '' as view_epex_pub_listOID,  t.pubdate, t.pubtype, count(1) as PatentCount from t_pub_list t group by t.pubdate, t.pubtype;

select * from view_epex_pub_list;

select * from view_epex_pub_list;

SELECT COUNT(*) cn1 FROM VIEW_EPEX_PUB_LIST 

select t.*, t.rowid from T_REQUEST t


SELECT 
T_REQUEST.ASK,
T_REQUEST.ASKTIME,
T_REQUEST.ASKMEMO,
T_REQUEST.ANSWER,
T_REQUEST.ANSWERTIME,
T_REQUEST.ANSWERMEMO,
T_REQUEST.SHIWUGGLXDM,
T_REQUEST.SHIWUFJLXDM,
T_REQUEST.SENDER,
T_REQUEST.PUBDATE,
T_REQUEST.PUBTYPE,
T_REQUEST.AN
FROM T_REQUEST 

SELECT T_REQUEST.ASK,T_REQUEST.ASKTIME,T_REQUEST.ASKMEMO,T_REQUEST.ANSWER,T_REQUEST.ANSWERTIME,T_REQUEST.ANSWERMEMO,T_REQUEST.SHIWUGGLXDM,T_REQUEST.SHIWUFJLXDM,T_REQUEST.SENDER,T_REQUEST.PUBDATE,T_REQUEST.PUBTYPE,T_REQUEST.AN, FROM T_REQUEST 

SELECT T_REQUEST.PUBDATE,T_REQUEST.PUBTYPE,T_REQUEST.ASK,T_REQUEST.AN,T_REQUEST.ASKTIME,T_REQUEST.ASKMEMO,T_REQUEST.ANSWER,T_REQUEST.ANSWERTIME,T_REQUEST.ANSWERMEMO,T_REQUEST.SHIWUGGLXDM,T_REQUEST.SHIWUFJLXDM,T_REQUEST.SENDER FROM T_REQUEST 

select * from T_REQUEST;

SELECT T_REQUEST.PUBDATE,T_REQUEST.ASK,T_REQUEST.PUBTYPE,T_REQUEST.AN,T_REQUEST.ASKTIME,T_REQUEST.ASKMEMO,T_REQUEST.ANSWER,T_REQUEST.ANSWERTIME,T_REQUEST.ANSWERMEMO,T_REQUEST.SHIWUGGLXDM,T_REQUEST.SHIWUFJLXDM,T_REQUEST.SENDER,
(select sys_guid() || '' from dual) as hello FROM T_REQUEST

create or replace view view_T_REQUEST as
select  sys_guid() || '' as view_T_REQUESTOID,  T_REQUEST.PUBDATE,T_REQUEST.PUBTYPE,T_REQUEST.ASK,T_REQUEST.AN,T_REQUEST.ASKTIME,T_REQUEST.ASKMEMO,T_REQUEST.ANSWER,T_REQUEST.ANSWERTIME,T_REQUEST.ANSWERMEMO,T_REQUEST.SHIWUGGLXDM,T_REQUEST.SHIWUFJLXDM,T_REQUEST.SENDER FROM T_REQUEST 



select * from view_T_REQUEST;

select * from T_EXTRACT_INFO

select s.*, s.rowid from T_PUB_INFO_SINGLE s;

insert into T_PUB_INFO_SINGLE (PUBTYPE, PUBDATE, AN, HOWDO, REPLACEAN, REPLACEDATE, SENDOK, EXTRACTOK, ZLXMSENDTIME, ZLXMEXTRACTTIME, SENDERNAME, ISTESTING, GBDSENDTIME, GBDEXTRACTTIME, STATE, SHIWUGGLXDM, SHIWUFJLXDM, SENDTIME)
values ('FMGB', '20151104', '201510308126X', 'DEL', null, null, 1, 1, '20151104', '20151110093440', 'ADMIN', 0, '20151104', null, 0, null, null, to_date('04-11-2015 15:09:56', 'dd-mm-yyyy hh24:mi:ss'));

insert into T_PUB_INFO_SINGLE (PUBTYPE, PUBDATE, AN, HOWDO, REPLACEAN, REPLACEDATE, SENDOK, EXTRACTOK, ZLXMSENDTIME, ZLXMEXTRACTTIME, SENDERNAME, ISTESTING, GBDSENDTIME, GBDEXTRACTTIME, STATE, SHIWUGGLXDM, SHIWUFJLXDM, SENDTIME)
values ('FMGB', '20150924', '2015102931040', 'ADD', null, null, 1, 1, '20150924', '20150924', 'ADMIN', 0, '20150924', '20150924', 0, null, null, to_date('15-10-2015 15:17:47', 'dd-mm-yyyy hh24:mi:ss'));

insert into T_PUB_INFO_SINGLE (PUBTYPE, PUBDATE, AN, HOWDO, REPLACEAN, REPLACEDATE, SENDOK, EXTRACTOK, ZLXMSENDTIME, ZLXMEXTRACTTIME, SENDERNAME, ISTESTING, GBDSENDTIME, GBDEXTRACTTIME, STATE, SHIWUGGLXDM, SHIWUFJLXDM, SENDTIME)
values ('FMGB', '20150924', '2015102931040', 'ADD', null, null, 1, 0, '20150924', null, 'ADMIN', 0, '20150924', null, 0, null, null, to_date('15-10-2015 15:09:56', 'dd-mm-yyyy hh24:mi:ss'));

insert into T_PUB_INFO_SINGLE (PUBTYPE, PUBDATE, AN, HOWDO, REPLACEAN, REPLACEDATE, SENDOK, EXTRACTOK, ZLXMSENDTIME, ZLXMEXTRACTTIME, SENDERNAME, ISTESTING, GBDSENDTIME, GBDEXTRACTTIME, STATE, SHIWUGGLXDM, SHIWUFJLXDM, SENDTIME)
values ('FMSQ', '20151104', '2012101372110', 'DEL', null, null, 1, 1, '20151104', '20151110162732', 'ADMIN', 0, '20151104', null, 0, null, null, to_date('10-11-2015 16:34:28', 'dd-mm-yyyy hh24:mi:ss'));


insert into T_PUB_INFO_SINGLE (PUBTYPE, PUBDATE, AN, HOWDO, REPLACEAN, REPLACEDATE, SENDOK, EXTRACTOK, ZLXMSENDTIME, ZLXMEXTRACTTIME, SENDERNAME, ISTESTING, GBDSENDTIME, GBDEXTRACTTIME, STATE, SHIWUGGLXDM, SHIWUFJLXDM, SENDTIME)
values ('FMGZ', '20151111', '2014800018484', 'DEL', null, null, 1, 1, '20151111', '20151111083625', 'ADMIN', 1, '20151111', null, 0, null, null, to_date('11-11-2015 08:46:38', 'dd-mm-yyyy hh24:mi:ss'));


create or replace view view_T_PUB_INFO_SINGLE as
select  sys_guid() || '' as view_T_PUB_INFO_SINGLEOID,  T_PUB_INFO_SINGLE.Pubtype, T_PUB_INFO_SINGLE.Pubdate, T_PUB_INFO_SINGLE.An, T_PUB_INFO_SINGLE.Howdo, T_PUB_INFO_SINGLE.Replacean, T_PUB_INFO_SINGLE.Replacedate, T_PUB_INFO_SINGLE.Sendok, T_PUB_INFO_SINGLE.Extractok, T_PUB_INFO_SINGLE.Zlxmsendtime, T_PUB_INFO_SINGLE.Zlxmextracttime, T_PUB_INFO_SINGLE.Sendername, T_PUB_INFO_SINGLE.Istesting, T_PUB_INFO_SINGLE.Gbdsendtime, T_PUB_INFO_SINGLE.Gbdextracttime, T_PUB_INFO_SINGLE.State, T_PUB_INFO_SINGLE.Shiwugglxdm, T_PUB_INFO_SINGLE.Shiwufjlxdm FROM T_PUB_INFO_SINGLE 


select * from view_T_PUB_INFO_SINGLE;


select t.*, t.rowid from T_sw_info t;






create or replace view view_T_sw_info as
select  sys_guid() || '' as view_T_sw_infoOID,  T_sw_info.Swpubdate, T_sw_info.Pubtype, T_sw_info.Extractok, T_sw_info.Pubdateok, T_sw_info.Patcount, T_sw_info.Sendtime, T_sw_info.Extracttime, T_sw_info.State, T_sw_info.Pubcomplete FROM T_sw_info 



select * from view_T_sw_info;



select t.*, t.rowid from T_REQUEST t


//单间请求
select * from VIEW_T_REQUEST;





create or replace view view_t_request as
select  
sys_guid() || '' as view_T_REQUESTOID,  
T_REQUEST.PUBDATE,
T_REQUEST.PUBTYPE,
decode(T_REQUEST.ASK, 'Delete', '撤件', '增件') as ASK, 
T_REQUEST.AN,
T_REQUEST.ASKTIME,
T_REQUEST.ASKMEMO,
decode(T_REQUEST.ANSWER, 1,  '已同意', -1, '已拒绝', '') as ANSWER,
T_REQUEST.ANSWERTIME,
T_REQUEST.ANSWERMEMO,
T_REQUEST.SHIWUGGLXDM,
T_REQUEST.SHIWUFJLXDM,
T_REQUEST.SENDER 
FROM 
T_REQUEST


SELECT VIEW_T_REQUEST.VIEW_T_REQUESTOID,VIEW_T_REQUEST.PUBDATE,VIEW_T_REQUEST.PUBTYPE,VIEW_T_REQUEST.ASK,VIEW_T_REQUEST.AN,VIEW_T_REQUEST.ASKTIME,VIEW_T_REQUEST.ASKMEMO,VIEW_T_REQUEST.ANSWER,VIEW_T_REQUEST.ANSWERTIME,VIEW_T_REQUEST.ANSWERMEMO,VIEW_T_REQUEST.SHIWUGGLXDM,VIEW_T_REQUEST.SHIWUFJLXDM,VIEW_T_REQUEST.SENDER FROM VIEW_T_REQUEST 


select v.*, v.rowid from VIEW_T_PUB_INFO_SINGLE v;




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
T_PUB_INFO_SINGLE.Shiwufjlxdm 
FROM 
T_PUB_INFO_SINGLE
where 
T_PUB_INFO_SINGLE.Sendok = 1

select * from T_PUB_FEEDBACK f where f.informed = 0

select * from T_PUB_LIST;

select * from T_SINGLE_INFO

select * from T_PUB_INFO_SINGLE

T_SINGLE_INFO

select * from T_PUB_FEEDBACK


T_PUB_FEEDBACK






/*增件撤件*/
select * from 
T_PUB_INFO_SINGLE s 
left join 
T_PUB_LIST l
on 
s.an = l.an
and
s.pubtype = l.pubtype
and
s.pubdate = l.pubdate
where 
s.sendok = 1 
and
l.issingle = 1


VIEW_T_PUB_INFO_SINGLE
/*获取当前和历史状态*/
select * from T_SINGLE_INFO
select * from 
T_PUB_INFO_SINGLE s ;
select l.*, l.rowid  from
T_PUB_LIST l





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
l.issingle = 1


select t.*, t.rowid from T_REQUEST t;





create or replace public synonym  T_ERR_FMGB_CB for T_ERR_FMGB;
create or replace public synonym  T_ERR_FMSQ_CB for T_ERR_FMSQ;
create or replace public synonym  T_ERR_WGSQ_CB for T_ERR_WGSQ;
create or replace public synonym  T_ERR_XXSQ_CB for T_ERR_XXSQ;

select * from T_ERR_FMGB_CB;





select  substr(processno,0,2) from pub_process where ucml_post_fk in( select ucml_postoid from ucml_contact  where ucml_useroid =










































































































