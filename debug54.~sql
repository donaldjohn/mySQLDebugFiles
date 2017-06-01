select dtl.id, 'select * from '||dtl.table_name || '; --' || dtl.id from s_data_resource_types_detail dtl where dtl.id in (13, 132,133,134,136,137,138,139,153,162,172,180, 231, 232, 233, 234);



--13
update S_CHINA_STANDARD_SIMPCITATION doc set doc.batch = substr(doc.file_path, instr(doc.file_path, '\', -1, 2) + 1, instr(doc.file_path, '\', -1, 1) - instr(doc.file_path, '\', -1, 2) -1);


alter table S_CHINA_STANDARD_SIMPCITATION add batch varchar2(1000);
alter table S_CHINA_BRAND add batch varchar2(1000);
alter table S_CHINA_BRAND_LICENSE add batch varchar2(1000);
alter table S_CHINA_BRAND_TRANSFER add batch varchar2(1000);
alter table S_MADRID_BRAND_ENTER_CHINA add batch varchar2(1000);
alter table S_CHINA_WELLKNOWN_BRAND add batch varchar2(1000);
alter table S_AMERICA_APPLY_BRAND add batch varchar2(1000);
alter table S_AMERICA_TRANSFER_BRAND add batch varchar2(1000);
alter table S_JOURNAL_PROJECT_ABSTRACT add batch varchar2(1000);
alter table S_CHINA_COURTCASE_PROCESS add batch varchar2(1000);
alter table S_MADRID_BRAND_PURCHASE add batch varchar2(1000);
alter table S_CHINA_PATENT_LAWSPROCESS add batch varchar2(1000);
alter table S_WORLD_PATENT_LAWSTATUS add batch varchar2(1000);
alter table S_STD_JP_CIT add batch varchar2(1000);
alter table S_STD_KR_CIT add batch varchar2(1000);
alter table S_STD_KR_PRS add batch varchar2(1000);



select 
doc.file_path, 
substr(doc.file_path, instr(doc.file_path, '\', -1, 2) + 1, instr(doc.file_path, '\', -1, 1) - instr(doc.file_path, '\', -1, 2) -1) 
from 
S_CHINA_STANDARD_SIMPCITATION doc;


select 
'--13' || chr(10) || 'update S_CHINA_STANDARD_SIMPCITATION doc set doc.batch = substr(doc.file_path, instr(doc.file_path, ''\'', -1, 2) + 1, instr(doc.file_path, ''\'', -1, 1) - instr(doc.file_path, ''\'', -1, 2) -1)'
from
dual;


update S_CHINA_STANDARD_SIMPCITATION doc set doc.batch = substr(doc.file_path, instr(doc.file_path, '\', -1, 2) + 1, instr(doc.file_path, '\', -1, 1) - instr(doc.file_path, '\', -1, 2) -1)



'alter table S_CHINA_STANDARD_SIMPCITATION add batch varchar2(1000);'




select dtl.id, dtl.table_name, 
'alter table '||dtl.table_name||' add batch varchar2(1000);' ,
'--'||dtl.id||' ' || chr(10) || 'update '|| dtl.table_name ||' doc set doc.batch = substr(doc.file_path, instr(doc.file_path, ''\'', -1, 2) + 1, instr(doc.file_path, ''\'', -1, 1) - instr(doc.file_path, ''\'', -1, 2) -1);'
from s_data_resource_types_detail dtl where dtl.id in (13, 132,133,134,136,137,138,139,153,162,172,180, 231, 232, 233, 234);



select dtl.id,
'select * from s_index_file_detail idl where idl.data_res = '''|| dtl.chinese_name ||''';-- '||dtl.id||''
||
chr(10)
||
'select * from '||dtl.table_name||';--' || dtl.id
 expr from s_data_resource_types_detail dtl where dtl.id in (13, 231, 232, 233, 234)
union
select dtl.id,
'select * from s_np_index_file_detail idl where idl.data_res = '''|| dtl.chinese_name ||''';-- '||dtl.id||'' 
||
chr(10)
||
'select * from '||dtl.table_name||';--' || dtl.id
expr from s_data_resource_types_detail dtl where dtl.id in (132,133,134,136,137,138,139,153,162,172,180) 
order by id;




select dtl.chinese_name, dtl.table_name from s_data_resource_types_detail dtl order by dtl.id;







select * from S_INDEX_FILE_DETAIL dtl where dtl.data_res='韩国法律状态数据(STD_KR_PRS)（标准化）' and rownum < 10;










-- Add/modify columns 
alter table S_INDEX_FILE_DETAIL rename column application_num to dc_APPLICATION_NUM;
alter table S_INDEX_FILE_DETAIL rename column application_date to dc_APPLICATION_DATE;
alter table S_INDEX_FILE_DETAIL rename column publication_num to dc_PUBLICATION_NUM;
alter table S_INDEX_FILE_DETAIL rename column publication_date to dc_PUBLICATION_DATE;
alter table S_INDEX_FILE_DETAIL rename column an to dc_AN;
alter table S_INDEX_FILE_DETAIL rename column country to dc_COUNTRY;


update s_data_resource_types_detail dtl set dtl.haschecker = 'Y' where dtl.id in (231, 232, 233, 234);
commit;







alter table S_NP_INDEX_FILE_DETAIL add doclist_count varchar2(100);



update s_data_resource_types_detail dtl set dtl.haschecker = 'Y'
where dtl.id in (132,133,134,136,137, 138, 139, 153, 162, 172, 180);
commit;



select listagg(dtl.id || ',') within group (order by dtl.id) from s_data_resource_types_detail dtl where dtl.haschecker = 'Y';

select inf.* from S_INDEX_FILE_INFO inf where inf.data_res = '中外期刊的著录项目与文摘数据';

select count(*) from s_index_file_detail dtl where dtl.data_res = '中外期刊的著录项目与文摘数据';



select sum(inf.doclist_count) from S_NP_INDEX_FILE_INFO inf where inf.data_res = '中外期刊的著录项目与文摘数据';

select count(*) from s_NP_index_file_detail dtl where dtl.data_res = '中外期刊的著录项目与文摘数据';






select distinct dtl.data_res from s_index_file_detail dtl;


select inf.* from S_NP_INDEX_FILE_INFO inf where inf.data_res = '中外期刊的著录项目与文摘数据';
select inf.id, inf.pat_cnt, inf. from S_INDEX_FILE_detail inf where inf.data_res = '中外期刊的著录项目与文摘数据';








select rowid, dtl.* from s_data_resource_types_detail dtl where dtl.chinese_name like '%商标%';


alter table S_NP_INDEX_FILE_INFO rename column total_size to zip_size;


create table S_NP_INDEX_FILE_INFO
(
  id                    VARCHAR2(100) not null,
  zip_file                 VARCHAR2(100),
  date_exchange         VARCHAR2(100),
  date_produced         VARCHAR2(100),
  pat_cnt               VARCHAR2(100),
  file_cnt               VARCHAR2(100),
  total_size               VARCHAR2(100),
  md5               VARCHAR2(100),
  doc_status               VARCHAR2(100),
  
  data_res              VARCHAR2(100),
  file_path             VARCHAR2(4000),
  import_time           TIMESTAMP(6),
  fully_imported        VARCHAR2(100),
  validate_data_success VARCHAR2(100),
  self_check_successed  VARCHAR2(100),
  note                  VARCHAR2(4000),
  doclist_count         VARCHAR2(1000),
  pub_kind              VARCHAR2(20),
  pub_type              VARCHAR2(200),
  index_file_name       VARCHAR2(200),
  batch                 VARCHAR2(1000)
);
-- Create/Recreate indexes
create index NPINDEXINFOFILEPATH on S_NP_INDEX_FILE_INFO (FILE_PATH);
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_NP_INDEX_FILE_INFO
  add constraint NPINDEXINFOPRIMARYK primary key (ID);



























create table S_NP_INDEX_FILE_DETAIL
(
  id                    VARCHAR2(100) not null,
  zip_file                  VARCHAR2(100),
  dateExchange         VARCHAR2(100),
  dateProduced         VARCHAR2(100),
  patcnt               VARCHAR2(100),
  filecnt               VARCHAR2(100),
  idx_size                  VARCHAR2(100),
  idx_status                VARCHAR2(100),
  index_file_path       VARCHAR2(4000),
  doclist_topic                 VARCHAR2(500),
  doclist_pn                    VARCHAR2(500),
  doclist_path                  VARCHAR2(100),
  doclist_status                VARCHAR2(100),
  filelist_amount               VARCHAR2(100),
  filelist_path               VARCHAR2(1000),
  doc_filetype            VARCHAR2(1000),
  doc_section            VARCHAR2(1000),
  doc_size            VARCHAR2(1000),
  doc_file_name         VARCHAR2(1000),
  batch                 VARCHAR2(1000),
  import_time           TIMESTAMP(6),
  data_res              VARCHAR2(500),
  index_info_id         VARCHAR2(100),
  validate_data_success VARCHAR2(100),
  self_check_successed  VARCHAR2(100),
  note                  VARCHAR2(4000)
);


-- Create/Recreate indexes 
create index NPIDX_DT_DOC_NAME on S_NP_INDEX_FILE_DETAIL (DOC_FILE_NAME);
create index NPINDEXDETILFILEPATH on S_NP_INDEX_FILE_DETAIL (INDEX_FILE_PATH);
create bitmap index NPI_IDX_DT_DATA_RES on S_NP_INDEX_FILE_DETAIL (DATA_RES);
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_NP_INDEX_FILE_DETAIL
  add constraint NPINDEXFILEKEY primary key (ID);


alter table s_index_file_detail add batch  varchar2(1000);






-- Add/modify columns 
alter table S_INDEX_FILE_INFO add batch varchar2(1000);





drop table S_T_MEDICINE_HANDLE_T1;

alter table S_T_MEDICINE_TRANS_T1 modify id VARCHAR2(100);
alter table S_T_MEDICINE_TRANS_T2 modify id VARCHAR2(100);
alter table S_T_PHARMACEUTICAL_T1 modify id VARCHAR2(100);
alter table S_T_PHARMACEUTICAL_T2 modify id VARCHAR2(100);
alter table S_T_PHARMACEUTICAL_T3 modify id VARCHAR2(100);
alter table S_T_MEDICINE_HANDLE_T1 modify id VARCHAR2(100);
alter table S_T_MEDICINE_HANDLE_T2 modify id VARCHAR2(100);
alter table S_T_MEDICINE_HANDLE_T3 modify id VARCHAR2(100);


drop table S_T_MEDICINE_TRANS_T1;
select * from S_T_MEDICINE_TRANS_T2;
select dtl.*, dtl.rowid from s_data_resource_types_detail dtl;
select count(*) from S_CHINA_PATENT_INVALID;



select * from s_china_patent_invalid;



delete from S_CHINA_PATENT_INVALID dt where dt.file_path='';



-- Create table
create table S_CHINA_PATENT_INVALID
(
  id                       VARCHAR2(50) not null,
  cn_decision_number       VARCHAR2(50),
  cn_decision_date         DATE,
  application_country      VARCHAR2(50),
  application_number       VARCHAR2(50),
  application_date         DATE,
  assignees                CLOB,
  publication_country      VARCHAR2(50),
  publication_number       VARCHAR2(50),
  publication_date         DATE,
  invention_title          VARCHAR2(500),
  classification_ipc       CLOB,
  cn_appellant             CLOB,
  cn_examiners             CLOB,
  publication_info_country VARCHAR2(50),
  publication_info_number  VARCHAR2(50),
  publication_info_date    DATE,
  cn_pub_vol               VARCHAR2(100),
  cn_law_reference         CLOB,
  cn_main_point            CLOB,
  abstract                 CLOB,
  keyword                  CLOB,
  cn_brief_history         CLOB,
  cn_reasoning             CLOB,
  cn_holding               CLOB,
  path_xml                 VARCHAR2(400),
  import_session_id        NVARCHAR2(100),
  import_time              DATE,
  archive_inner_path       VARCHAR2(1000),
  file_path                VARCHAR2(1000),
  session_index            NUMBER,
  doc_file_name            VARCHAR2(500)
)
-- Add comments to the columns 
comment on column S_CHINA_PATENT_INVALID.id
  is '主键';
comment on column S_CHINA_PATENT_INVALID.cn_decision_number
  is '决定号';
comment on column S_CHINA_PATENT_INVALID.cn_decision_date
  is '决定日';
comment on column S_CHINA_PATENT_INVALID.application_country
  is '申请国别';
comment on column S_CHINA_PATENT_INVALID.application_number
  is '申请号';
comment on column S_CHINA_PATENT_INVALID.application_date
  is '申请日';
comment on column S_CHINA_PATENT_INVALID.assignees
  is '受让人';
comment on column S_CHINA_PATENT_INVALID.publication_country
  is '公开国别';
comment on column S_CHINA_PATENT_INVALID.publication_number
  is '公开号';
comment on column S_CHINA_PATENT_INVALID.publication_date
  is '公布日/公开日';
comment on column S_CHINA_PATENT_INVALID.invention_title
  is '发明创造名称';
comment on column S_CHINA_PATENT_INVALID.classification_ipc
  is '国际分类号';
comment on column S_CHINA_PATENT_INVALID.cn_appellant
  is '无效请求人';
comment on column S_CHINA_PATENT_INVALID.cn_examiners
  is '合议组成员（合议组组长、主审员、参审员）';
comment on column S_CHINA_PATENT_INVALID.publication_info_country
  is '公告国别';
comment on column S_CHINA_PATENT_INVALID.publication_info_number
  is '公告号';
comment on column S_CHINA_PATENT_INVALID.publication_info_date
  is '授权公告日/审定公告日';
comment on column S_CHINA_PATENT_INVALID.cn_pub_vol
  is '公告卷期';
comment on column S_CHINA_PATENT_INVALID.cn_law_reference
  is '法律依据';
comment on column S_CHINA_PATENT_INVALID.cn_main_point
  is '决定要点';
comment on column S_CHINA_PATENT_INVALID.abstract
  is '摘要';
comment on column S_CHINA_PATENT_INVALID.keyword
  is '关键词';
comment on column S_CHINA_PATENT_INVALID.cn_brief_history
  is '案由';
comment on column S_CHINA_PATENT_INVALID.cn_reasoning
  is '决定的理由';
comment on column S_CHINA_PATENT_INVALID.cn_holding
  is '决定';
comment on column S_CHINA_PATENT_INVALID.path_xml
  is 'xml文档路径';
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_CHINA_PATENT_INVALID
  add primary key (ID)




























alter table s_china_patent_invalid       add import_session_id NVARCHAR2(100);
alter table s_china_patent_invalid       add import_time DATE;
alter table s_china_patent_invalid       add archive_inner_path VARCHAR2(1000);
alter table s_china_patent_invalid       add file_path VARCHAR2(1000);
alter table s_china_patent_invalid       add session_index NUMBER;
alter table s_china_patent_invalid       add DOC_FILE_NAME VARCHAR2(500);





select * from s_china_patent_invalid;







variable current_scn number
exceute :current_scn := dbms_flashback.get_system_change_number();
print current_scn;



variable avarage_product_price number
update products
select
*
from
more_employees
order by employee_id
offset 5 rows fetch next 5 rows only







select
month, prd_type_id, amount
from
all_sales
where month in (1, 2, 3)
) g
;


select
*
from
(
select
month, prd_type_id, amount
from
all_sales
)
pivot
(sum(amount) for month in (1, 2, 3))
order by prd_type_id
;





where month in (1, 2, 3);







select
*
from
all_sales
pivot(sum(amount) for month in (1, 2, 3))
where year = 2003
and
prd_type_id in (1, 2, 3)
pivot(sum(amount) for month in (1, 2, 3))
;










select
*
from
all_sales
where prd_type_id between 1 and 2
and emp_id = 21
model
demension by 





select
 keep (dense_rank last order by sum(amount))
from
all_sales
where
year = 2003
group by month
order by month











select
listagg(name, ',') within over (partition by product_type_id order by price, name) as "Product List", max(price) as "Most Expensive"
from
products
where product_id <= 5;







select
s.amount, sum(s.amount) over (order by s.amount rows between unbounded preceding and current row)
from all_sales s
order by s.amount asc






select 
p.*, p.pa/p.ta
from
(
select 
s.month, s.prd_type_id, sum(s.amount) pa,
sum(sum(s.amount)) over (partition by s.month) ta,
ratio_to_report(sum(s.amount))  over (partition by s.month) rt
from all_sales s
where s.year = 2003
and s.month <= 3
group by s.month, s.prd_type_id
) p
order by p.month, p.prd_type_id











select 
*
from
(
select
s.month, s.amount, cume_dist() over (partition by s.month order by s.amount nulls last) as ps
from all_sales s
where
s.amount is not null
) p
where
p.ps < 0.1
order by p.month asc, p.amount asc







select
s.amount, percent_rank() over () 
from
from all_sales s








select 
s.prd_type_id, sum(s.amount), count(*), 
cume_dist() over (order by sum(s.amount) desc nulls last) as cume_dist,
percent_rank() over (order by sum(s.amount) desc nulls last) as percent_rank
from all_sales s
where year = 2003
group by s.prd_type_id
order by cume_dist;



select 
cume_dist() within  group (order by s.amount desc)
from
all_sales s
where s.amount is not null
order by s.amount desc;










select count(*)
from
all_sales







select 
case grouping(prd_type_id) when 1 then 'all products' else ''||prd_type_id end, 
case grouping(s.month) when 1 then 'all Month' else ''||month end,
s.month, 
sum(amount)
from all_sales s
where year = 2003
group by cube(prd_type_id, s.month)
having grouping_id(prd_type_id, s.month) > 0
order by prd_type_id, s.month;


select
case grouping(prd_type_id) when 1 then 'all products' else ''||prd_type_id end, 
case grouping(s.month) when 1 then 'all Month' else ''||month end,
s.month, 
sum(amount)
from all_sales s
where year = 2003
group by grouping sets(prd_type_id, s.month)
order by prd_type_id, s.month;







select prd_type_id, sum(amount)
from all_sales
where year = 2003
group by prd_type_id
order by prd_type_id;








select prd_type_id, sum(amount), rank() over (order by sum(amount) desc nulls last) as rank, grouping(prd_type_id) as isGroup
from all_sales
where year = 2003
group by grouping sets(prd_type_id)
order by prd_type_id;


select * from all_sales;



select rank() over (order by s.amount desc nulls last) as rank, s.* from all_sales s;


select s.prd_type_id, s.month, sum(s.amount), rank() over (partition by s.month order by sum(amount) desc) from all_sales s
where
s.year = 2003
and
amount is not null
group by s.prd_type_id, s.month
order by s.month, s.prd_type_id








select * from s_Index_File_Info s;
select * from s_index_file_detail i order by i.app_doc_number asc;











create index indexDetilFilePath on S_INDEX_FILE_DETAIL(index_file_path);
create index indexInfoFilePath on S_INDEX_FILE_INFO(file_path);













select salary,salary + '10' from hr.employees;
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';



select * from hr.employees e where e.hire_date = '17-06-2003';

select * from hr.employees e where e.hire_date = to_date('2003/6/17', 'yyyy/MM/dd');

select * from V$parameter p where p.NAME = 'nls_date_format';

select * from v$system_parameter p where p.NAME = 'nls_date_format';
v$system_parameter

show parameter nls_date_format;

select sysdate from dual;







create user donaldjohn identified by 123456;
drop user donadljohn;
grant dba,resource to donaldjohn;
connect donaldjohn/123456;

alter table demo1 add avatar long raw;


select sysdate from dual;

create table test1(c1 varchar2(100));

insert into test1 values('你好');

select * from test1;

select * from user_tables;


select sysdate + (10/(24*60)) from dual;

alter user scott account unlock;

alter user scott identified by tiger;

select t.hiredate, t.hiredate + 1 from scott.emp t;

select years_between(sysdate, t.hiredate) from scott.emp t;

select 1+1 from dual;

select * from oe.orders;

create table orders as select * from oe.orders;

select o.order_date, o.order_date + 30  "Due Date" from orders o;

select * from V$timezone_Names v where v.TZNAME like '%Beijing%';

select * from V$timezone_Names v ;

create table time_table
(
start_time timestamp,
duration_1 interval day (6) to second (5),
durantion_2 interval year to month
);

select 'abcd' || 'bdcde' from dual;


select 'abcd' + 'bdcde' from dual;

select 
(sysdate - e.hire_date) year to month as "year-month", 
extract(year from (sysdate - e.hire_date) year to month) as "year",
extract(month from (sysdate - e.hire_date) year to month) as "month",
(sysdate - e.hire_date) day (9) to second as "day-sec",
extract(hour from (sysdate - e.hire_date) day (9) to second) as "hour"
from hr.employees e;


select 
e.last_name as "Last_Name",
extract(year from (sysdate - e.hire_date) year to month) 
|| ' 年 '
|| extract(month from (sysdate - e.hire_date) year to month) 
|| ' 月 ' as "Interval"
from
hr.employees e;


select rawtohex('00010001') from dual;

select rawtohex(hextoraw('FF')) from dual;







































































