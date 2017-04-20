select 
e.division_id, 
job_id,
sum(salary),
grouping(e.division_id)
from employees2 e
group by rollup(division_id,job_id)
order by division_id;
 

select 
job_id,
sum(salary)
from employees2 e
group by job_id
order by job_id;s



select 
e.division_id,
sum(salary),
grouping(e.division_id)
from employees2 e
group by division_id
order by division_id;

select 
e.division_id, 
job_id,
sum(salary),
grouping(e.division_id)
from employees2 e
group by division_id, rollup(division_id,job_id)
order by division_id;


select 
e.division_id, 
sum(salary),
grouping(e.division_id)
from employees2 e
group by rollup(division_id)
order by division_id

create view v_test as
(
select 1 from dual;
select 2 from dual
)



select id, file_path, archive_inner_path, doc_file_name
from 
select 
ido.pub_date, ido.pub_kind, ido.doc_file, ido.index_file_path, ido.doc_file_name 
from 
s_index_file_detail ido join (select 
    id.doc_file_name 
    from s_index_file_detail id 
    where
    id.data_res = ''
    and
    id.date_publication = ''
    group by id.doc_file_name 
    having count(1) > 1) dup_doc_file_names
on 
ido.doc_file_name = dup_doc_file_names.doc_file_name;















create or replace view view_CBdatepatentsum
(View_BDDatePatentSumOID  ,REGIONNO,PUBTYPE,ACTIVITYCHINESENAME,JOBCODE,ISFAST,ISSECOND,ISERR,PATENTCOUNT,IMAGECOUNT,ERRCOUNT,TOTALPAGE UNIQUE RELY DISABLE NOVALIDATE,CONSTRAINT id8_pk PRIMARY KEY (View_BDDatePatentSumOID) RELY DISABLE NOVALIDATE)
as
select sys_guid() || '' as  View_BDDatePatentSumOID , t1."REGIONNO",t1."PUBTYPE",t1."ACTIVITYCHINESENAME",t1."JOBCODE",t1."ISFAST",t1."ISSECOND",t1."ISERR",t1."PATENTCOUNT",t1."IMAGECOUNT",t1."ERRCOUNT",t1."TOTALPAGE"
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
