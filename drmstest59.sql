

select count(*) from s_index_file_info inf where inf.data_res = '中国标准化简单引文数据' and inf.batch is not null;
select count(*) from s_index_file_detail dtl where dtl.data_res = '中国标准化简单引文数据' and dtl.batch is null;










select dtl.rowid, dtl.* from s_data_resource_types_detail dtl where dtl.id in (231, 232, 233, 234);

update s_data_resource_types_detail dtl set dtl.haschecker = 'Y' where dtl.id in (231, 232, 233, 234);
commit;


select * from S_FRENCH_DESIGN_PATENT;

select * from S_GERMAN_DESIGN_PATENT;


ARTICLE_INFO_FUND  N  VARCHAR2(4000)  Y      基金

select distinct dtl.data_res from s_index_file_detail dtl;
select inf.* from S_INDEX_FILE_INFO inf where inf.data_res = '中外期刊的著录项目与文摘数据';
execute dbms_flashback.enable_at_time(sysdate - 1/2);

update s_data_resource_types_detail dtl set dtl.haschecker = 'Y'
where dtl.id in (132,133,134,136,137, 138, 139, 153, 162, 172, 180);
commit;

select listagg(dtl.id || ',') within group (order by dtl.id) from s_data_resource_types_detail dtl where dtl.haschecker = 'Y';

132,133,134,136,137,138,139,140,147,153,162,172,180,183,184,194,196,209.1,209.2,210
132,133,134,136,137,138,139,140,147,153,162,172,180,183,184,194,196,209.1,209.2,210,

3,13,132,133,134,136,137,209.1,209.2,
3,6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,229,


select * from S_INDEX_FILE_INFO inf where inf.data_res = '中国标准化简单引文数据';




create table S_NP_INDEX_FILE_INFO
(
  id                       VARCHAR2(100) not null,
  zip_file                 VARCHAR2(100),
  date_exchange            VARCHAR2(100),
  date_produced            VARCHAR2(100),
  pat_cnt                  VARCHAR2(100),
  file_cnt                 VARCHAR2(100),
  total_size               VARCHAR2(100),
  md5                      VARCHAR2(100),
  doc_status               VARCHAR2(100),
  
  data_res                 VARCHAR2(100),
  file_path                VARCHAR2(4000),
  import_time              TIMESTAMP(6),
  fully_imported           VARCHAR2(100),
  validate_data_success    VARCHAR2(100),
  self_check_successed     VARCHAR2(100),
  note                     VARCHAR2(4000),
  doclist_count            VARCHAR2(1000),
  pub_kind                 VARCHAR2(20),
  pub_type                 VARCHAR2(200),
  index_file_name          VARCHAR2(200),
  batch                    VARCHAR2(1000)
);

-- Create/Recreate indexes
create index NPINDEXINFOFILEPATH on S_NP_INDEX_FILE_INFO (FILE_PATH);
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_NP_INDEX_FILE_INFO
  add constraint NPINDEXINFOPRIMARYK primary key (ID);


alter table S_NP_INDEX_FILE_INFO rename column total_size to zip_size;



















select * from s_index_file_info where pub_type is null;

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



select listagg('"' || td.chinese_name || '".Equals(fileType) ||')  WITHIN GROUP (ORDER BY td.id) 
from 
s_data_resource_types_detail td 
where td.id in (132,133,134,136,137,138,139,148,153,162,168,169,170,172,180);


select listagg('"' || td.chinese_name || '".Equals(fileType) ||')  WITHIN GROUP (ORDER BY td.id) 
from 
s_data_resource_types_detail td 
where td.id in (13);












select * from s_china_brand;
select * from S_CHINA_STANDARD_SIMPCITATION s where s.ori_app_number = 'CN201310744084';




----校验 132 中国商标 START
select * from s_china_brand;
----目前数据是否有重的
select b.mark_cn_id from s_china_brand b group by b.mark_cn_id having count(1) > 1;




----校验 132 中国商标 END







----校验 013 中国专利标准化简单引文 相关 START

select * from S_CHINA_STANDARD_SIMPCITATION s;
select count(*) from S_CHINA_STANDARD_SIMPCITATION s;
----校验 013 中国专利标准化简单引文 相关 END










select 
dtl.id, dtl.chinese_name, dtl.table_name 
from 
s_data_resource_types_detail dtl where dtl.id 
in 
(3,6,50,51,52,53,54,55,83,90,103,104,105,106,107,108,213,214,
215,216,217,218,219,220,221,222,223,224,229,230,232,233,
132,133,134,136,137,138,139,148,153,162,168,169,170,172,180
) 
order by dtl.id;








select count(*) from S_JOURNAL_PROJECT_ABSTRACT;


alter table S_JOURNAL_PROJECT_ABSTRACT drop column article_info_fund;
alter table S_JOURNAL_PROJECT_ABSTRACT drop column article_info_fund;


select l.session_id,o.owner,o.object_name
from v$locked_object l,dba_objects o
where l.object_id=o.object_id and o.OBJECT_NAME = 'S_JOURNAL_PROJECT_ABSTRACT';



select t2.username,t2.sid,t2.serial#,t2.logon_time
from v$locked_object t1,v$session t2
where t1.session_id=t2.sid
and t1.SESSION_ID in (
select l.session_id
from v$locked_object l,dba_objects o
where l.object_id=o.object_id and o.OBJECT_NAME = 'S_JOURNAL_PROJECT_ABSTRACT'
)
order by t2.logon_time
;








alter system kill session '742,13413';

select s.article_info_fund from S_JOURNAL_PROJECT_ABSTRACT s where s.article_info_fund is not null;



select * from S_CHINA_PATENT_JUDGMENT order by import_time desc;


select * from S_CHINA_BRAND_LICENSE where file_path not like 'Z:\%';



delete from import_session s where s.data_res_type like '%无效%';
delete from import_session s where s.data_res_type like '%复审%';
commit;


select * from s_data_resource_types_detail;



select * from import_session s
where
exists
(
select 1 from s_china_patent_review r
where s.session_id = r.import_session_id
)




select * from s_china_patent_review r;




select * from import_session s where s.data_res_type = '%复审%';


select * from import_session s where s.tablename =  Upper('s_china_patent_review');


select distinct s.data_res_type from import_session s 


select * from s_china_patent_invalid;



bb8b666d-2a28-4c94-8143-6b933817ee50





select  from import_session;



\\192.168.3.75\di_data\ZipData\MARK_CN_ZIP_20160708\IPPHDB_MARK_CN_20160809_200603_003.zip
select * from import_session s where s.zip_or_dir_path = '\\192.168.3.75\di_data\ZipData\MARK_CN_ZIP_20160708\IPPHDB_MARK_CN_20160809_200603_003.zip';

select * from S_CHINA_BRAND_LICENSE l where l.file_path = '\\192.168.3.75\di_data\ZipData\MARK_CN_ZIP_20160708\IPPHDB_MARK_CN_20160809_200603_003.zip';

select * from s_data_resource_types_detail;


declare
cursor v_data_dtl_cursor is
       select 
        * 
        from 
        s_data_resource_types_detail a
        where not exists (select 1 from (select table_name from user_tab_columns where column_name = 'DOC_FILE_NAME') b where a.table_name = b.table_name)
        ;
v_tableName varchar2(1000);
v_sql varchar2(1000);
begin
  for v_dt_dtl in v_data_dtl_cursor loop
      v_tableName := v_dt_dtl.table_name;
      v_sql := 'alter table ' || v_tableName || ' add column doc_file_name varchar2(1000)';
      dbms_output.put_line('Executing SQL: ' || v_sql);
      execute immediate v_sql;
  end loop;
end;

alter table S_JAPAN_DESIGN_PATENT add doc_file_name varchar2(1000);



drop procedure deleteErrorSessons;

create procedure delete_Error_Sessons(
   p_data_Res_ID in integer
)
as
  v_tableName varchar2(1000),
  v_dataChineseName varchar(1000),
begin
   select d.chinese_name into v_dataChineseName, d.table_name into v_tableName
   from 
   s_data_resource_types_detail d 
   where d.id = p_data_Res_ID;
   execute immediate 'delete from import_session s where s.data_res_type = '''||v_dataChineseName||''' and not exists (select 1 from '||v_tableName||' doc where doc.import_session_id = s.session_id)';
   commit;
exceptions
   when others then
     rollback;
end delete_Error_Sessons;


call delete_Error_Sessons(133);


1	中国商标许可数据	S_CHINA_BRAND_LICENSE
select count(1) from import_session s where s.data_res_type = '中国商标许可数据' and not exists (select 1 from S_CHINA_BRAND_LICENSE doc where doc.import_session_id = s.session_id);




   select d.chinese_name,  d.table_name
   from 
   s_data_resource_types_detail d 
   where d.id = 133;


delete from import_session s where s.data_res_type = '中国商标' and not exists (select 1 from s_china_brand doc where doc.import_session_id = s.session_id);

select d.chinese_name  from s_data_resource_types_detail d where d.id = &dataResNum;





delete from import_session s where s.data_res_type = '中国商标' and not exists (select 1 from s_china_brand doc where doc.import_session_id = s.session_id);


select count(1) from import_session s where s.data_res_type = '中国商标';


(select session_id from import_session s where s.data_res_type = '中国商标' and not exists (select 1 from s_china_brand doc where doc.import_session_id = s.session_id))



select 
count(1)
from s_china_brand a,
(select session_id from import_session s where s.data_res_type = '中国商标' and exists (select 1 from s_china_brand doc where doc.import_session_id = s.session_id)) b
where
a.import_session_id = b.session_id





select count(1) from import_session s where UPPER(s.tablename) = Upper('s_china_brand') and not exists (select 1 from s_china_brand doc where doc.import_session_id = s.session_id);


select * from s_china_brand doc where doc.import_session_id = 'abfdaea1-a5ba-4742-84f9-61c83214c3d8';



select * from S_CHINA_BRAND;








select * from mv_checks_result_006;


select * from s_data_resource_types_detail drtd where drtd.id in (210, 211, 212);

alter table S_T_MEDICINE_TRANS_T1  modify id varchar2(100);
alter table S_T_MEDICINE_TRANS_T1 modify id VARCHAR2(100);
alter table S_T_MEDICINE_TRANS_T2 modify id VARCHAR2(100);
alter table S_T_PHARMACEUTICAL_T1 modify id VARCHAR2(100);
alter table S_T_PHARMACEUTICAL_T2 modify id VARCHAR2(100);
alter table S_T_PHARMACEUTICAL_T3 modify id VARCHAR2(100);
alter table S_T_MEDICINE_HANDLE_T1 modify id VARCHAR2(100);
alter table S_T_MEDICINE_HANDLE_T2 modify id VARCHAR2(100);
alter table S_T_MEDICINE_HANDLE_T3 modify id VARCHAR2(100);


alter table S_T_MEDICINE_HANDLE_T1 drop column t1_ti;
alter table S_T_MEDICINE_HANDLE_T1 drop column t1_pac;
alter table S_T_MEDICINE_HANDLE_T1 drop column t1_addr;
alter table S_T_MEDICINE_HANDLE_T1 drop column t1_ic1;
alter table S_T_MEDICINE_HANDLE_T1 drop column t1_phc;
alter table S_T_MEDICINE_HANDLE_T1 modify t1_ap VARCHAR2(200);
alter table S_T_MEDICINE_HANDLE_T1 modify t1_pn VARCHAR2(200);

alter table S_T_MEDICINE_HANDLE_T1 add column t1_ti clob;
alter table S_T_MEDICINE_HANDLE_T1 add column t1_pac clob;
alter table S_T_MEDICINE_HANDLE_T1 add column t1_addr clob;
alter table S_T_MEDICINE_HANDLE_T1 add column t1_ic1 clob;
alter table S_T_MEDICINE_HANDLE_T1 add column t1_phc clob;










     alter table S_T_MEDICINE_TRANS_T1       add import_session_id NVARCHAR2(100);
      alter table S_T_MEDICINE_TRANS_T1       add import_time DATE;
      alter table S_T_MEDICINE_TRANS_T1       add archive_inner_path VARCHAR2(1000);
      alter table S_T_MEDICINE_TRANS_T1       add file_path VARCHAR2(1000);
      alter table S_T_MEDICINE_TRANS_T1       add session_index NUMBER;
      alter table S_T_MEDICINE_TRANS_T1       add DOC_FILE_NAME VARCHAR2(500);


      alter table S_T_PHARMACEUTICAL_T1       add import_session_id NVARCHAR2(100);
      alter table S_T_PHARMACEUTICAL_T1       add import_time DATE;
      alter table S_T_PHARMACEUTICAL_T1       add archive_inner_path VARCHAR2(1000);
      alter table S_T_PHARMACEUTICAL_T1       add file_path VARCHAR2(1000);
      alter table S_T_PHARMACEUTICAL_T1       add session_index NUMBER;
      alter table S_T_PHARMACEUTICAL_T1       add DOC_FILE_NAME VARCHAR2(500);


      alter table S_T_MEDICINE_HANDLE_T1       add import_session_id NVARCHAR2(100);
      alter table S_T_MEDICINE_HANDLE_T1       add import_time DATE;
      alter table S_T_MEDICINE_HANDLE_T1       add archive_inner_path VARCHAR2(1000);
      alter table S_T_MEDICINE_HANDLE_T1       add file_path VARCHAR2(1000);
      alter table S_T_MEDICINE_HANDLE_T1       add session_index NUMBER;
      alter table S_T_MEDICINE_HANDLE_T1       add DOC_FILE_NAME VARCHAR2(500);
















select dtl.*, dtl.rowid from s_data_resource_types_detail dtl;

select * from s_china_patent_invalid;


alter table s_china_patent_invalid       add import_session_id NVARCHAR2(100);
alter table s_china_patent_invalid       add import_time DATE;
alter table s_china_patent_invalid       add archive_inner_path VARCHAR2(1000);
alter table s_china_patent_invalid       add file_path VARCHAR2(1000);
alter table s_china_patent_invalid       add session_index NUMBER;
alter table s_china_patent_invalid       add DOC_FILE_NAME VARCHAR2(500);












select 
substr(doc.file_path, instr(doc.file_path, '\', -1, 1) + 1), doc.doc_file_name
from 
S_China_Patent_Bibliographic doc
group by 
doc.doc_file_name, substr(doc.file_path, instr(doc.file_path, '\', -1, 1) + 1)
having count(1) > 1




select 
count(1)
from 
S_China_Patent_Bibliographic doc
where doc.doc_file_name is null




select 
doc.doc_file_name
from 
S_China_Patent_Bibliographic doc
group by 
doc.doc_file_name
having count(1) > 1















update s_data_resource_types_detail dtl set dtl.haschecker = 'Y'
where dtl.id in
(3, 6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,229,230);


select inf.pat_cnt, inf.doclist_count, inf.* from s_index_file_info inf where inf.fully_imported = 'N';


select dtl.haschecker from s_data_resource_types_detail dtl;




6,13,50,52,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,229,230

----生出错误数据处理语句块
select
'



----'||dtl.id||' '||dtl.chinese_name||'
declare
 v_count number;
begin
  select count(1) into v_count
  from user_tables ut
  where ut.TABLE_NAME = ''S_ERROR_DOC_BACKUP_'||case
  when length(to_char(dtl.id)) < 3
    then lpad(to_char(dtl.id), 3, '0')
      else replace(to_char(dtl.id), '.', '')
end||''';
  if v_count = 0
  then
    execute immediate ''create table S_ERROR_DOC_BACKUP_'||case
  when length(to_char(dtl.id)) < 3
    then lpad(to_char(dtl.id), 3, '0')
      else replace(to_char(dtl.id), '.', '')
end||' as select * from '||dtl.table_name||' where 56 <> length(doc_file_name) or ori_pub_date is null'';
  else
    execute immediate ''insert into S_ERROR_DOC_BACKUP_'||case
  when length(to_char(dtl.id)) < 3
    then lpad(to_char(dtl.id), 3, '0')
      else replace(to_char(dtl.id), '.', '')
end||' select * from '||dtl.table_name||' where 56 <> length(doc_file_name) or ori_pub_date is null'';
  end if;
  delete from '||dtl.table_name||' where 56 <> length(doc_file_name) or ori_pub_date is null;
  commit;
exception
  when others then
    rollback;
end'
from
s_data_resource_types_detail dtl
where 
dtl.id 
in 
(3, 6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,229,230);




select
'


----'||dtl.id||' '||dtl.chinese_name||'
drop table S_ERROR_DOC_BACKUP_'||case
  when length(to_char(dtl.id)) < 3
    then lpad(to_char(dtl.id), 3, '0')
      else replace(to_char(dtl.id), '.', '')
end||';
begin
execute immediate ''create S_ERROR_DOC_BACKUP_'||case
  when length(to_char(dtl.id)) < 3
    then lpad(to_char(dtl.id), 3, '0')
      else replace(to_char(dtl.id), '.', '')
end||' as select * from '||dtl.table_name||' where 56 <> length(doc_file_name) or ori_pub_date is null'';
delete from '||dtl.table_name||' where 56 <> length(doc_file_name) or ori_pub_date is null; 
commit;
exception
  when others
    rollback;
end;
'
from
s_data_resource_types_detail dtl
where 
dtl.id 
in 
(3, 6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,229,230);







with
 storage_path as
 (
select 1 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_TEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 2 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_TEXTIMAGE doc where rownum =1  and doc.file_path is not null
 union
select 3 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_STANDARDFULLTXT doc where rownum =1  and doc.file_path is not null
 union
select 4 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_STAND_TEXTIMAGE doc where rownum =1  and doc.file_path is not null
 union
select 5 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_GAZETTE doc where rownum =1  and doc.file_path is not null
 union
select 6 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_BIBLIOGRAPHIC doc where rownum =1  and doc.file_path is not null
 union
select 10 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_LAWSTATE doc where rownum =1  and doc.file_path is not null
 union
select 11 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_LAWSTATE_CHANGE doc where rownum =1  and doc.file_path is not null
 union
select 13 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_STANDARD_SIMPCITATION doc where rownum =1  and doc.file_path is not null
 union
select 14 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_PATENT_PAYMENT doc where rownum =1  and doc.file_path is not null
 union
select 50 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_AMERICAN_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 51 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_EUROPEAN_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 52 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_KOREAN_PATENT_FULLTEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 53 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_SWISS_PATENT_FULLTEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 54 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_BRITISH_PATENT_FULLTEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 55 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_JAPAN_PATENT_FULLTEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 103 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_BELGIAN_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 104 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_AUSTRIA_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 105 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_SPANISH_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 106 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_POLAND_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 107 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_ISRAEL_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 108 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_SINGAPORE_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 121 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_FULLTEXT_PDF doc where rownum =1  and doc.file_path is not null
 union
select 132 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_BRAND doc where rownum =1  and doc.file_path is not null
 union
select 133 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_BRAND_LICENSE doc where rownum =1  and doc.file_path is not null
 union
select 134 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_BRAND_TRANSFER doc where rownum =1  and doc.file_path is not null
 union
select 136 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_MADRID_BRAND_ENTER_CHINA doc where rownum =1  and doc.file_path is not null
 union
select 137 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_WELLKNOWN_BRAND doc where rownum =1  and doc.file_path is not null
 union
select 138 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_AMERICA_APPLY_BRAND doc where rownum =1  and doc.file_path is not null
 union
select 139 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_AMERICA_TRANSFER_BRAND doc where rownum =1  and doc.file_path is not null
 union
select 148 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_BOOK doc where rownum =1  and doc.file_path is not null
 union
select 153 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_JOURNAL_PROJECT_ABSTRACT doc where rownum =1  and doc.file_path is not null
 union
select 162 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_COURTCASE_PROCESS doc where rownum =1  and doc.file_path is not null
 union
select 168 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_BRAND_CLASSIFICATION doc where rownum =1  and doc.file_path is not null
 union
select 169 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_AMERICAN_BRAND_GRAPHCLASSIFY doc where rownum =1  and doc.file_path is not null
 union
select 170 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_AMERICAN_BRAND_USCLASSIFY doc where rownum =1  and doc.file_path is not null
 union
select 172 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_MADRID_BRAND_PURCHASE doc where rownum =1  and doc.file_path is not null
 union
select 180 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_LAWSPROCESS doc where rownum =1  and doc.file_path is not null
 union
select 186 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_FOREIGN_PATENT_SEQUENCE doc where rownum =1  and doc.file_path is not null
 union
select 194 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_REVIEW doc where rownum =1  and doc.file_path is not null
 union
select 196 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_JUDGMENT doc where rownum =1  and doc.file_path is not null
 union
select 209 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_BIOLOGICAL_PROCESS doc where rownum =1  and doc.file_path is not null
 union
select 209.1 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_T_BIOLOGICAL_CN doc where rownum =1  and doc.file_path is not null
 union
select 209.2 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_T_BIOLOGICAL_FY doc where rownum =1  and doc.file_path is not null
 union
select 210 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_MEDICINE_PATENT_TRANS doc where rownum =1  and doc.file_path is not null
 union
select 211 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PHARMACEUTICAL_PATENT doc where rownum =1  and doc.file_path is not null
 union
select 212 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_MEDICINE_PATENT_HANDLE doc where rownum =1  and doc.file_path is not null
 union
select 213 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CHINA_PATENT_ABSTRACTS doc where rownum =1  and doc.file_path is not null
 union
select 214 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_DOCDB doc where rownum =1  and doc.file_path is not null
 union
select 215 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_WIPO_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 216 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_CANADIAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 217 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_RUSSIAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 218 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_AUSTRALIAN_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 219 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_GERMAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 220 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_FRENCH_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 221 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_TAIWAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 222 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_HONGKONG_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 223 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_MACAO_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 224 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_EURASIAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 229 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_JAPAN_PATENT_ABSTRACTS doc where rownum =1  and doc.file_path is not null
 union
select 231 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_WORLD_PATENT_LAWSTATUS doc where rownum =1  and doc.file_path is not null
 union
select 232 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_STD_JP_CIT doc where rownum =1  and doc.file_path is not null
 union
select 233 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_STD_KR_CIT doc where rownum =1  and doc.file_path is not null
 union
select 234 as id,  substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) as file_path from S_STD_KR_PRS doc where rownum =1  and doc.file_path is not null)
select dtl.id, dtl.chinese_name, dtl.table_name, dtl.implemented_import_logic, dtl.haschecker, sp.file_path
from
s_data_resource_types_detail dtl
left join storage_path sp
on dtl.id = sp.id
order by dtl.id;







(3,6,50,51,52,53,54,55,83,90,103,104,105,106,107,108,213,214,
215,216,217,218,219,220,221,222,223,224,229,230,232,233,
132,133,134,136,137,138,139,148,153,162,168,169,170,172,180
) 
order by dtl.id












with
 storage_path as
 (
select 1 as id,  doc.file_path from S_CHINA_PATENT_TEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 2 as id,  doc.file_path from S_CHINA_PATENT_TEXTIMAGE doc where rownum =1  and doc.file_path is not null
 union
select 3 as id,  doc.file_path from S_CHINA_PATENT_STANDARDFULLTXT doc where rownum =1  and doc.file_path is not null
 union
select 4 as id,  doc.file_path from S_CHINA_PATENT_STAND_TEXTIMAGE doc where rownum =1  and doc.file_path is not null
 union
select 5 as id,  doc.file_path from S_CHINA_PATENT_GAZETTE doc where rownum =1  and doc.file_path is not null
 union
select 6 as id,  doc.file_path from S_CHINA_PATENT_BIBLIOGRAPHIC doc where rownum =1  and doc.file_path is not null
 union
select 10 as id,  doc.file_path from S_CHINA_PATENT_LAWSTATE doc where rownum =1  and doc.file_path is not null
 union
select 11 as id,  doc.file_path from S_CHINA_PATENT_LAWSTATE_CHANGE doc where rownum =1  and doc.file_path is not null
 union
select 13 as id,  doc.file_path from S_CHINA_STANDARD_SIMPCITATION doc where rownum =1  and doc.file_path is not null
 union
select 14 as id,  doc.file_path from S_PATENT_PAYMENT doc where rownum =1  and doc.file_path is not null
 union
select 50 as id,  doc.file_path from S_AMERICAN_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 51 as id,  doc.file_path from S_EUROPEAN_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 52 as id,  doc.file_path from S_KOREAN_PATENT_FULLTEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 53 as id,  doc.file_path from S_SWISS_PATENT_FULLTEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 54 as id,  doc.file_path from S_BRITISH_PATENT_FULLTEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 55 as id,  doc.file_path from S_JAPAN_PATENT_FULLTEXTCODE doc where rownum =1  and doc.file_path is not null
 union
select 103 as id,  doc.file_path from S_BELGIAN_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 104 as id,  doc.file_path from S_AUSTRIA_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 105 as id,  doc.file_path from S_SPANISH_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 106 as id,  doc.file_path from S_POLAND_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 107 as id,  doc.file_path from S_ISRAEL_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 108 as id,  doc.file_path from S_SINGAPORE_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 121 as id,  doc.file_path from S_CHINA_PATENT_FULLTEXT_PDF doc where rownum =1  and doc.file_path is not null
 union
select 132 as id,  doc.file_path from S_CHINA_BRAND doc where rownum =1  and doc.file_path is not null
 union
select 133 as id,  doc.file_path from S_CHINA_BRAND_LICENSE doc where rownum =1  and doc.file_path is not null
 union
select 134 as id,  doc.file_path from S_CHINA_BRAND_TRANSFER doc where rownum =1  and doc.file_path is not null
 union
select 136 as id,  doc.file_path from S_MADRID_BRAND_ENTER_CHINA doc where rownum =1  and doc.file_path is not null
 union
select 137 as id,  doc.file_path from S_CHINA_WELLKNOWN_BRAND doc where rownum =1  and doc.file_path is not null
 union
select 138 as id,  doc.file_path from S_AMERICA_APPLY_BRAND doc where rownum =1  and doc.file_path is not null
 union
select 139 as id,  doc.file_path from S_AMERICA_TRANSFER_BRAND doc where rownum =1  and doc.file_path is not null
 union
select 148 as id,  doc.file_path from S_CHINA_BOOK doc where rownum =1  and doc.file_path is not null
 union
select 153 as id,  doc.file_path from S_JOURNAL_PROJECT_ABSTRACT doc where rownum =1  and doc.file_path is not null
 union
select 162 as id,  doc.file_path from S_CHINA_COURTCASE_PROCESS doc where rownum =1  and doc.file_path is not null
 union
select 168 as id,  doc.file_path from S_CHINA_BRAND_CLASSIFICATION doc where rownum =1  and doc.file_path is not null
 union
select 169 as id,  doc.file_path from S_AMERICAN_BRAND_GRAPHCLASSIFY doc where rownum =1  and doc.file_path is not null
 union
select 170 as id,  doc.file_path from S_AMERICAN_BRAND_USCLASSIFY doc where rownum =1  and doc.file_path is not null
 union
select 172 as id,  doc.file_path from S_MADRID_BRAND_PURCHASE doc where rownum =1  and doc.file_path is not null
 union
select 180 as id,  doc.file_path from S_CHINA_PATENT_LAWSPROCESS doc where rownum =1  and doc.file_path is not null
 union
select 186 as id,  doc.file_path from S_FOREIGN_PATENT_SEQUENCE doc where rownum =1  and doc.file_path is not null
 union
select 194 as id,  doc.file_path from S_CHINA_PATENT_REVIEW doc where rownum =1  and doc.file_path is not null
 union
select 196 as id,  doc.file_path from S_CHINA_PATENT_JUDGMENT doc where rownum =1  and doc.file_path is not null
 union
select 209 as id,  doc.file_path from S_CHINA_BIOLOGICAL_PROCESS doc where rownum =1  and doc.file_path is not null
 union
select 209.1 as id,  doc.file_path from S_T_BIOLOGICAL_CN doc where rownum =1  and doc.file_path is not null
 union
select 209.2 as id,  doc.file_path from S_T_BIOLOGICAL_FY doc where rownum =1  and doc.file_path is not null
 union
select 210 as id,  doc.file_path from S_CHINA_MEDICINE_PATENT_TRANS doc where rownum =1  and doc.file_path is not null
 union
select 211 as id,  doc.file_path from S_CHINA_PHARMACEUTICAL_PATENT doc where rownum =1  and doc.file_path is not null
 union
select 212 as id,  doc.file_path from S_CHINA_MEDICINE_PATENT_HANDLE doc where rownum =1  and doc.file_path is not null
 union
select 213 as id,  doc.file_path from S_CHINA_PATENT_ABSTRACTS doc where rownum =1  and doc.file_path is not null
 union
select 214 as id,  doc.file_path from S_DOCDB doc where rownum =1  and doc.file_path is not null
 union
select 215 as id,  doc.file_path from S_WIPO_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 216 as id,  doc.file_path from S_CANADIAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 217 as id,  doc.file_path from S_RUSSIAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 218 as id,  doc.file_path from S_AUSTRALIAN_PATENT_FULLTEXT doc where rownum =1  and doc.file_path is not null
 union
select 219 as id,  doc.file_path from S_GERMAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 220 as id,  doc.file_path from S_FRENCH_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 221 as id,  doc.file_path from S_TAIWAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 222 as id,  doc.file_path from S_HONGKONG_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 223 as id,  doc.file_path from S_MACAO_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 224 as id,  doc.file_path from S_EURASIAN_PATENT_DESCRIPTION doc where rownum =1  and doc.file_path is not null
 union
select 229 as id,  doc.file_path from S_JAPAN_PATENT_ABSTRACTS doc where rownum =1  and doc.file_path is not null
 union
select 231 as id,  doc.file_path from S_WORLD_PATENT_LAWSTATUS doc where rownum =1  and doc.file_path is not null
 union
select 232 as id,  doc.file_path from S_STD_JP_CIT doc where rownum =1  and doc.file_path is not null
 union
select 233 as id,  doc.file_path from S_STD_KR_CIT doc where rownum =1  and doc.file_path is not null
 union
select 234 as id,  doc.file_path from S_STD_KR_PRS doc where rownum =1  and doc.file_path is not null)
select dtl.id, dtl.chinese_name, dtl.table_name, dtl.implemented_import_logic, dtl.haschecker, sp.file_path 
from 
s_data_resource_types_detail dtl 
left join storage_path sp
on dtl.id = sp.id
order by dtl.id;



















----生成数据位置查询语句
select
'select '||id||' as id,  doc.file_path from '||table_name||' doc where rownum =1  and doc.file_path is not null'||chr(10)||' union '
from
s_data_resource_types_detail
order by id;

select 3 as id, substr(doc.file_path, 1, instr(doc.file_path, '\', -1, 1) -1) from S_CHINA_PATENT_STANDARDFULLTXT doc where rownum =1 and doc.file_path is not null;

----输出统计信息
select id, chinese_name, table_name, implemented_import_logic, haschecker from s_data_resource_types_detail order by id;







----如果物化视图不存在，新建物化视图
declare cnt_exist number;
begin
  select count(1) into cnt_exist
  from user_mviews
  where mview_name = upper('MV_EXTRA_IDX_INFO_001');
  if cnt_exist = 0 then
  execute immediate 
  'create materialized view MV_EXTRA_IDX_INFO_001
  refresh force on demand
  as
  select
  id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
  from
  s_index_file_detail id
  where
  id.data_res = ''中国专利全文代码化数据''
  and
  56 = length(id.doc_file_name)
  and
  not exists
  (
  select 1 from S_CHINA_PATENT_TEXTCODE d
  where d.doc_file_name = id.doc_file_name
  )';
  end if;
end;

















'----**053**
----索引未匹配信息
call dbms_mview.refresh(MV_EXTRA_IDX_INFO_053'');
----多余数据信息
call dbms_mview.refresh(''MV_EXTRA_DOC_INFO_053'');
----刷新校验结果
call dbms_mview.refresh(''MV_CHECKS_RESULT_053'');'






-------生成视图更新语句
with result_subq as
(
select chr(10) || chr(10) || chr(10) || '
----'|| to_char(dtd.id) || ' ' ||  dtd.chinese_name ||' 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_'||case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
      else replace(to_char(dtd.id), '.', '')
end||'
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '''||dtd.chinese_Name||'''
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from '||upper(dtd.table_Name)||' d
where d.doc_file_name = id.doc_file_name
);

----'|| to_char(dtd.id) || ' ' || dtd.chinese_name ||' 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_'||case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
      else replace(to_char(dtd.id), '.', '')
end||'
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, ''yyyyMMdd'') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
'||upper(dtd.table_Name)||' sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);
' as SQL1,
'
----'|| to_char(dtd.id) || ' ' || dtd.chinese_name ||' 校验结果
create materialized view MV_CHECKS_RESULT_'||case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
      else replace(to_char(dtd.id), '.', '')
end||'
refresh force on demand
as
(
select
  stat.pub_date,
  stat.idx_pat_cnt,
  stat.doc_pat_cnt,
  nvl(ds_index.idx_dis_pnt_cnts, 0) idx_dis_pnt_cnts,
  case when ds_index.idx_dis_pnt_cnts <> 0 and stat.idx_pat_cnt <> ds_index.idx_dis_pnt_cnts then ''Y'' else ''N'' end as index_dup,
  nvl(ds_Doc.doc_ds_pat_cnt, 0) doc_ds_pat_cnt,
  case when  ds_Doc.doc_ds_pat_cnt <> 0 and stat.doc_pat_cnt <> ds_Doc.doc_ds_pat_cnt then ''Y'' else ''N'' end as Doc_dup,
  nvl(matched_Rec.matched_count, 0) matched_count,
  case when 0 <> ds_index.idx_dis_pnt_cnts and ds_index.idx_dis_pnt_cnts = ds_Doc.doc_ds_pat_cnt and ds_index.idx_dis_pnt_cnts = matched_Rec.matched_count then ''Y'' else ''N'' end as check_passed
from
(
  select
  nvl(idx.pub_date, dt.pub_date) as pub_date,
  nvl(idx.pat_cnt_Index, 0) as idx_pat_cnt,
  nvl(dt.pat_cnt_Doc, 0) as doc_pat_cnt
  from
  (
          --索引入库符合要求
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '''||dtd.chinese_Name||'''
          and
          s.fully_imported = ''Y''
          group by s.date_publication
          having count(*) = count(case when s.fully_imported = ''Y'' and s.self_check_successed = ''Y'' then 1 else null end)
  ) idx
  full join
  (
          select
          to_char(d.ori_pub_date, ''yyyyMMdd'') as pub_date,
          count(*)   as pat_cnt_Doc
          from
          '||upper(dtd.table_Name)||' d
          where
          56 = length(d.doc_file_name)
          and
          d.ori_pub_date is not null
          group by d.ori_pub_date
  ) dt
  on idx.pub_date = dt.pub_date
) stat
left join
(
  select
     pub_date, count(1) idx_dis_pnt_cnts
  from
  (select
    id.pub_date, id.doc_file_name
    from
    s_index_file_detail id
    where
    id.data_res='''||dtd.chinese_Name||'''
    group by id.pub_date, id.doc_file_name
    having count(1) = 1
  )
  group by pub_date
) ds_index
on
stat.pub_date = ds_index.pub_date
left join
(
  select
  pub_date, count(1) doc_ds_pat_cnt
  from
  (
  select
  to_char(s.ori_pub_date, ''yyyyMMdd'') pub_date,
  s.doc_file_name
  from
  '||upper(dtd.table_Name)||' s
  group by s.ori_pub_date, s.doc_file_name
  having count(1) = 1
  )
  group by pub_date
) ds_Doc
on
stat.pub_date = ds_Doc.pub_date
left join
(
      select
      d.pub_date, count(1) as matched_count
      from
      s_index_file_detail d
      where d.data_res='''||dtd.chinese_Name||'''
      and
      exists
      (
        select
        1
        from
        '||upper(dtd.table_Name)||' s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);'
as sql2,
(rownum - 1) * 2 as num1,
(rownum -1) *2 + 1 as num2,
dtd.id as id
from s_data_resource_types_detail dtd
order by dtd.id
)
select sql1 as sql, num1 as num from result_subq
union 
select sql2 as sql, num2 as num from result_subq
order by num;



-----生成刷新视图语句
select
dtd.id as id, dtd.chinese_name, chr(10) || chr(10) || chr(10) || '----**'||dtd.id||'   '||dtd.chinese_name||'**
call dbms_mview.refresh(''MV_IDX_INFO_STAT_BY_PUBDATE'');
----索引未匹配信息
call dbms_mview.refresh(''MV_EXTRA_IDX_INFO_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end
||''');
----多余数据信息
call dbms_mview.refresh(''MV_EXTRA_DOC_INFO_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end
||''');
----刷新校验结果
call dbms_mview.refresh(''MV_CHECKS_RESULT_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end
||''');'
from s_data_resource_types_detail dtd
order by dtd.id













select 
case 
  when length(to_char(dtd.id)) < 3 
    then lpad(to_char(dtd.id), 3, '0') 
      else replace(to_char(dtd.id), '.', '') 
end as Formatted_Name, 
to_char(dtd.id, '000') 
from s_data_resource_types_detail dtd;


select count(1) from user_mviews where mview_name = upper('');





欧专局专利全文文本数据（标准化）
      select
      count(1)
      from
      s_index_file_detail d
      where d.data_res='瑞士专利全文代码化数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_SWISS_PATENT_FULLTEXTCODE s
        where s.doc_file_name = d.doc_file_name
      )



select * from S_SWISS_PATENT_FULLTEXTCODE;

      select
      *
      from
      s_index_file_detail d
      where d.data_res='欧专局专利全文文本数据（标准化）';

update s_index_file_detail id set id.doc_file_name = substr(id.doc_file, instr(id.doc_file, '\', -1, 1) + 1)
where id.data_res in ('瑞士专利全文代码化数据（标准化）', '欧专局专利全文文本数据（标准化）')
parallel 5
;


update s_index_file_detail id set id.doc_file_name = substr(id.doc_file, instr(id.doc_file, '\', -1, 1) + 1)
where id.data_res = '瑞士专利全文代码化数据（标准化）';

update s_index_file_detail id set id.doc_file_name = substr(id.doc_file, instr(id.doc_file, '\', -1, 1) + 1)
where id.data_res = '欧专局专利全文文本数据（标准化）';
commit;

select * from 




select 
id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '欧专局专利全文文本数据（标准化）'


update s_index_file_detail id set id.doc_file_name = substr(id.doc_file, instr(id.doc_file, '\', -1, 1) + 1)
where id.data_res in ('瑞士专利全文代码化数据（标准化）', '欧专局专利全文文本数据（标准化）')
parallel 5



select * from S_CHINA_PATENT_STANDARDFULLTXT;




      select
      d.pub_date, count(1) as matched_count
      from
      s_index_file_detail d
      where d.data_res='瑞士专利全文代码化数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_SWISS_PATENT_FULLTEXTCODE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
      
      
      
      
select count(*) from  S_SWISS_PATENT_FULLTEXTCODE;



select info.fully_imported, count(1) from s_index_file_info info where info.data_res = '欧专局专利全文文本数据（标准化）'



select info.fully_imported, count(1) from s_index_file_info info where info.data_res = '瑞士专利全文代码化数据（标准化）' group by info.fully_imported;



select * from 




dbms_mview.refresh('MV_IDX_INFO_STAT_BY_PUBDATE');






select 3 as id, 'S_CHINA_PATENT_STANDARDFULLTXT' as tableName, '中国专利标准化全文文本数据' as cn_Name, file_path  from S_CHINA_PATENT_STANDARDFULLTXT where rownum =1 
 union all 
select 51 as id, 'S_EUROPEAN_PATENT_FULLTEXT' as tableName, '欧专局专利全文文本数据（标准化）' as cn_Name, file_path  from S_EUROPEAN_PATENT_FULLTEXT where rownum =1 
 union all 
select 52 as id, 'S_KOREAN_PATENT_FULLTEXTCODE' as tableName, '韩国专利全文代码化数据（标准化）' as cn_Name, file_path  from S_KOREAN_PATENT_FULLTEXTCODE where rownum =1 
 union all 
select 53 as id, 'S_SWISS_PATENT_FULLTEXTCODE' as tableName, '瑞士专利全文代码化数据（标准化）' as cn_Name, file_path  from S_SWISS_PATENT_FULLTEXTCODE where rownum =1 
 union all 
select 54 as id, 'S_BRITISH_PATENT_FULLTEXTCODE' as tableName, '英国专利全文代码化数据（标准化）' as cn_Name, file_path  from S_BRITISH_PATENT_FULLTEXTCODE where rownum =1 
 union all 
select 55 as id, 'S_JAPAN_PATENT_FULLTEXTCODE' as tableName, '日本专利全文代码化数据（标准化）' as cn_Name, file_path  from S_JAPAN_PATENT_FULLTEXTCODE where rownum =1 


          select
          *
          from
          s_index_file_info s
          where
          s.data_res = '瑞士专利全文代码化数据（标准化）'


          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index,
          count(*),
          count(case when s.fully_imported = 'Y' and s.self_check_successed = 'Y' then 1 else null end)
          from
          s_index_file_info s
          where
          s.data_res = '瑞士专利全文代码化数据（标准化）'
          and
          s.fully_imported = 'Y'
          group by s.date_publication
          having count(*) = count(case when s.fully_imported = 'Y' and s.self_check_successed = 'Y' then 1 else null end)



update s_index_file_info set self_check_successed = 'Y';






3,6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,229,230,237,239




select
listagg(o.sqlExpr,CHR(10) ||  ' union all ' || CHR(10)) within group(order by o.id)
from
(
select 
d.id,
'select '|| d.id ||' as id, '''|| d.table_name ||''' as tableName, '''|| d.chinese_name ||''' as cn_Name, file_path  from ' || d.table_name || ' where rownum =1 ' as sqlExpr
from 
s_data_resource_types_detail d 
where 
d.id in (3,51,52,53,54,55)
and
'Y' = d.implemented_import_logic
) o
;








----
select 
d.id,
'select file_path from ' || d.table_name || ' where rownum =1 ----' || d.id || '  ' || d.table_name
from 
s_data_resource_types_detail d 
where 
d.id in (3,6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,229,230,237,239)
and
'Y' = d.implemented_import_logic
order by d.id
;








select doc.file_path from S_CHINA_P_BIBLIOGRAPHIC doc where rownum =1




declare
 v_result nvarchar(1000);
begin
  for v_temp in (3,6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,229,230,237,239) loop
    v_result := v_result || v_temp || ', '
  end loop;
  dbms_output.put_line(v_result);
end;

execute dbms_flashback.enable_at_time(sysdate - 20/(24 * 60));

update 
s_data_resource_types_detail d
set d.haschecker = 'Y'
where
d.id in (3,6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,229,230,237,239)
;
commit;


update 
s_data_resource_types_detail d
set d = 'Y'
where
d.id in (132,136,138,139,140,147,162,172,180,183,184,194,196,209.1,209.2,210)
;
commit;


132,136,138,139,140,147,162,172,180,183,184,194,196,209.1,209.2,210





select d.*, rowid from s_data_resource_types_detail d;





select 
a.pub_date,a.pub_kind,a.doc_file,a.index_file_path,a.doc_file_name 
from
(select
ido.pub_date, ido.pub_kind, ido.doc_file, ido.index_file_path, ido.doc_file_name 
from 
s_index_file_detail ido
where 
ido.data_res = '中国专利标准化全文文本数据'
and
ido.date_publication = '19991222') a
left join
(
select 
doc.doc_file_name
from 
S_CHINA_PATENT_STANDARDFULLTXT doc
where
'19991222' = to_char(doc.ori_pub_date, 'yyyyMMdd')
and
doc.doc_file_name is not null
) b
on
a.doc_file_name = b.doc_file_name
where b.doc_file_name is null;






select 
b.id, b.file_path, b.archive_inner_path, b.doc_file_name
from
(select
ido.doc_file_name 
from 
s_index_file_detail ido
where 
ido.data_res = '中国专利标准化全文文本数据'
and
ido.date_publication = '19991222') a
right join
(
select
doc.id, doc.file_path, doc.archive_inner_path, doc.doc_file_name
from 
S_CHINA_PATENT_STANDARDFULLTXT doc
where
'19991222' = to_char(doc.ori_pub_date, 'yyyyMMdd')
) b
on
a.doc_file_name = b.doc_file_name
where a.doc_file_name is null;



































and
on
ido.doc_file_name = dup_doc_file_names.doc_file_name
























select 
ido.pub_date, ido.pub_kind, ido.doc_file, ido.index_file_path, ido.doc_file_name 
from 
s_index_file_detail ido join (select 
    id.doc_file_name 
    from s_index_file_detail id 
    where
    id.data_res = '中国专利标准化全文文本数据'
    and
    id.date_publication = '20130424'
    group by id.doc_file_name 
    having count(1) > 1) dup_doc_file_names
on 
ido.doc_file_name = dup_doc_file_names.doc_file_name



create index i_doc_file_name_003 on S_CHINA_PATENT_STANDARDFULLTXT(doc_file_name);
create index i_pd_003 on S_CHINA_PATENT_STANDARDFULLTXT(ori_pub_date);
20110216

select osta.id, osta.file_path, osta.archive_inner_path, osta.doc_file_name
from
S_CHINA_PATENT_STANDARDFULLTXT osta join
(
select 
doc_file_name
from 
S_CHINA_PATENT_STANDARDFULLTXT sta
where
sta.ori_pub_date = to_date('20110216', 'yyyyMMdd')
group by sta.doc_file_name
having count(1) > 1
) b
on
osta.doc_file_name = b.doc_file_name



select * from mv_extra_doc_info_003;

















select s.*, rowid from s_data_resource_types_detail s;
select * from mv_idx_info_stat_by_pubDate;

exec DBMS_MVIEW.REFRESH('mv_idx_info_stat_by_pubDate');

exec dbms_mview.refresh('mv_idx_info_stat_by_pubDate');

select data_res, date_publication, totalIndexCount, successedIndex, failedIndex from mv_idx_info_stat_by_pubDate 
where data_res = '中国专利标准化全文文本数据';

create index idx_dt_doc_name on s_index_file_detail(doc_file_name);
create index dt_doc_name_003 on S_CHINA_PATENT_STANDARDFULLTXT(doc_file_name);



----通用查询逻辑 Start




----通用查询逻辑 End
-------查询索引指定批次的记录
select id.*, count(1) over (partition by id.doc_file_name) as dup_Count from s_index_file_detail id
where dup_count > 1;


create index idx_idx_dt_pd on s_index_file_detail(date_publication);
create bitmap index i_idx_dt_data_res on s_index_file_detail(data_res);


define v_data_res = '中国专利标准化全文文本数据';

----统计指定类型的， 指定指定公布日的 重复索引信息
select
  2  *
  3  from
  4  s_index_file_detail ido
  5  where
  6  exists
  7  (
  8    select 1
  9    from
 10    (
 11    select
 12    id.doc_file_name
 13    from s_index_file_detail id
 14    where
 15    id.data_res = '&v_data_res'
 16    and
 17    id.pub_date = '&v_pub_date'
 18    group by id.doc_file_name
 19    having count(1) > 1
 20    ) dup_odc
 21    where
 22    dup_odc.doc_file_name = ido.doc_file_name
 23  )
 24  ;










create global temporary table dup_doc_file_names on commit delete rows
as
    select 
    id.doc_file_name 
    from s_index_file_detail id 
    where
    id.data_res = '&v_data_res'
    and
    id.date_publication = '&v_date_publication'
    group by id.doc_file_name 
    having count(1) > 1;
    
    
select 
ido.pub_date, ido.pub_kind, ido.doc_file, ido.index_file_path, ido.doc_file_name 
from 
s_index_file_detail ido join (select 
    id.doc_file_name 
    from s_index_file_detail id 
    where
    id.data_res = '中国专利标准化全文文本数据'
    and
    id.date_publication = '&v_date_publication'
    group by id.doc_file_name 
    having count(1) > 1) dup_doc_file_names 
ido.doc_file_name = dup_doc_file_names.doc_file_name




exists
(
  select 1
  from 
  dup_doc_file_names
  where
  dup_odc.doc_file_name = ido.doc_file_name
)






  select 
  id.doc_file_name 
  from s_index_file_detail id 
  where
  id.data_res = '中国专利标准化全文文本数据' 
  group by id.doc_file_name 
  having count(1) > 1













----物化视图
--统计多余索引信息
drop materialized view mv_extra_idx_info_003;

create materialized view mv_extra_idx_info_003
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利标准化全文文本数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_STANDARDFULLTXT d
where d.doc_file_name = id.doc_file_name
)
order by id.pub_date, id.doc_file




/***
create materialized view mv_extra_idx_info_003
as
select id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name, rownum as rownb 
from 
s_index_file_detail id
where
doc_file_name = any(
select doc_file_name
from
(
(
select
distinct d.doc_file_name
from
s_index_file_detail d
where
d.data_res = '中国专利标准化全文文本数据'
and
56 = length(d.doc_file_name)
)
minus
(
select distinct s.doc_file_name from S_CHINA_PATENT_STANDARDFULLTXT s
where 
56 = length(s.doc_file_name)
and
s.ori_pub_number is not null
)
)
)
order by id.pub_date, id.doc_file
***/

select * from mv_extra_idx_info_003 order by rownum;

create index exindexrownb003 on mv_extra_idx_info_003(rownb);


--获取003多余数据信息
drop materialized view mv_check_result_003;

create materialized view mv_check_result_003
as
select
stat.pub_date,
stat.idx_pat_cnt,
stat.doc_pat_cnt,
nvl(ds_index.idx_dis_pnt_cnts, 0) idx_dis_pnt_cnts,
nvl(ds_Doc.doc_ds_pat_cnt, 0) doc_ds_pat_cnt,
nvl(matched_Rec.matched_count, 0) matched_count
from
( 
select
nvl(idx.pub_date, dt.pub_date) as pub_date, 
nvl(idx.pat_cnt_Index, 0) as idx_pat_cnt,
nvl(dt.pat_cnt_Doc, 0) as doc_pat_cnt
from
(
        --符合条件的索引信息
        select
        s.date_publication as pub_date,
        sum(s.doclist_count) as pat_cnt_Index
        from 
        s_index_file_info s
        where
        s.data_res = '中国专利标准化全文文本数据'
        and
        s.fully_imported = 'Y'
        group by s.date_publication
        having count(*) = count(case when s.fully_imported = 'Y' and s.self_check_successed = 'Y' then 1 else null end)
) idx
full join
(
        select
        to_char(d.ori_pub_date, 'yyyyMMdd') as pub_date,
        count(*)   as pat_cnt_Doc
        from
        S_CHINA_PATENT_STANDARDFULLTXT d
        where
        56 = length(d.doc_file_name)
        and
        d.ori_pub_date is not null
        group by d.ori_pub_date
) dt
on idx.pub_date = dt.pub_date
) stat
left join
(
  select
     pub_date, count(1) idx_dis_pnt_cnts
  from
  (select
    id.pub_date, id.doc_file_name
    from
    s_index_file_detail id
    where 
    id.data_res='中国专利标准化全文文本数据'
    group by id.pub_date, id.doc_file_name
    having count(1) = 1    
  )
  group by pub_date
) ds_index
on
stat.pub_date = ds_index.pub_date
left join
(
select 
pub_date, count(1) doc_ds_pat_cnt
from
(
select
to_char(s.ori_pub_date, 'yyyyMMdd') pub_date,
s.doc_file_name
from
S_CHINA_PATENT_STANDARDFULLTXT s
group by s.ori_pub_date, s.doc_file_name
having count(1) = 1
)
group by pub_date
) ds_Doc
on 
stat.pub_date = ds_Doc.pub_date
left join
(
      select
      d.pub_date, count(1) as matched_count 
      from
      s_index_file_detail d
      where d.data_res='中国专利标准化全文文本数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_STANDARDFULLTXT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
;







drop view v_check_result_003;
drop materialized view mv_extra_doc_info_003;


---003多余数据
create materialized view mv_extra_doc_info_003
as
select 
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from 
S_CHINA_PATENT_STANDARDFULLTXT sta
where
not exists
(
select 1
from
s_index_file_detail id
where 

sta.doc_file_name = id.doc_file_name
)
order by sta.ori_pub_date, doc_file_name







select 
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from 
S_CHINA_PATENT_STANDARDFULLTXT sta, 
(
      select s.doc_file_name from S_CHINA_PATENT_STANDARDFULLTXT s
      where 
      56 = length(s.doc_file_name)
      and
      s.ori_pub_number is not null
      group by s.doc_file_name
      minus      
      select
      d.doc_file_name
      from
      s_index_file_detail d
      where
      d.data_res = '中国专利标准化全文文本数据'
      and
      56 = length(d.doc_file_name)
      group by d.doc_file_name
) docList
where
sta.doc_file_name = docList.doc_file_name
order by sta.ori_pub_date, doc_file_name


select 
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from 
S_CHINA_PATENT_STANDARDFULLTXT sta, (select id.doc_file_name
from
s_index_file_detail id
where 
id.data_res = '中国专利标准化全文文本数据') doclst
where
id.doc_file <> any (doclst.doc_file_name)
)



select 
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from 
S_CHINA_PATENT_STANDARDFULLTXT sta
where
not exists
(
select 1
from
s_index_file_detail id
where 
id.data_res = '中国专利标准化全文文本数据'
and
sta.doc_file_name = id.doc_file_name
)






sta.doc_file_name = docList.doc_file_name
order by sta.ori_pub_date, doc_file_name






      select s.doc_file_name 
      from 
      S_CHINA_PATENT_STANDARDFULLTXT s, 
      where 
      56 = length(s.doc_file_name)
      and
      s.ori_pub_number is not null
      group by s.doc_file_name     
      
      
      select
      d.doc_file_name
      from
      s_index_file_detail d
      where
      d.data_res = '中国专利标准化全文文本数据'
      and
      56 = length(d.doc_file_name)
      group by d.doc_file_name
















create materialized view mv_extra_doc_info_003
as
select 
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from 
S_CHINA_PATENT_STANDARDFULLTXT sta
where
sta.doc_file_name = any(
select doc_file_name
from
(
(
select distinct s.doc_file_name from S_CHINA_PATENT_STANDARDFULLTXT s
where 
56 = length(s.doc_file_name)
and
s.ori_pub_number is not null
)
minus
(
select
distinct d.doc_file_name
from
s_index_file_detail d
where
d.data_res = '中国专利标准化全文文本数据'
and
56 = length(d.doc_file_name)
)
)
)
order by sta.ori_pub_date, doc_file_name










--比对数据003
-----查询比对结果
select 
pub_date,
idx_pat_cnt,
doc_pat_cnt,
idx_dis_pnt_cnts,
index_dup,
doc_ds_pat_cnt,
Doc_dup,
matched_count,
check_passed,
case
  when 0 <> matched_count and matched_count = idx_dis_pnt_cnts and matched_count <> doc_ds_pat_cnt
    then '匹配失败，数据表有冗余，可能是因为索引信息不完整'
  when 0 <> matched_count and matched_count = doc_ds_pat_cnt and matched_count <> idx_dis_pnt_cnts
    then '匹配失败，索引表有冗余，可能是数据入库缺包'
  when 'Y' = check_passed and 'Y' = index_dup
    then '校验成功，但是索引有重复记录'
  when 'Y' = check_passed and 'Y' = Doc_dup
    then '校验成功，但是数据表有重复记录' 
  when 'Y' = check_passed and 'N' = Doc_dup and 'N' = index_dup
    then '校验成功'    
  when 'N'= check_passed
    then '匹配失败'              
  else ''
end as note
from 
mv_checks_result_003 
order by pub_date;



drop materialized view mv_checks_result_003;

create materialized view mv_checks_result_003
as
(
select
  stat.pub_date,
  stat.idx_pat_cnt,
  stat.doc_pat_cnt,
  nvl(ds_index.idx_dis_pnt_cnts, 0) idx_dis_pnt_cnts,
  case when 0 <> ds_index.idx_dis_pnt_cnts and stat.idx_pat_cnt = ds_index.idx_dis_pnt_cnts then 'N' else 'Y' end as index_dup,
  nvl(ds_Doc.doc_ds_pat_cnt, 0) doc_ds_pat_cnt,
  case when 0 <> ds_Doc.doc_ds_pat_cnt and stat.doc_pat_cnt = ds_Doc.doc_ds_pat_cnt then 'N' else 'Y' end as Doc_dup,  
  nvl(matched_Rec.matched_count, 0) matched_count,
  case when 0 <> ds_index.idx_dis_pnt_cnts and ds_index.idx_dis_pnt_cnts = ds_Doc.doc_ds_pat_cnt and ds_index.idx_dis_pnt_cnts = matched_Rec.matched_count then 'Y' else 'N' end as check_passed
from
( 
  select
  nvl(idx.pub_date, dt.pub_date) as pub_date, 
  nvl(idx.pat_cnt_Index, 0) as idx_pat_cnt,
  nvl(dt.pat_cnt_Doc, 0) as doc_pat_cnt
  from
  (
          --符合条件的索引信息
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from 
          s_index_file_info s
          where
          s.data_res = '中国专利标准化全文文本数据'
          and
          s.fully_imported = 'Y'
          group by s.date_publication
          having count(*) = count(case when s.fully_imported = 'Y' and s.self_check_successed = 'Y' then 1 else null end)
  ) idx
  full join
  (
          select
          to_char(d.ori_pub_date, 'yyyyMMdd') as pub_date,
          count(*)   as pat_cnt_Doc
          from
          S_CHINA_PATENT_STANDARDFULLTXT d
          where
          56 = length(d.doc_file_name)
          and
          d.ori_pub_date is not null
          group by d.ori_pub_date
  ) dt
  on idx.pub_date = dt.pub_date
) stat
left join
(
  select
     pub_date, count(1) idx_dis_pnt_cnts
  from
  (select
    id.pub_date, id.doc_file_name
    from
    s_index_file_detail id
    where 
    id.data_res='中国专利标准化全文文本数据'
    group by id.pub_date, id.doc_file_name
    having count(1) = 1    
  )
  group by pub_date
) ds_index
on
stat.pub_date = ds_index.pub_date
left join
(
  select 
  pub_date, count(1) doc_ds_pat_cnt
  from
  (
  select
  to_char(s.ori_pub_date, 'yyyyMMdd') pub_date,
  s.doc_file_name
  from
  S_CHINA_PATENT_STANDARDFULLTXT s
  group by s.ori_pub_date, s.doc_file_name
  having count(1) = 1
  )
  group by pub_date
) ds_Doc
on 
stat.pub_date = ds_Doc.pub_date
left join
(
      select
      d.pub_date, count(1) as matched_count 
      from
      s_index_file_detail d
      where d.data_res='中国专利标准化全文文本数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_STANDARDFULLTXT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
)
;








/**
create view v_check_result_003
as
select 
nvl(idx.pub_date, dt.pub_date) as pub_date, 
nvl(idx.pat_cnt_Index, 0) as idx_pat_cnt,
nvl(idx.ds_idx_pat_cnt, 0) as idx_ds_pat_cnt,
nvl(idx.ex_idx_pat_cnt, 0) as ex_idx_pat_cnt,
nvl(dt.pat_cnt_Doc, 0) as doc_pat_cnt,
nvl(dt.ds_doc_pnt_cnt, 0) as doc_ds_pnt_cnt,
nvl(dt.ex_doc_pnt_count, 0) as doc_ex_pnt_count
from
(
        --符合条件的索引信息
        select
        s.date_publication as pub_date, 
        sum(s.doclist_count) as pat_cnt_Index,
        (
          select 
          count(distinct id.doc_file_name) 
          from 
          s_index_file_detail id 
          where
          id.data_res = '中国专利标准化全文文本数据'
          and
          id.date_publication = s.date_publication
          ) as ds_idx_pat_cnt, --统计doc_file_name数量
        (
          select 
          count(distinct id.doc_file_name) 
          from 
          s_index_file_detail id 
          where
          id.data_res = '中国专利标准化全文文本数据'
          and
          id.date_publication = s.date_publication
          and
          not exists (select 1 from S_CHINA_PATENT_STANDARDFULLTXT sta where sta.doc_file_name = id.doc_file_name)
          ) as ex_idx_pat_cnt --统计doc_file_name数量
        from 
        s_index_file_info s
        where
        s.data_res = '中国专利标准化全文文本数据'
        group by s.date_publication
        having count(*) = count(case when s.fully_imported = 'Y' and s.self_check_successed = 'Y' then 1 else null end)
) idx
full join
(
        select 
        to_char(d.ori_pub_date, 'yyyyMMdd') as pub_date,
        count(*)   as pat_cnt_Doc,
        count(distinct d.doc_file_name) as ds_doc_pnt_cnt,
        (
          select count(distinct sta.doc_file_name) 
          from 
          S_CHINA_PATENT_STANDARDFULLTXT sta
          where
          sta.ori_pub_date = d.ori_pub_date
          and not exists
          (
          select 1 from s_index_file_detail iid
          where 
          iid.doc_file_name = sta.doc_file_name)
        ) as ex_doc_pnt_count
        from 
        S_CHINA_PATENT_STANDARDFULLTXT d
        where
        56 = length(d.doc_file_name)
        and
        d.ori_pub_date is not null
        group by d.ori_pub_date
) dt
on idx.pub_date = dt.pub_date
**/






select * from mv_check_result_003 order by pub_date;


create table S_CHINA_PATENT_STDFULLTXT_RM as
select * from S_CHINA_PATENT_STANDARDFULLTXT
where 56 <> length(doc_file_name) or ori_pub_date is null;
delete from S_CHINA_PATENT_STANDARDFULLTXT where 56 <> length(doc_file_name) or ori_pub_date is null;
commit;


select * from S_CHINA_PATENT_STANDARDFULLTXT
where 56 <> length(doc_file_name) or ori_pub_date is null;

select count(*) from S_CHINA_PATENT_STDFULLTXT_RM where ori_pub_date is not null;




select 
a.ori_pub_date, a.doc_file_name 
from 
S_CHINA_PATENT_STANDARDFULLTXT a
where a.ori_pub
group by a.ori_pub_date, a.doc_file_name
having count(1) > 1;





create materialized view mv_check_result_003
as
select 
pub_date, 
idx_pat_cnt,
idx_ds_pat_cnt,
ex_idx_pat_cnt,
doc_pat_cnt,
doc_ds_pnt_cnt,
doc_ex_pnt_count
from v_check_result_003;
---End 比对数据003















select
s.date_publication as pub_date, 
sum(s.doclist_count) as pat_cnt_Index,
(
  select 
  count(distinct id.doc_file_name) 
  from 
  s_index_file_detail id 
  where
  id.data_res = '中国专利标准化全文文本数据'
  and
  id.date_publication = s.date_publication
  ) as ds_idx_pat_cnt, --统计doc_file_name数量
(
  select 
  count(distinct id.doc_file_name) 
  from 
  s_index_file_detail id 
  where
  id.data_res = '中国专利标准化全文文本数据'
  and
  id.date_publication = s.date_publication
  and
  not exists (select 1 from S_CHINA_PATENT_STANDARDFULLTXT sta where sta.doc_file_name = id.doc_file_name)
  ) as ex_idx_pat_cnt --统计doc_file_name数量
from 
s_index_file_info s
where
s.data_res = '中国专利标准化全文文本数据'
group by s.date_publication


















    select count(distinct d.doc_file_name) 
    from 
    S_CHINA_PATENT_STANDARDFULLTXT sta





update s_index_file_info set self_check_successed = 'Y';
commit;



















select * from S_CHINA_PATENT_STANDARDFULLTXT d where d.ori_pub_date is null;































create index mv_idx_pd on mv_extra_idx_info_003(pub_date);
select pub_date, pub_kind, doc_file, index_file_path, doc_file_name  from mv_extra_idx_info_003 order by pub_date, doc_file_name;

select * from user_indexes where table_name = 's_index_file_detail';

----统计按类型 分批次统计索引信息
create materialized view mv_idx_info_stat_by_pubDate
as
select 
i.data_res, 
i.date_publication, 
count(*) as totalIndexCount, 
count(case when i.fully_imported = 'Y' then 1 end) as successedIndex, 
count(case when i.fully_imported = 'N' then 1 end) as failedIndex
from s_index_file_info i
group by i.data_res, i.date_publication
order by i.data_res, i.date_publication
;

select 
data_res, 
date_publication, 
totalIndexCount, 
successedIndex, 
failedIndex
from
(
select 
data_res, date_publication, totalIndexCount, successedIndex, failedIndex 
from mv_idx_info_stat_by_pubDate 
where data_res = '中国专利标准化全文文本数据'
order by date_publication 
)
where 
rownum > 0 and rownum < 20;



select 
data_res
from
mv_idx_info_stat_by_pubDate 
where 
rownum < 10;





--新建代理视图
create or replace view v_idx_info_stat_by_pubDate(data_res, date_publication, totalIndexCount, successedIndex, failedIndex,id, constraint v_idx_info_batch_pk primary key (id) rely disable novalidate)
as
select data_res, date_publication, totalIndexCount, successedIndex, failedIndex, rowid as id
from
mv_idx_info_stat_by_pubDate;

select * from v_idx_info_stat_by_pubDate;






alter view v_idx_info_stat_by_pubDate add constraint vid_pk primary key (id) enable;
alter view v_idx_info_stat_by_pubDate add constraint vid_pk primary key (id) ;
alter view v_idx_info_stat_by_pubDate drop constraint vid_pk;


drop view v_idx_info_stat_by_pubDate;


select * from v_idx_info_stat_by_pubDate;





003 //按照批次进行统计 专利数量
select 
to_char(s.ori_pub_date, 'yyyyMMdd'), count(distinct s.doc_file_name), percent_rank() 
from
S_CHINA_PATENT_STANDARDFULLTXT s
where 56 = length(s.doc_file_name) and s.ori_pub_number is not null
group by s.ori_pub_date;



select 
to_char(s.ori_pub_date, 'yyyyMMdd'), count(distinct s.doc_file_name)
from
S_CHINA_PATENT_STANDARDFULLTXT s
where 56 = length(s.doc_file_name) and s.ori_pub_number is not null
group by grouping sets (s.ori_pub_date);


select * from dual;

select * from all_sales;


select count(*) from S_JOURNAL_PROJECT_ABSTRACT s;

alter table S_JOURNAL_PROJECT_ABSTRACT add ARTICLE_INFO_KEYWORDS_ALL_L clob;
update S_JOURNAL_PROJECT_ABSTRACT set ARTICLE_INFO_KEYWORDS_ALL_L = ARTICLE_INFO_KEYWORDS_ALL;

alter table S_JOURNAL_PROJECT_ABSTRACT rename ARTICLE_INFO_KEYWORDS_ALL to ARTICLE_INFO_KEYWORDS_ALL_O;
alter table S_JOURNAL_PROJECT_ABSTRACT rename ARTICLE_INFO_KEYWORDS_ALL_L to ARTICLE_INFO_KEYWORDS_ALL;


alter table S_JOURNAL_PROJECT_ABSTRACT rename column ARTICLE_INFO_KEYWORDS_ALL to ARTICLE_INFO_KEYWORDS_ALL_O;
alter table S_JOURNAL_PROJECT_ABSTRACT rename column ARTICLE_INFO_KEYWORDS_ALL_L to ARTICLE_INFO_KEYWORDS_ALL;

alter table S_JOURNAL_PROJECT_ABSTRACT drop column ARTICLE_INFO_KEYWORDS_ALL_O;

commit;





select 
d.date_publication, d.pub_country, d.pub_kind, d.pat_cnt, d.doc_file, d.index_file_path
from 
s_index_file_detail d
where 
56 = length(d.doc_file_name)
and
d.doc_file_name 
not in 
(
select 
distinct f.doc_file_name 
from 
S_CHINA_PATENT_STANDARDFULLTXT f
where 
56 = length(f.doc_file_name)
and
f.ori_pub_number is not null
) 





/**003 查看索引 doc_file_name重复的记录详情**/
select 
d.doc_file_name , i.file_path "索引路径", i.date_publication, i.pub_kind
from
s_index_file_detail d
left join 
s_index_file_info i
on
d.index_info_id = i.id
where 
d.doc_file_name
in
(
select
doc_file_name
from 
s_index_file_detail d
group by d.doc_file_name
having count(*) > 1
)
order by d.date_publication, d.doc_file_name









/**003 查询压缩包重复记录**/
select f.ori_pub_date "批次", f.ori_pub_kind ,f.doc_file_name "文件名", f.file_path "文件路径", f.archive_inner_path "文件夹内路径"
from
S_CHINA_PATENT_STANDARDFULLTXT f
where 
f.doc_file_name
in
(
select 
t.doc_file_name
from
S_CHINA_PATENT_STANDARDFULLTXT t
where 
length(t.doc_file_name) = 56
and
t.sta_app_number is not null
group by t.doc_file_name
having count(t.doc_file_name) > 1
)
order by f.ori_pub_date, f.doc_file_name;
;













select * from s_index_file_info t where t.fully_imported = 'N';
select
distinct to_char(t.ori_pub_date, 'yyyyMMdd')
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(t.doc_file_name) = 56
and
t.sta_app_number is not null
minus
select
distinct d.date_publication
from
s_Index_File_Info d;
select * from s_Index_File_Info i;



select
distinct d.pub_date
from
s_Index_File_Detail d
minus
select 
distinct to_char(t.ori_pub_date, 'yyyyMMdd')
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(t.doc_file_name) = 56
and
t.sta_app_number is not null;



select
*
from
(
(select 
distinct to_char(t.ori_pub_date, 'yyyyMMdd')
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(t.doc_file_name) = 56
and
t.sta_app_number is not null
minus
select
distinct d.pub_date
from
s_Index_File_Detail d)
union
(
select
distinct d.pub_date
from
s_Index_File_Detail d
minus
select 
distinct to_char(t.ori_pub_date, 'yyyyMMdd')
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(t.doc_file_name) = 56
and
t.sta_app_number is not null
)
)









select 
count(d.doc_file_name)
from
s_index_file_detail d
where 
d.doc_file_name = some
(
select 
t.doc_file_name
from 
S_CHINA_PATENT_STANDARDFULLTXT t
);

select 
count(t.doc_file_name)
from
S_CHINA_PATENT_STANDARDFULLTXT t
where 
t.doc_file_name = some
(
select 
d.doc_file_name
from 
s_index_file_detail d
);









/**统计通过数据能找到的索引**/
select 
count(distinct d.doc_file_name)
from
s_index_file_detail d
where 
d.doc_file_name = some
(
select 
t.doc_file_name
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(t.doc_file_name) = 56
and
t.sta_app_number is null
);




select 
count(distinct t.doc_file_name)
from
S_CHINA_PATENT_STANDARDFULLTXT t
where 
t.doc_file_name = some
(
select 
d.doc_file_name
from 
s_index_file_detail d
);



/**统计通过索引能找到的数据**/
select 
count(distinct t.doc_file_name)
from
S_CHINA_PATENT_STANDARDFULLTXT t
where 
length(t.doc_file_name) =  56
and
t.sta_app_number is not null
and
t.doc_file_name = some
(
select 
d.doc_file_name
from 
s_index_file_detail d
);



select 
count(*)
from
S_CHINA_PATENT_STANDARDFULLTXT t
where 
length(t.doc_file_name) = 56
and
t.sta_app_number is not null
and
t.doc_file_name 
in
(
select 
d.doc_file_name
from 
s_index_file_detail d
);





select 
count(*)
from
S_CHINA_PATENT_STANDARDFULLTXT t
where 
length(t.doc_file_name) = 56
and
t.sta_app_number is not null
and
t.doc_file_name 
in
(
select 
d.doc_file_name
from 
s_index_file_detail d
);









/**统计某批次是否索引是否完整导入**/
select 
count(*) as batch_count,
count(
case 
when bath_fully_imported = 'Y' then 'Y'
end
) as total_imported_batch_Count,
count(
case 
when bath_fully_imported = 'N' then 'N'
end
)  as Not_Fully_imported_batch_Count,
sum(tFile_Count) as Total_File_Num,
sum(YFile_Count) as Imported_File_Num,
sum(NFile_Count) as Failed_File_Num
from
(
select 
tPubD, tFile_Count, YFile_Count, NFile_Count, (case when NFile_Count is null then 'Y' else 'N' end) as bath_fully_imported
from
(
select 
i.date_publication as tPubD, count(*) as tFile_Count
from
s_index_file_info i 
where
i.data_res = '中国专利标准化全文文本数据'
group by 
i.date_publication) t
left join
(
select 
i.date_publication as YPubD, count(*) as YFile_Count
from
s_index_file_info i 
where
i.data_res = '中国专利标准化全文文本数据'
and i.fully_imported = 'Y'
group by 
i.date_publication) y
on
t.tPubD=y.YPubD
left join
(
select 
i.date_publication as NPubD, count(*) as NFile_Count
from
s_index_file_info i 
where
i.data_res = '中国专利标准化全文文本数据'
and i.fully_imported = 'N'
group by 
i.date_publication) n
on 
t.tPubD=n.nPubD
order by t.tPubD
) batch
;


select 
count(*)
from
s_index_file_info i 
where
i.data_res = '中国专利标准化全文文本数据'
and
i.fully_imported = 'Y'
and 
i.pat_cnt <> i.doclist_count
;



select 
count(*)
from
s_index_file_info i 
where
i.data_res = '中国专利标准化全文文本数据'
and
i.fully_imported <> 'Y'
and 
i.doclist_count is null
;







select count(*) from
s_Index_File_Detail t
where
t.data_res = '中国专利标准化全文文本数据';

/**中国专利标准化全文文本数据**/
select 
sum(i.doclist_count)
from
s_index_file_info i 
where
i.data_res = '中国专利标准化全文文本数据'
;

select 
sum(i.doclist_count), sum(i.pat_cnt)
from
s_index_file_info i 
where
i.data_res = '中国专利标准化全文文本数据'
and
i.fully_imported = 'Y'
;


select count(*) "数据表总数"
from
S_CHINA_PATENT_STANDARDFULLTXT t
where 
length(t.doc_file_name) = 56
and
t.ori_app_number is not null;


select count(*) "索引总数"
from
s_Index_File_Detail d
where
d.data_res = ''


select count(distinct t.doc_file_name) from S_CHINA_PATENT_STANDARDFULLTXT t where length(t.doc_file_name) = 56;
select count(distinct t.doc_file_name) from s_index_file_detail t;












/**数据和索引对比 START**/
select 
count(distinct t.doc_file_name) as dataHasIndexInfo
from
S_CHINA_PATENT_STANDARDFULLTXT t
where
t.doc_file_name
in
(
select
distinct d.doc_file_name
from 
s_index_file_detail d
);


select 
count(distinct t.doc_file_name) as dataWithoutIndexInfo
from
S_CHINA_PATENT_STANDARDFULLTXT t
where
(length(t.doc_file_name) = 56)
and
t.doc_file_name
not in
(
select
distinct d.doc_file_name
from 
s_index_file_detail d
);


select 
count(distinct t.doc_file_name) as indexInfoWithoutData
from
s_index_file_detail t
where
t.doc_file_name
in
(
select
distinct d.doc_file_name
from 
S_CHINA_PATENT_STANDARDFULLTXT d
);




select 
count(distinct t.doc_file_name) as indexInfoWithoutData
from
s_index_file_detail t
where
t.doc_file_name
not in
(
select
distinct d.doc_file_name
from 
S_CHINA_PATENT_STANDARDFULLTXT d
);
/**数据和索引对比 END**/


----修正索引表doc_file_name错误问题
update s_index_file_detail id set id.doc_file_name = substr(id.doc_file, instr(id.doc_file, '\', -1, 1) + 1);

alter table  add doc_File_Name varchar2(500);

update S_CHINA_PATENT_STANDARDFULLTXT t set doc_File_Name = substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1);


select 
dtd.id, 
dtd.chinese_name, 
'update  '||dtd.table_name||'  t set doc_File_Name = substr(t.archive_inner_path, instr(t.archive_inner_path, ''/'', -1, 1) + 1);' as upd_SQL
from s_data_resource_types_detail dtd
order by dtd.id
;



create index idxDocFN003 on S_CHINA_PATENT_STANDARDFULLTXT(doc_file_name);

select count(*) from
S_CHINA_PATENT_STANDARDFULLTXT t
where
t.doc_file_name is null
;


/**添加doc_file_name字段**/
alter table S_CHINA_PATENT_STANDARDFULLTXT add doc_File_Name varchar2(500);update S_CHINA_PATENT_STANDARDFULLTXT t set doc_File_Name = substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1);

select 
*
from 
s_index_file_detail d
where
d.doc_file
in
(
select 
o.doc_file
from
(
select 
t.sta_app_number,
t.ori_app_number,
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1) as doc_file
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where t.sta_app_number <> t.ori_app_number
) o
group by o.doc_file
having count(*) > 1
);
























select 
count(*)
from 
S_CHINA_PATENT_STANDARDFULLTXT t
group by t.archive_inner_path, t.file_path
having count(*) > 1
;

select distinct count
from
(
select 
o.doc_file,
count(*) as count
from
(
select 
t.sta_app_number,
t.ori_app_number,
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1) as doc_file
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where t.sta_app_number <> t.ori_app_number
) o
group by o.doc_file
having count(*) > 1
)
;





/**查询重复数据**/
select 
*
from
S_CHINA_PATENT_STANDARDFULLTXT m
where
substr(m.archive_inner_path, instr(m.archive_inner_path, '/', -1, 1) + 1)
in
(
select 
o.doc_file
from
(
select 
t.sta_app_number,
t.ori_app_number,
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1) as doc_file
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where t.sta_app_number <> t.ori_app_number
) o
group by o.doc_file
having count(*) > 1
)
order by 
substr(m.archive_inner_path, instr(m.archive_inner_path, '/', -1, 1) + 1)
;




/**统计重复数据**/
select 
count(*)
from
(
select 
o.doc_file,
count(*) as count
from
(
select 
t.sta_app_number,
t.ori_app_number,
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1) as doc_file
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where t.sta_app_number <> t.ori_app_number
) o
group by o.doc_file
having count(*) > 1
)
;


select 
t.sta_app_number,
t.ori_app_number,
substr(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1), 3, 15) as app_From_DOC_FILE, 
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1) as doc_file
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where t.sta_app_number <> t.ori_app_number;












select count(*)
from
(
select 
t.sta_app_number,
t.ori_app_number,
substr(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1), 3, 15) as app_From_DOC_FILE, 
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1) as doc_file
from 
S_CHINA_PATENT_STANDARDFULLTXT t
) t
where
length(t.doc_file) <> length('CN202007000157861CN00002011199130YFULZH20080924CN006.XML')
;

//CN102009000071778CN00001015319900BFULZH20110601CN00Y.XML

select 
*
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(substr(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1), 3, 15)) <> length('CN202007000157861CN00002011199130YFULZH20080924CN006.XML')


select 
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1),
distinct length(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1))
from 
S_CHINA_PATENT_STANDARDFULLTXT t;


select 
t.*,
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1),
length(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1))
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1)) = 19
;

select 
t.*,
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1),
length(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1))
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1)) <> 56
and 
(
t.sta_app_number is not null
or
t.ori_app_number is not null
)
;


select
count(*), 
t.*,
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1),
length(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1))
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1)) = 56
and 
(
t.sta_app_number is null
or
t.ori_app_number is null
)
;


select
*
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1)) = 56
and 
(
t.sta_app_number is null
or
t.ori_app_number is null
)
;
















select length('CN202007000157861CN00002011199130YFULZH20080924CN006.XML') from dual;












select 
t.sta_app_number,
t.ori_app_number,
substr(substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1), 3, 15) as app_From_DOC_FILE, 
substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1) as doc_file
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
t.sta_app_number <> t.ori_app_number
;


CN202007000192053CN00002011201920YFULZH20080924CN00E.XML









select count(*) from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_country <> f.ori_pub_country
or
f.sta_pub_number <> f.ori_pub_number
or
f.sta_pub_kind <> f.ori_pub_kind
or
f.sta_pub_date <> f.ori_app_date
;


select count(*) pub_country from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_country <> f.ori_pub_country
;

select count(*) pub_number from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_number <> f.ori_pub_number
;

select count(*) pub_kind from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_kind <> f.ori_pub_kind
;

select count(*) pub_date from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_date <> f.ori_pub_date
;

select count(*) app_country from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_app_country <> f.ori_app_country
;

select count(*) app_number from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_app_number <> f.ori_app_number
;

select count(*) app_date from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_app_date <> f.ori_app_date
;


select count(*) app_date from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_kind <> f.ori_pub_kind
and
f.sta_app_date <> f.ori_app_date
;



select count(*) from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_date <> f.ori_pub_date
;

select count(*) from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_date <> f.ori_pub_date
;

select count(*) from S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_date <> f.ori_pub_date
;


/**003数据分析**/
select 
* 
from 
S_CHINA_PATENT_STANDARDFULLTXT f
where
f.sta_pub_country <> f.ori_pub_country
;













select 
*
from
s_index_file_detail;




/**查看doc_file_name重复的记录详情**/
select 
d.doc_file_name, 
d.doc_file,
d.pub_date, 
d.pub_kind, 
i.pat_cnt,
d.index_file_path,
substr(d.index_file_path, 1, instr(d.index_file_path, '\', -1,1) -1) as parentDir,
i.index_file_name
from
s_index_file_detail d
left join 
s_index_file_info i
on
d.index_info_id = i.id
where 
d.doc_file_name
in
(
select
doc_file_name
from 
s_index_file_detail d
group by d.doc_file_name
having count(*) > 1
)
order by d.doc_file_name




/**统计数据文件重复的情况**/
select *
from
(
select
substr(d.doc_file_name, 1, length(d.doc_file_name) - 5), 
count(*) as doc_file_count
from 
s_index_file_detail d
group by substr(d.doc_file_name, 1, length(d.doc_file_name) - 5)
having count(*) > 1
) g
order by g.doc_file_count
desc







create index idxIndexDelDocFileName on 




select
count(*)
from 
s_index_file_detail d
where d.pub_date <> substr(d.doc_file, 1, 8)
;



select
distinct
length(d.doc_file) - length(replace(d.doc_file, '\')) + 1
from 
s_index_file_detail d
where d.pub_date = substr(d.doc_file, 1, 8)
;


select
d.*
from 
s_index_file_detail d
where 
3 = (length(d.doc_file) - length(replace(d.doc_file, '\')) + 1)
;
select
d.*
from 
s_index_file_detail d
where 
4 = (length(d.doc_file) - length(replace(d.doc_file, '\')) + 1)
;
select
d.*
from 
s_index_file_detail d
where 
5 = (length(d.doc_file) - length(replace(d.doc_file, '\')) + 1)
;
select
d.*
from 
s_index_file_detail d
where 
6 = (length(d.doc_file) - length(replace(d.doc_file, '\')) + 1)
;







select
substr(d.doc_file, 1, 8), 
d.*
from 
s_index_file_detail d









select
substr(d.doc_file, 1, 8), 
d.*
from 
s_index_file_detail d


where d.pub_date <> substr(d.doc_file, 1, 8)
;











select 
* 
from 
s_index_file_detail d 
left join 
s_index_file_info i 
on d.index_info_id = i.id
where d.pub_date <> i.date_publication
;

select 
* 
from 
s_index_file_detail d 
left join 
s_index_file_info i 
on d.index_info_id = i.id
where d.pub_kind <> i.pub_kind
;


select 
* 
from 
s_index_file_detail d 




create index idxIndexInfoPubD on s_index_file_info(date_publication);
create index idxIndexDetPubD on s_index_file_detail(pub_date);

alter table S_INDEX_FILE_INFO add pub_kind varchar2(20);
update S_INDEX_FILE_INFO i set pub_kind = substr(i.file_path, instr(i.file_path, '-', -1, 2) + 1,  instr(i.file_path, '-', -1, 1) - instr(i.file_path, '-', -1, 2) -1);



alter table S_INDEX_FILE_INFO add pub_type varchar2(200);
update S_INDEX_FILE_INFO i set pub_type = substr(i.file_path, instr(i.file_path, '\', -1,3) + 1,  instr(i.file_path, '\', -1,2) - instr(i.file_path, '\', -1, 3) -1);

alter table S_INDEX_FILE_INFO add index_file_name varchar2(200);
update S_INDEX_FILE_INFO i set index_file_name = substr(i.file_path, instr(i.file_path, '\', -1, 1)+1);



select 
i.id,
i.data_res,
i.date_publication,
substr(i.file_path, instr(i.file_path, '\', -1, 1)+1), 
i.fully_imported, i.pat_cnt, i.doclist_count,
substr(i.file_path, 1, instr(i.file_path, '\', -1, 1)) as parentDir
from 
S_INDEX_FILE_INFO i 
order by i.date_publication desc;







/***

***/
select 
i.id,
i.data_res,
i.date_publication,
substr(i.file_path, instr(i.file_path, '\', -1,3) + 1,  instr(i.file_path, '\', -1,2) - instr(i.file_path, '\', -1, 3) -1) as pub_Type,
substr(i.file_path, instr(i.file_path, '-', -1, 2) + 1,  instr(i.file_path, '-', -1, 1) - instr(i.file_path, '-', -1, 2) -1) as pub_kind,
substr(i.file_path, instr(i.file_path, '\', -1, 1)+1) as file_Name, 
i.fully_imported, i.pat_cnt, i.doclist_count,
substr(i.file_path, 1, instr(i.file_path, '\', -1, 1) -1) as parent_Dir,
i.file_path
from 
S_INDEX_FILE_INFO i 
order by i.date_publication desc;

full text for utility model
full text for invention grant
full text for invention publication
full text for industrial design



select  o.pub_Type, dbms_lob.substr(wm_concat(distinct o.pub_kind), 200) from 
(
select 
i.id,
i.data_res,
i.date_publication,
substr(i.file_path, instr(i.file_path, '\', -1,3) + 1,  instr(i.file_path, '\', -1,2) - instr(i.file_path, '\', -1, 3) -1) as pub_Type,
substr(i.file_path, instr(i.file_path, '-', -1, 2) + 1,  instr(i.file_path, '-', -1, 1) - instr(i.file_path, '-', -1, 2) -1) as pub_kind,
substr(i.file_path, instr(i.file_path, '\', -1, 1)+1) as file_Name, 
i.fully_imported, i.pat_cnt, i.doclist_count,
substr(i.file_path, 1, instr(i.file_path, '\', -1, 1) -1) as parent_Dir,
i.file_path
from 
S_INDEX_FILE_INFO i 
) o
group by o.pub_Type



select distinct o.pub_kind, o.pub_Type from 
(
select 
i.id,
i.data_res,
i.date_publication,
substr(i.file_path, instr(i.file_path, '\', -1,3) + 1,  instr(i.file_path, '\', -1,2) - instr(i.file_path, '\', -1, 3) -1) as pub_Type,
substr(i.file_path, instr(i.file_path, '-', -1, 2) + 1,  instr(i.file_path, '-', -1, 1) - instr(i.file_path, '-', -1, 2) -1) as pub_kind,
substr(i.file_path, instr(i.file_path, '\', -1, 1)+1) as file_Name, 
i.fully_imported, i.pat_cnt, i.doclist_count,
substr(i.file_path, 1, instr(i.file_path, '\', -1, 1) -1) as parent_Dir,
i.file_path
from 
S_INDEX_FILE_INFO i 
) o
where o.pub_Type = 'full text for industrial design'







order by i.date_publication desc;










select count(*) from S_INDEX_FILE_DETAIL;

select count(*) from S_INDEX_FILE_INFO;

S_INDEX_FILE_DETAIL



select 
t.date_publication,
t.file_path, 
substr(t.file_path, instr(t.file_path, '\', -1, 1) - 8, 8) as parentDir 
from
S_INDEX_FILE_INFO t
where 
substr(t.file_path, instr(t.file_path, '\', -1, 1) - 8, 8)
<> 
date_publication;



select 
t.date_publication,
t.file_path, 
substr(t.file_path, instr(t.file_path, '\', -1, 1) - 8, 8) as parentDir 
from
S_INDEX_FILE_INFO t



select 
t.date_publication,
t.file_path, 
substr(t.file_path, instr(t.file_path, '\', -1, 1) - 8, 8) as parentDir 
from
S_INDEX_FILE_INFO t

















select * from s_Index_File_Info s
select * from s_index_file_detail i;
select count(*) from s_Data_Resource_Types_Detail d where d.hasexporter is not null;

update s_Index_File_Info t set t.self_check_successed = 'N';

select 
length(
'010105;;010110;;010113;;010905;;011517;;011708;;020101;;020131;;020133;;020137;;020701;;020726;;020918;;021101;;021102;;021107;;021108;;021114;;021116;;031925;;040703;;050103;;050525;;050905;;050911;;060303;;070104;;070106;;070325;;090104;;090315;;090702;;100705;;110303;;110312;;130113;;150503;;150506;;160101;;160103;;160107;;170102;;170725;;180301;;180305;;180701;;180705;;181107;;190705;;200101;;200102;;200106;;200303;;200325;;200505;;210107;;210302;;210324;;240902;;241101;;241302;;241501;;241504;;241510;;241525;;241713;;241714;;241715;;241718;;260107;;260117;;260121;;260131;;260914;;261701;;261704;;261705;;261706;;261712;;261903;;270305'
)
from
dual;






create index idxFilePath001 on S_CHINA_PATENT_TEXTCODE(import_session_id);



select count(*), t.import_session_id from S_CHINA_PATENT_TEXTCODE t;



select 
'create index idxFilePath'||replace(d.id, '.', '')||' on '||replace(d.table_name, '.', '')||'(file_path);', 
'create index idxImpSession'||replace(d.id, '.', '')||' on '||replace(d.table_name, '.', '')||'(import_session_id);'
from 
s_Data_Resource_Types_Detail d
order by d.id;











select count(*) from S_INDEX_FILE_INFO t order by t.import_time asc;
select count(*) from S_INDEX_FILE_INFO t;
select count(*) from S_INDEX_FILE_INFO t where t.fully_imported != 'Y';

select t.date_publication, t.file_path from S_INDEX_FILE_INFO t order by to_date(t.date_publication, 'yyyyMMdd') asc;


select * from S_INDEX_FILE_INFO t order by to_date(t.date_publication, 'yyyyMMdd') asc;



select length('INDEX-CN-19851010-U-001.XML') from dual;




create index indexDetilFilePath on S_INDEX_FILE_DETAIL(index_file_path);
create index indexInfoFilePath on S_INDEX_FILE_INFO(file_path);





create table S_INDEX_FILE_DETAIL
(
  id                    VARCHAR2(100) not null,
  date_exchange         VARCHAR2(100),
  date_produced         VARCHAR2(100),
  date_publication      VARCHAR2(100),
  pat_cnt               VARCHAR2(100),
  pub_country           VARCHAR2(500),
  pub_doc_number        VARCHAR2(500),
  pub_kind              VARCHAR2(100),
  pub_date              VARCHAR2(100),
  app_country           VARCHAR2(500),
  app_doc_number        VARCHAR2(500),
  app_date              VARCHAR2(500),
  doc_file              VARCHAR2(4000),
  index_file_path       VARCHAR2(4000),
  import_time           TIMESTAMP(6),
  data_res              VARCHAR2(500),
  index_info_id         VARCHAR2(100),
  validate_data_success VARCHAR2(100),
  self_check_successed  VARCHAR2(100),
  note                  VARCHAR2(4000),
  archive_inner_path    VARCHAR2(4000),
  doc_file_name         VARCHAR2(1000)
);


tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_INDEX_FILE_DETAIL
  add constraint INDEXFILEKEY primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );






create table S_INDEX_FILE_INFO
(
  id                    VARCHAR2(100) not null,
  date_exchange         VARCHAR2(100),
  date_produced         VARCHAR2(100),
  date_publication      VARCHAR2(100),
  pat_cnt               VARCHAR2(100),
  data_res              VARCHAR2(100),
  file_path             VARCHAR2(4000),
  import_time           TIMESTAMP(6),
  fully_imported        VARCHAR2(100),
  validate_data_success VARCHAR2(100),
  self_check_successed  VARCHAR2(100),
  note                  VARCHAR2(4000),
  doclist_count         VARCHAR2(1000)
);
alter table S_INDEX_FILE_INFO
  add constraint INDEXINFOPRIMARYK primary key (ID);
























select * from S_CHINA_PATENT_STANDARDFULLTXT t order by t.import_time desc;







select s.* from S_CHINA_PATENT_STANDARDFULLTXT s order by s.import_time desc;

update import_session t set tablename = 'S_DOCDB' where t.data_res_type='DOCDB数据（标准化）';

select * from s_import_bath s where s.id='d34fdd4d-3fee-46b4-87a5-8d5480f7f5c7';


中国专利全文代码化数据


\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION PUBLICATION\
select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION PUBLICATION\%';

select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION PUBLICATION\%';

select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION PUBLICATION\%';

select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION PUBLICATION\%';

select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION PUBLICATION\%';

select * from s_import_bath s where s.res_type='中国专利全文代码化数据';

'd34fdd4d-3fee-46b4-87a5-8d5480f7f5c7'










select count(distinct f.file_path)  from S_FOREIGN_PATENT_SEQUENCE f;



select count(*) from S_BIOLOGICAL_SEQ s where s.s_foreign_patent_seq_id not in (select f.id from S_FOREIGN_PATENT_SEQUENCE f);
 
国外专利生物序列加工成品数据

select * from import_session s where s.data_res_type = '国外专利生物序列加工成品数据';

select * from s_import_bath b where b.res_type =  '国外专利生物序列加工成品数据';





 
 
 
 
 
 
 


 select * from S_MADRID_BRAND_ENTER_CHINA m order by  m.mark_cn_id, m.path_file, m.archive_inner_path;
 
 select * from S_MADRID_BRAND_ENTER_CHINA_A e where e.import_session_id 
       in
(
select s.session_id from import_session s 
where 
s.batch_id = '3dc0c66a-d28e-4040-9f17-c509e269ad8c'); 

 select count(*) from S_MADRID_BRAND_ENTER_CHINA_A e where e.import_session_id 
       in
(
select s.session_id from import_session s 
where 
s.batch_id = '3dc0c66a-d28e-4040-9f17-c509e269ad8c'); 


 select count(*) from S_MADRID_BRAND_ENTER_CHINA_A e where e.import_session_id 
       in
(
select s.session_id from import_session s 
where 
s.batch_id = '59ff474d-4f0d-4354-a942-91225caa75b4'); 



select a.mark_cn_id, a.file_path, a.archive_inner_path, count(*) from S_MADRID_BRAND_ENTER_CHINA_A a group by a.mark_cn_id, a.file_path, a.archive_inner_path
having count(*) > 1
order by a.mark_cn_id;


select a.mark_cn_id, a.file_path, count(*) from S_MADRID_BRAND_ENTER_CHINA_A a group by a.mark_cn_id, a.file_path
having count(*) > 1
order by a.mark_cn_id;
















create table zcgdebug as  select d.id from
(
         (select file_path, max(import_time) as import_time
         from 
         S_MADRID_BRAND_ENTER_CHINA_A
         group by 
         file_path 
         having count(file_path) >1
         ) t
         left join S_MADRID_BRAND_ENTER_CHINA_A d
         on t.file_path = d.file_path and d.import_time = t.import_time
         )


insert into zcgdebug 
select d.id from
       (
         (select mark_cn_id, max(import_time) as import_time
         from 
         S_MADRID_BRAND_ENTER_CHINA 
         group by 
         mark_cn_id 
         having count(mark_cn_id) = 1
         ) t
         left join S_MADRID_BRAND_ENTER_CHINA d
         on t.mark_cn_id = d.mark_cn_id and d.import_time = t.import_time
         ) 


select count(distinct mark_cn_id) from
S_MADRID_BRAND_ENTER_CHINA o
where
o.id 
in
(
select distinct id from zcgdebug
)


select count(distinct id)  from zcgdebug;

delete from
S_MADRID_BRAND_ENTER_CHINA o
where
o.id 
not in
(
select distinct id from zcgdebug
)











select count(distinct mark_cn_id) from
S_MADRID_BRAND_ENTER_CHINA o
where
o.id 
not in
(
select d.id from
         (select mark_cn_id, max(import_time) as import_time
         from 
         S_MADRID_BRAND_ENTER_CHINA 
         group by 
         mark_cn_id 
         having count(mark_cn_id) >1
         ) t
         left join S_MADRID_BRAND_ENTER_CHINA d
         on t.mark_cn_id = d.mark_cn_id and d.import_time = t.import_time
union
select d.id from
       (
         (select mark_cn_id, max(import_time) as import_time
         from 
         S_MADRID_BRAND_ENTER_CHINA 
         group by 
         mark_cn_id 
         having count(mark_cn_id) = 1
         ) t
         left join S_MADRID_BRAND_ENTER_CHINA d
         on t.mark_cn_id = d.mark_cn_id and d.import_time = t.import_time
         )       
)






















truncate table S_MADRID_BRAND_ENTER_CHINA;

select count(*) from S_MADRID_BRAND_ENTER_CHINA;

insert into S_MADRID_BRAND_ENTER_CHINA select * from S_MADRID_BRAND_ENTER_CHINA_A;

delete from
S_MADRID_BRAND_ENTER_CHINA o
where
o.id 
not in
(
select d.id from
         (select mark_cn_id, max(import_time) as import_time
         from 
         S_MADRID_BRAND_ENTER_CHINA 
         group by 
         mark_cn_id 
         having count(mark_cn_id) >1
         ) t
         left join S_MADRID_BRAND_ENTER_CHINA d
         on t.mark_cn_id = d.mark_cn_id and d.import_time = t.import_time
         )
         
      
select * from  S_MADRID_BRAND_ENTER_CHINA
where 
mark_cn_id
in
(
select mark_cn_id 
from 
S_MADRID_BRAND_ENTER_CHINA 
group by mark_cn_id 
having count(mark_cn_id) >1   
)      


























select * from s_import_bath b where b.res_type = '马德里商标进入中国' order by b.start_time desc;


S_MADRID_BRAND_ENTER_CHINA



select t.mark_cn_id, s.session_id, b.id, b.dir_path, b.start_time t.archive_inner_path, t.file_path from S_MADRID_BRAND_ENTER_CHINA t left join import_session s on t.import_session_id = s.session_id left join s_import_bath b on s.batch_id = b.id order by t.mark_cn_id;



select * from S_MADRID_BRAND_ENTER_CHINA;
select * from import_session where 

create table S_MADRID_BRAND_ENTER_CHINA_A as select * from S_MADRID_BRAND_ENTER_CHINA;






select count(*) from S_MADRID_BRAND_ENTER_CHINA;



select count(*) from S_MADRID_BRAND_ENTER_CHINA_A;


select * from S_MADRID_BRAND_ENTER_CHINA_A;
















select count(*) from S_T_BIOLOGICAL_CN cn;

select count(*) from S_T_BIOLOGICAL_INFO_CN i where i.bio_id in (select b.id from S_T_BIOLOGICAL_CN b);



select * from import_session t where t.data_res_type='中国专利标准化全文文本数据' and t.zip_or_dir_path like '%full text for invention grant%' order by t.start_time desc;

ed4add3d-cae9-46c3-b4b8-a2730125e780
select * from import_session t where t.batch_id='ed4add3d-cae9-46c3-b4b8-a2730125e780' and t.completed = 'Y';







select b.* from s_import_bath b where b.res_type = '中国专利全文代码化数据';
select sum(s.zip_entries_count) from import_session s where s.data_res_type = '中国专利全文代码化数据' and s.completed = 'N';
select * from import_session s where s.batch_id = '46049cc4-fe0d-41b7-b733-ea7864e6026f';
select distinct s.zip_or_dir_path from import_session s where s.data_res_type = '中国专利全文代码化数据';
select count(s.zip_or_dir_path) from import_session s where s.data_res_type = '中国专利全文代码化数据';
select count(s.zip_or_dir_path) from import_session s where s.batch_id = '46049cc4-fe0d-41b7-b733-ea7864e6026f';
select count(s.zip_or_dir_path) from import_session s where s.batch_id = '257b6696-6219-49bf-9fbd-29609b6e7baa';
select count(s.zip_or_dir_path) from import_session s where s.batch_id = '46c78902-9292-4079-8599-5fccae3449de';
select count(s.zip_or_dir_path) from import_session s where s.batch_id = '9db82f8e-97a2-4bed-a315-02fdd9ed52a6';

select * from import_error e where e.session_id in (select s.session_id from import_session s where s.batch_id = '257b6696-6219-49bf-9fbd-29609b6e7baa')
select * from import_error e where e.session_id in (select s.session_id from import_session s where s.batch_id = '46c78902-9292-4079-8599-5fccae3449de')
select * from import_error e where e.session_id in (select s.session_id from import_session s where s.batch_id = '9db82f8e-97a2-4bed-a315-02fdd9ed52a6')

select e.zip_or_dir_path, e.zip_path  from import_error e where e.session_id in (select s.session_id from import_session s where s.batch_id in ('257b6696-6219-49bf-9fbd-29609b6e7baa','46c78902-9292-4079-8599-5fccae3449de','9db82f8e-97a2-4bed-a315-02fdd9ed52a6')) order by e.zip_or_dir_path;

select e.zip_or_dir_path, e.zip_path  from import_error e where e.session_id in (select s.session_id from import_session s where s.batch_id = '46c78902-9292-4079-8599-5fccae3449de') order by e.zip_or_dir_path;
select e.zip_or_dir_path, e.zip_path  from import_error e where e.session_id in (select s.session_id from import_session s where s.batch_id = '9db82f8e-97a2-4bed-a315-02fdd9ed52a6') order by e.zip_or_dir_path;

select e.zip_or_dir_path, e.zip_path from import_error e where e.session_id in (select s.session_id from import_session s where s.batch_id = '257b6696-6219-49bf-9fbd-29609b6e7baa')

select distinct s.zip_or_dir_path from import_session s where s.data_res_type = '中国专利全文代码化数据' and s.completed = 'N' order by s.zip_or_dir_path asc;

select distinct t.file_path from S_CHINA_PATENT_TEXTCODE t where t.file_path not in (select distinct s.zip_or_dir_path from import_session s where s.data_res_type = '中国专利全文代码化数据') order by File_Path asc;

select t.* from import_session t where t.tablename is null;


select * from S_CHINA_PATENT_REVIEW t; 

select * from S_CHINA_PATENT_JUDGMENT t;



select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t 


create index ImportSessionIDIndex on Import_Session(session_id);

create index ImportSessionPathIndex on Import_Session(zip_or_dir_path);


select t.*, t.rowid from S_CHINA_PATENT_TEXTCODE t where t.id = '039e60f7-d10c-4bb8-8ae5-7f8c467c2a5f';











select t.file_path from S_CHINA_PATENT_REVIEW t;

select * from S_CHINA_PATENT_REVIEW t;



select * from s_china_brand t;

















select * from S_CHINA_BRAND;

create index sCnBrandMarkCNIDs on S_CHINA_BRAND(Mark_Cn_Id);


select * from s_china_brand t order by t.import_time desc;
select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t where t.hasexporter = 'Y';
update S_DATA_RESOURCE_TYPES_DETAIL t set t.hasexporter='Y' where t.id in (132,136,138,139,140,147,162,172,180,183,184,194,196,209,209.1,209.2,210);
alter table S_CHINA_BRAND modify mark_cn_id VARCHAR2(4000);
alter table S_CHINA_BRAND modify nameinfo_name VARCHAR2(4000);
alter table S_CHINA_BRAND modify baseinfo_original_language VARCHAR2(4000);
alter table S_CHINA_BRAND modify baseinfo_registration_no VARCHAR2(4000);
alter table S_CHINA_BRAND modify baseinfo_application_no VARCHAR2(4000);
alter table S_CHINA_BRAND modify baseinfo_trademark_type VARCHAR2(4000);
alter table S_CHINA_BRAND modify baseinfo_current_state_right VARCHAR2(4000);
alter table S_CHINA_BRAND modify baseinfo_specified_color VARCHAR2(4000);
alter table S_CHINA_BRAND modify path_jpg VARCHAR2(4000);
alter table S_CHINA_BRAND modify path_jpg_sf VARCHAR2(4000);
alter table S_CHINA_BRAND modify path_file VARCHAR2(4000);
alter table S_CHINA_BRAND modify exist_jpg VARCHAR2(4000);
alter table S_CHINA_BRAND modify exist_jpg_sf VARCHAR2(4000);
alter table S_CHINA_BRAND modify exist_file VARCHAR2(4000);

truncate table S_JOURNAL_PROJECT_ABSTRACT;

drop table S_JOURNAL_PROJECT_ABSTRACT;

select * from s_import_bath t where t.id = '19318f79-6fbf-489e-a6cf-c9113ad5f8b1';

select * from s_import_bath t where t.id = '59599c96-32ea-4a1c-bb63-fbf5834c8678';

alter table S_T_BIOLOGICAL_FEATURE_FY add bio_id varchar2(100);
alter table S_T_BIOLOGICAL_FEATURE_FY add bio_info varchar2(100);

alter table S_T_BIOLOGICAL_FEATURE_CN add bio_info_seq_no varchar2(100);
alter table S_T_BIOLOGICAL_FEATURE_FY add bio_info_seq_no varchar2(100);

-- Create table
create table "S_T_BIOLOGICAL_FEATURE_CN"
(
  id                         VARCHAR2(100) not null,
  current_application_number VARCHAR2(200),
  information_for_seq_id_no  VARCHAR2(200),
  feature                    VARCHAR2(4000),
  name_key                   VARCHAR2(4000),
  location                   VARCHAR2(4000),
  other_info                 VARCHAR2(4000)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table "S_T_BIOLOGICAL_FEATURE_CN"
  add constraint PRI_FUR_CN primary key (ID);
  
  
  
  -- Create table
create table "S_T_BIOLOGICAL_FEATURE_FY"
(
  id                         VARCHAR2(100) not null,
  current_application_number VARCHAR2(200),
  information_for_seq_id_no  VARCHAR2(200),
  feature                    VARCHAR2(4000),
  name_key                   VARCHAR2(4000),
  location                   VARCHAR2(4000),
  other_info                 VARCHAR2(4000)
);
alter table "S_T_BIOLOGICAL_FEATURE_FY"
  add constraint PRI_FUR_FY primary key (ID);

drop table "S_T_BIOLOGICAL _FEATURE_CN";
drop table "S_T_BIOLOGICAL _FEATURE_FY";



-- Add/modify columns 
alter table S_CHINA_COURTCASE_PROCESS modify c_name VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_court_name VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_court_province VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_court_city VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_court_code VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_court_level VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_court_num VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_casetype VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_subbranch VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_verdictresult VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_legalnumber_superiors VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_applycost VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_judgecost VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_pre_judge VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_proxy_pre_judge VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_judge VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_proxy_judge VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_jury VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_clerk VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify s_year VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify holdingtype VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_pl_n_key VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify c_pl_n_key_standard VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify path_pdf VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify path_xml VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify exist_pdf VARCHAR2(4000);
alter table S_CHINA_COURTCASE_PROCESS modify exist_xml VARCHAR2(4000);


select * from s_import_bath t where t.id = '60dd879f-e60b-461f-8dd5-2690a400b039';


select * from import_session t where t.batch_id = '60dd879f-e60b-461f-8dd5-2690a400b039';
60dd879f-e60b-461f-8dd5-2690a400b039
select * from s_china_brand;
truncate table s_china_brand;
create table S_DOCDB
(
  id                        VARCHAR2(100) not null,
  sta_pub_country           VARCHAR2(200),
  sta_pub_number            VARCHAR2(200),
  sta_pub_kind              VARCHAR2(200),
  sta_pub_date              DATE,

  docdb_pub_country         VARCHAR2(200),
  docdb_pub_number          VARCHAR2(200),
  docdb_pub_kind            VARCHAR2(200),
  docdb_pub_date            DATE,

  epodc_pub_number          VARCHAR2(200),

  ori_pub_country           VARCHAR2(200),
  ori_pub_number            VARCHAR2(200),
  ori_pub_kind              VARCHAR2(200),
  ori_pub_date              DATE,

  sta_app_country           VARCHAR2(200),
  sta_app_number            VARCHAR2(200),
  sta_app_kind              VARCHAR2(200),
  sta_app_date              DATE,


  docdb_app_country         VARCHAR2(200),
  docdb_app_number          VARCHAR2(200),
  docdb_app_kind            VARCHAR2(200),
  docdb_app_date            DATE,

  epodc_app_number          VARCHAR2(200),

  ori_app_number            VARCHAR2(200),
  ori_app_country           VARCHAR2(200),
  ori_app_kind              VARCHAR2(200),
  ori_app_date              DATE,

  classificationipcrdetails CLOB,

  inventiontitle_en         VARCHAR2(3000),
  inventiontitle_zh         VARCHAR2(3000),

  abstract_en               CLOB,
  abstract_zh               CLOB,

  path_xml                  VARCHAR2(200),
  exist_xml                 VARCHAR2(1),

  import_session_id         NVARCHAR2(100),
  import_time               DATE,
  archive_inner_path        VARCHAR2(1000),
  file_path                 VARCHAR2(1000),
  session_index             NUMBER
)

alter table S_DOCDB
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );















































drop table S_DOCDB;






-- Create table
create table S_DOCDB
(
  id                        VARCHAR2(100) not null,
  sta_pub_country           VARCHAR2(200),
  sta_pub_number            VARCHAR2(200),
  sta_pub_kind              VARCHAR2(200),
  sta_pub_date              DATE,

  docdb_pub_country         VARCHAR2(200),
  docdb_pub_number          VARCHAR2(200),
  docdb_pub_kind            VARCHAR2(200),
  docdb_pub_date            DATE,

  epodc_pub_number          VARCHAR2(200),

  ori_pub_country           VARCHAR2(200),
  ori_pub_number            VARCHAR2(200),
  ori_pub_kind              VARCHAR2(200),
  ori_pub_date              DATE,

  sta_app_country           VARCHAR2(200),
  sta_app_number            VARCHAR2(200),
  sta_app_kind              VARCHAR2(200),
  sta_app_date              DATE,


  docdb_app_country         VARCHAR2(200),
  docdb_app_number          VARCHAR2(200),
  docdb_app_kind            VARCHAR2(200),
  docdb_app_date            DATE,

  epodc_app_number          VARCHAR2(200),

  ori_app_number            VARCHAR2(200),
  ori_app_country           VARCHAR2(200),
  ori_app_kind              VARCHAR2(200),
  ori_app_date              DATE,

  classificationipcrdetails CLOB,

  inventiontitle_en         VARCHAR2(3000),
  inventiontitle_zh         VARCHAR2(3000),

  abstract_en               CLOB,
  abstract_zh               CLOB

  path_xml                  VARCHAR2(200),
  exist_xml                 VARCHAR2(1),

  import_session_id         NVARCHAR2(100),
  import_time               DATE,
  archive_inner_path        VARCHAR2(1000),
  file_path                 VARCHAR2(1000),
  session_index             NUMBER,
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_DOCDB
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );







 drop table S_T_BIOLOGICAL_CN;
 drop table S_T_BIOLOGICAL_FY;
 drop table S_T_BIOLOGICAL_INFO_CN;  
 drop table S_T_BIOLOGICAL_INFO_FY;
 drop table S_T_BIOLOGICAL_PRIORITY_CN;
 drop table S_T_BIOLOGICAL_PRIORITY_FY;

create table S_T_BIOLOGICAL_CN
(
  project_name               VARCHAR2(200),
  applicant_name             VARCHAR2(2000),
  title_of_invention         VARCHAR2(4000),
  application_file_reference VARCHAR2(200),
  current_application_number VARCHAR2(200),
  current_filing_date        VARCHAR2(200),
  sequence_file_name         VARCHAR2(200),
  number_of_sequences        VARCHAR2(200),
  software                   VARCHAR2(200),
  project_path               VARCHAR2(200),
  sequence_file_path         VARCHAR2(200),
  batchid                    VARCHAR2(100),
  import_session_id          NVARCHAR2(100),
  import_time                DATE,
  archive_inner_path         VARCHAR2(1000),
  file_path                  VARCHAR2(1000),
  session_index              NUMBER,
  id                         VARCHAR2(100) not null
);
alter table S_T_BIOLOGICAL_CN
  add constraint PRIBIOCN primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

create table S_T_BIOLOGICAL_FY
(
  project_name               VARCHAR2(200),
  applicant_name             VARCHAR2(2000),
  title_of_invention         VARCHAR2(4000),
  application_file_reference VARCHAR2(200),
  current_application_number VARCHAR2(200),
  current_filing_date        VARCHAR2(200),
  sequence_file_name         VARCHAR2(200),
  number_of_sequences        VARCHAR2(200),
  software                   VARCHAR2(200),
  project_path               VARCHAR2(200),
  sequence_file_path         VARCHAR2(200),
  batchid                    VARCHAR2(100),
  import_session_id          NVARCHAR2(100),
  import_time                DATE,
  archive_inner_path         VARCHAR2(1000),
  file_path                  VARCHAR2(1000),
  session_index              NUMBER,
  id                         VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_T_BIOLOGICAL_FY
  add constraint PRIBIOFY primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;


-- Create table
create table S_T_BIOLOGICAL_INFO_CN
(
  id                         VARCHAR2(100) not null,
  current_application_number VARCHAR2(200),
  information_for_seq_id_no  VARCHAR2(200),
  length                     VARCHAR2(200),
  type                       VARCHAR2(200),
  organism                   VARCHAR2(200),
  feature                    VARCHAR2(200),
  name_key                   VARCHAR2(200),
  location                   VARCHAR2(200),
  other_information          VARCHAR2(4000),
  sequence_description       CLOB,
  batchid                    VARCHAR2(100),
  bio_id                     VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_T_BIOLOGICAL_INFO_CN
  add constraint PRIBIOINFOCN primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;





-- Create table
create table S_T_BIOLOGICAL_PRIORITY_CN
(
  id                            VARCHAR2(100) not null,
  current_application_number    VARCHAR2(200),
  prior_application_number      VARCHAR2(200),
  prior_application_filing_date VARCHAR2(200),
  batchid                       VARCHAR2(100),
  bio_id                        VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_T_BIOLOGICAL_PRIORITY_CN
  add constraint PRIBIOPRICN primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;



-- Create table
create table S_T_BIOLOGICAL_PRIORITY_FY
(
  id                            VARCHAR2(100) not null,
  current_application_number    VARCHAR2(200),
  prior_application_number      VARCHAR2(200),
  prior_application_filing_date VARCHAR2(200),
  batchid                       VARCHAR2(100),
  bio_id                        VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_T_BIOLOGICAL_PRIORITY_FY
  add constraint PRIBIOPRIFY primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;


















-- Create table
create table S_T_BIOLOGICAL_PRIORITY_CN
(
  id                            VARCHAR2(100) not null,
  current_application_number    VARCHAR2(200),
  prior_application_number      VARCHAR2(200),
  prior_application_filing_date VARCHAR2(200),
  batchid                       VARCHAR2(100),
  bio_id                        VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_T_BIOLOGICAL_PRIORITY_CN
  add constraint PRIBIOPRICN primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;





























-- Add/modify columns 
alter table S_CHINA_BOOK modify id VARCHAR2(100);
alter table S_CHINA_BOOK modify mg_id varchar2(100);
alter table S_CHINA_BOOK modify mg_num VARCHAR2(100);
alter table S_CHINA_BOOK modify mg_publisher VARCHAR2(500);
alter table S_CHINA_BOOK modify mg_year varchar2(1000);
alter table S_CHINA_BOOK modify mg_pagenum varchar2(1000);
alter table S_CHINA_BOOK modify mg_format VARCHAR2(500);
alter table S_CHINA_BOOK modify mg_size VARCHAR2(200);


















alter table S_DOCDB modify id VARCHAR2(100);
alter table S_DOCDB modify docdb_pub_country VARCHAR2(200);
alter table S_DOCDB modify docdb_pub_number VARCHAR2(200);
alter table S_DOCDB modify docdb_pub_kind VARCHAR2(200);
alter table S_DOCDB modify epodc_pub_number VARCHAR2(200);
alter table S_DOCDB modify ipph_pub_country VARCHAR2(200);
alter table S_DOCDB modify ipph_pub_number VARCHAR2(200);
alter table S_DOCDB modify ipph_pub_kind VARCHAR2(200);
alter table S_DOCDB modify docdb_app_country VARCHAR2(200);
alter table S_DOCDB modify docdb_app_number VARCHAR2(200);
alter table S_DOCDB modify docdb_app_kind VARCHAR2(200);
alter table S_DOCDB modify epodc_app_number VARCHAR2(200);
alter table S_DOCDB modify ori_app_number VARCHAR2(200);
alter table S_DOCDB modify sta_app_country VARCHAR2(200);
alter table S_DOCDB modify sta_app_number VARCHAR2(200);
alter table S_DOCDB modify sta_app_kind VARCHAR2(200);
alter table S_DOCDB modify ipph_app_country VARCHAR2(200);
alter table S_DOCDB modify ipph_app_number VARCHAR2(200);
alter table S_DOCDB modify ipph_app_kind VARCHAR2(200);
alter table S_DOCDB modify inventiontitle_en VARCHAR2(3000);
alter table S_DOCDB modify inventiontitle_zh VARCHAR2(3000);












alter table S_AMERICAN_BRAND_USCLASSIFY add content_cn clob;
alter table S_AMERICAN_BRAND_USCLASSIFY add content_en clob;



-- Add/modify columns 
alter table S_DATA_RESOURCE_TYPES_DETAIL add haschecker VARCHAR2(10);
-- Add comments to the columns 
comment on column S_DATA_RESOURCE_TYPES_DETAIL.haschecker
  is '是否有检验程序';




select * from S_DATA_RESOURCE_TYPES_DETAIL;



select * from S_DATA_RESOURCE_TYPES_DETAIL;

SELECT "Extent1"."ID" AS "ID", "Extent1"."CHINESE_NAME" AS "CHINESE_NAME", "Extent1"."TABLE_NAME" AS "TABLE_NAME", "Extent1"."IMPLEMENTED_IMPORT_LOGIC" AS "IMPLEMENTED_IMPORT_LOGIC", "Extent1"."IN_PROCESS" AS "IN_PROCESS"FROM "DRMSTEST"."S_DATA_RESOURCE_TYPES_DETAIL" "Extent1"

delete from S_BIOLOGICAL_SEQ t;

231. S_World_Patent_LawStatus        世界专利法律状态（INPADOC）
232. S_STD_JP_CIT                    日本引文(STD_JP_CIT)（标准化）
233. S_STD_KR_CIT                    韩国引文(STD_KR_CIT)（标准化）
234. S_STD_KR_PRS                    韩国法律状态数据(STD_KR_PRS)（标准化）
select t.rowid, t.* from S_CHINA_BRAND t where t.trademark_notice_status is not null order by t.import_time desc;

select t.rowid, t.* from S_CHINA_BRAND t  order by t.import_time desc;

select t.rowid, t.* from S_CHINA_BRAND t where DBMS_LOB.GETLENGTH(t.service_list) <> 0 order by t.import_time desc;

select * from S_CHINA_BRAND t where t.mark_cn_id = 'CN00000024649811';

select * from s_import_bath;

select * from S_World_Patent_LawStatus t order by t.import_time desc;
select * from S_STD_JP_CIT t order by t.import_time desc;
select * from S_STD_KR_CIT t order by t.import_time desc;
select * from S_STD_KR_PRS t order by t.import_time desc;

truncate table S_World_Patent_LawStatus;

alter table S_World_Patent_LawStatus add import_session_id NVARCHAR2(100);
alter table S_World_Patent_LawStatus add import_time DATE;
alter table S_World_Patent_LawStatus add archive_inner_path VARCHAR2(1000);
alter table S_World_Patent_LawStatus add file_path VARCHAR2(1000);
alter table S_World_Patent_LawStatus add session_index NUMBER;


select * from s_import_bath b where b.id = 'a9fd17c0-9d8f-4186-85c2-5f838983ccc3';


alter table S_China_Patent_StandardFullTxt add ver_classificationlocarno varchar2(200);alter table S_China_Patent_StandardFullTxt add sta_classificationlocarno varchar2(200);alter table S_China_Patent_StandardFullTxt add ori_classificationlocarno varchar2(200);alter table S_China_Patent_StandardFullTxt add oth_classificationlocarno varchar2(200);

alter table S_China_Patent_Bibliographic   add ver_classificationlocarno varchar2(200);alter table S_China_Patent_Bibliographic   add sta_classificationlocarno varchar2(200);alter table S_China_Patent_Bibliographic   add ori_classificationlocarno varchar2(200);alter table S_China_Patent_Bibliographic   add oth_classificationlocarno varchar2(200);

alter table S_China_Standard_SimpCitation  add ver_classificationlocarno varchar2(200);alter table S_China_Standard_SimpCitation  add sta_classificationlocarno varchar2(200);alter table S_China_Standard_SimpCitation  add ori_classificationlocarno varchar2(200);alter table S_China_Standard_SimpCitation  add oth_classificationlocarno varchar2(200);

alter table S_American_Patent_FullText     add ver_classificationlocarno varchar2(200);alter table S_American_Patent_FullText     add sta_classificationlocarno varchar2(200);alter table S_American_Patent_FullText     add ori_classificationlocarno varchar2(200);alter table S_American_Patent_FullText     add oth_classificationlocarno varchar2(200);

alter table S_European_Patent_FullText     add ver_classificationlocarno varchar2(200);alter table S_European_Patent_FullText     add sta_classificationlocarno varchar2(200);alter table S_European_Patent_FullText     add ori_classificationlocarno varchar2(200);alter table S_European_Patent_FullText     add oth_classificationlocarno varchar2(200);

alter table S_Korean_Patent_FullTextCode   add ver_classificationlocarno varchar2(200);alter table S_Korean_Patent_FullTextCode   add sta_classificationlocarno varchar2(200);alter table S_Korean_Patent_FullTextCode   add ori_classificationlocarno varchar2(200);alter table S_Korean_Patent_FullTextCode   add oth_classificationlocarno varchar2(200);

alter table S_Swiss_Patent_FullTextCode    add ver_classificationlocarno varchar2(200);alter table S_Swiss_Patent_FullTextCode    add sta_classificationlocarno varchar2(200);alter table S_Swiss_Patent_FullTextCode    add ori_classificationlocarno varchar2(200);alter table S_Swiss_Patent_FullTextCode    add oth_classificationlocarno varchar2(200);

alter table S_British_Patent_FullTextCode  add ver_classificationlocarno varchar2(200);alter table S_British_Patent_FullTextCode  add sta_classificationlocarno varchar2(200);alter table S_British_Patent_FullTextCode  add ori_classificationlocarno varchar2(200);alter table S_British_Patent_FullTextCode  add oth_classificationlocarno varchar2(200);

alter table S_Japan_Patent_FullTextCode    add ver_classificationlocarno varchar2(200);alter table S_Japan_Patent_FullTextCode    add sta_classificationlocarno varchar2(200);alter table S_Japan_Patent_FullTextCode    add ori_classificationlocarno varchar2(200);alter table S_Japan_Patent_FullTextCode    add oth_classificationlocarno varchar2(200);

alter table S_Belgian_Patent_FullText      add ver_classificationlocarno varchar2(200);alter table S_Belgian_Patent_FullText      add sta_classificationlocarno varchar2(200);alter table S_Belgian_Patent_FullText      add ori_classificationlocarno varchar2(200);alter table S_Belgian_Patent_FullText      add oth_classificationlocarno varchar2(200);

alter table S_Austria_Patent_FullText      add ver_classificationlocarno varchar2(200);alter table S_Austria_Patent_FullText      add sta_classificationlocarno varchar2(200);alter table S_Austria_Patent_FullText      add ori_classificationlocarno varchar2(200);alter table S_Austria_Patent_FullText      add oth_classificationlocarno varchar2(200);

alter table S_Spanish_Patent_FullText      add ver_classificationlocarno varchar2(200);alter table S_Spanish_Patent_FullText      add sta_classificationlocarno varchar2(200);alter table S_Spanish_Patent_FullText      add ori_classificationlocarno varchar2(200);alter table S_Spanish_Patent_FullText      add oth_classificationlocarno varchar2(200);

alter table S_Poland_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_Poland_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_Poland_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_Poland_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_Israel_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_Israel_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_Israel_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_Israel_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_Singapore_Patent_Description add ver_classificationlocarno varchar2(200);alter table S_Singapore_Patent_Description add sta_classificationlocarno varchar2(200);alter table S_Singapore_Patent_Description add ori_classificationlocarno varchar2(200);alter table S_Singapore_Patent_Description add oth_classificationlocarno varchar2(200);

alter table S_American_Design_Patent       add ver_classificationlocarno varchar2(200);alter table S_American_Design_Patent       add sta_classificationlocarno varchar2(200);alter table S_American_Design_Patent       add ori_classificationlocarno varchar2(200);alter table S_American_Design_Patent       add oth_classificationlocarno varchar2(200);

alter table S_Korea_Design_Patent          add ver_classificationlocarno varchar2(200);alter table S_Korea_Design_Patent          add sta_classificationlocarno varchar2(200);alter table S_Korea_Design_Patent          add ori_classificationlocarno varchar2(200);alter table S_Korea_Design_Patent          add oth_classificationlocarno varchar2(200);

alter table S_Russian_Patent_Abstracts     add ver_classificationlocarno varchar2(200);alter table S_Russian_Patent_Abstracts     add sta_classificationlocarno varchar2(200);alter table S_Russian_Patent_Abstracts     add ori_classificationlocarno varchar2(200);alter table S_Russian_Patent_Abstracts     add oth_classificationlocarno varchar2(200);

alter table S_China_Patent_Abstracts       add ver_classificationlocarno varchar2(200);alter table S_China_Patent_Abstracts       add sta_classificationlocarno varchar2(200);alter table S_China_Patent_Abstracts       add ori_classificationlocarno varchar2(200);alter table S_China_Patent_Abstracts       add oth_classificationlocarno varchar2(200);

alter table S_WIPO_Patent_Description      add ver_classificationlocarno varchar2(200);alter table S_WIPO_Patent_Description      add sta_classificationlocarno varchar2(200);alter table S_WIPO_Patent_Description      add ori_classificationlocarno varchar2(200);alter table S_WIPO_Patent_Description      add oth_classificationlocarno varchar2(200);

alter table S_Canadian_Patent_Description  add ver_classificationlocarno varchar2(200);alter table S_Canadian_Patent_Description  add sta_classificationlocarno varchar2(200);alter table S_Canadian_Patent_Description  add ori_classificationlocarno varchar2(200);alter table S_Canadian_Patent_Description  add oth_classificationlocarno varchar2(200);

alter table S_Russian_Patent_Description   add ver_classificationlocarno varchar2(200);alter table S_Russian_Patent_Description   add sta_classificationlocarno varchar2(200);alter table S_Russian_Patent_Description   add ori_classificationlocarno varchar2(200);alter table S_Russian_Patent_Description   add oth_classificationlocarno varchar2(200);

alter table S_Australian_Patent_FullText   add ver_classificationlocarno varchar2(200);alter table S_Australian_Patent_FullText   add sta_classificationlocarno varchar2(200);alter table S_Australian_Patent_FullText   add ori_classificationlocarno varchar2(200);alter table S_Australian_Patent_FullText   add oth_classificationlocarno varchar2(200);

alter table S_German_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_German_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_German_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_German_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_French_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_French_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_French_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_French_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_Taiwan_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_Taiwan_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_Taiwan_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_Taiwan_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_Hongkong_Patent_Description  add ver_classificationlocarno varchar2(200);alter table S_Hongkong_Patent_Description  add sta_classificationlocarno varchar2(200);alter table S_Hongkong_Patent_Description  add ori_classificationlocarno varchar2(200);alter table S_Hongkong_Patent_Description  add oth_classificationlocarno varchar2(200);

alter table S_Macao_Patent_Description     add ver_classificationlocarno varchar2(200);alter table S_Macao_Patent_Description     add sta_classificationlocarno varchar2(200);alter table S_Macao_Patent_Description     add ori_classificationlocarno varchar2(200);alter table S_Macao_Patent_Description     add oth_classificationlocarno varchar2(200);

alter table S_Eurasian_Patent_Description  add ver_classificationlocarno varchar2(200);alter table S_Eurasian_Patent_Description  add sta_classificationlocarno varchar2(200);alter table S_Eurasian_Patent_Description  add ori_classificationlocarno varchar2(200);alter table S_Eurasian_Patent_Description  add oth_classificationlocarno varchar2(200);

alter table S_Japan_Design_Patent          add ver_classificationlocarno varchar2(200);alter table S_Japan_Design_Patent          add sta_classificationlocarno varchar2(200);alter table S_Japan_Design_Patent          add ori_classificationlocarno varchar2(200);alter table S_Japan_Design_Patent          add oth_classificationlocarno varchar2(200);

alter table S_German_Design_Patent         add ver_classificationlocarno varchar2(200);alter table S_German_Design_Patent         add sta_classificationlocarno varchar2(200);alter table S_German_Design_Patent         add ori_classificationlocarno varchar2(200);alter table S_German_Design_Patent         add oth_classificationlocarno varchar2(200);

alter table S_French_Design_Patent         add ver_classificationlocarno varchar2(200);alter table S_French_Design_Patent         add sta_classificationlocarno varchar2(200);alter table S_French_Design_Patent         add ori_classificationlocarno varchar2(200);alter table S_French_Design_Patent         add oth_classificationlocarno varchar2(200);

alter table S_Russian_Design_Patent        add ver_classificationlocarno varchar2(200);alter table S_Russian_Design_Patent        add sta_classificationlocarno varchar2(200);alter table S_Russian_Design_Patent        add ori_classificationlocarno varchar2(200);alter table S_Russian_Design_Patent        add oth_classificationlocarno varchar2(200);

alter table S_Japan_Patent_Abstracts       add ver_classificationlocarno varchar2(200);alter table S_Japan_Patent_Abstracts       add sta_classificationlocarno varchar2(200);alter table S_Japan_Patent_Abstracts       add ori_classificationlocarno varchar2(200);alter table S_Japan_Patent_Abstracts       add oth_classificationlocarno varchar2(200);

alter table S_Korea_Patent_Abstracts       add ver_classificationlocarno varchar2(200);alter table S_Korea_Patent_Abstracts       add sta_classificationlocarno varchar2(200);alter table S_Korea_Patent_Abstracts       add ori_classificationlocarno varchar2(200);alter table S_Korea_Patent_Abstracts       add oth_classificationlocarno varchar2(200);

/**03**/
select * from S_CHINA_PATENT_STANDARDFULLTXT t order by t.import_time desc;
select count(*) from S_CHINA_PATENT_STANDARDFULLTXT t;

delete from S_CHINA_PATENT_STANDARDFULLTXT;

truncate table S_CHINA_PATENT_STANDARDFULLTXT;

select * from import_session i where i.batch_id = '01fd204b-62e9-4b15-b076-3d8968f88843' order by i.start_time desc;

select * from s_import_bath b where b.id = '3176a2eb-2351-4ba7-97be-dbf46ed5a621';

3176a2eb-2351-4ba7-97be-dbf46ed5a621
01fd204b-62e9-4b15-b076-3d8968f88843

delete from s_import_bath;
delete from import_session;


/**52**/
select * from S_KOREAN_PATENT_FULLTEXTCODE;
select count(*) from S_KOREAN_PATENT_FULLTEXTCODE;
delete from S_KOREAN_PATENT_FULLTEXTCODE


/**54**/
select * from S_BRITISH_PATENT_FULLTEXTCODE;
select count(*) from S_BRITISH_PATENT_FULLTEXTCODE;
delete from S_BRITISH_PATENT_FULLTEXTCODE




select * from S_MADRID_BRAND_ENTER_CHINA t where t.application_persion_infos is not null;


select t.*, t.rowid from S_CHINA_BRAND_LICENSE t where t.mark_cn_id= 'CN00000074774230' order by t.import_time desc;
select * from S_CHINA_LICENSE_PROCESSINFO;
delete from S_CHINA_BRAND_TRANSFER;
delete from S_CHINA_BRAND_TRANS_INFO;
select * from S_CHINA_BRAND_TRANSFER;
select * from S_CHINA_BRAND_TRANS_INFO;


delete from S_CHINA_BRAND_LICENSE;
delete from S_CHINA_LICENSE_PROCESSINFO;
select * from S_CHINA_BRAND_LICENSE;
select * from S_CHINA_LICENSE_PROCESSINFO;

select t.*, t.rowid from S_CHINA_WELLKNOWN_BRAND t where t.mark_cn_id= 'CN00000084603001';

delete from S_CHINA_WELLKNOWN_BRAND;

CN00000084603001

select * from S_China_Patent_TextCode t
select count(*) from S_CHINA_Patent_TextCode t;
"insert into S_CHINA_PATENT_TEXTCODE(APPL_TYPE,PUB_COUNTRY,PUB_NUMBER,PUB_DATE,PUB_KIND,GAZETTE_NUM,GAZETTE_DATE,INVENTION_TITLE,ABSTRACT,PATH_XML,EXIST_XML,ID) values (APPL_TYPE,PUB_COUNTRY,PUB_NUMBER,PUB_DATE,PUB_KIND,GAZETTE_NUM,GAZETTE_DATE,INVENTION_TITLE,ABSTRACT,PATH_XML,EXIST_XML,ID,'4b731e80-1f86-446d-b7ac-69a22be7e178')"




insert into 
S_CHINA_PATENT_TEXTCODE
(
APPL_TYPE,
PUB_COUNTRY,
PUB_NUMBER,
PUB_DATE,
PUB_KIND,
GAZETTE_NUM,
GAZETTE_DATE,
INVENTION_TITLE,
ABSTRACT,
PATH_XML,
EXIST_XML,
ID) 
values 
(
'外观专利',
'CN',
'303732996',TO_DATE('20160706', 'yyyymmdd'),'S','32-27',TO_DATE('20160706', 'yyyymmdd'),'织物块','1．本外观设计产品的名称：织物块。2．本外观设计产品的用途：本外观设计产品用于纺织纤维制品。3．本外观设计产品的设计要点：外观设计产品的图案。4.最能表明设计要点的图片为：设计1主视图。5.本外观设计申请包含2项相似外观设计，其中，设计1为基本设计。6.本外观设计要求保护色彩。','20160706\\201330279585.1\\201330279585NEW.XML','1','37534f39-46ca-4a42-89d3-4b933c960e7b')

insert into S_CHINA_PATENT_TEXTCODE(APPL_TYPE,PUB_COUNTRY,PUB_NUMBER,PUB_DATE,PUB_KIND,GAZETTE_NUM,GAZETTE_DATE,INVENTION_TITLE,ABSTRACT,PATH_XML,EXIST_XML,ID) values ('外观''专利','CN','303732996',TO_DATE('20160706', 'yyyymmdd'),'S','32-27',TO_DATE('20160706', 'yyyymmdd'),'织物块','1．本外观设计产品的名称：织物块。2．本外观设计产品的用途：本外观设计产品用于纺织纤维制品。3．本外观设计产品的设计要点：外观设计产品的图案。4.最能表明设计要点的图片为：设计1主视图。5.本外观设计申请包含2项相似外观设计，其中，设计1为基本设计。6.本外观设计要求保护色彩。','20160706\\201330279585.1\\201330279585NEW.XML','1','dff410-7eec-49a5-8705-be1e8a5024c3')

select count(*) from S_CHINA_PATENT_TEXTCODE;

select * from S_CHINA_PATENT_TEXTCODE t where t.invention_title like '一种%';

select * from S_CHINA_PATENT_TEXTCODE t where PUB_COUNTRY ='Kingdon';

select count(*) from S_CHINA_PATENT_TEXTCODE t where t.invention_title like '一种%';

select * from import_session;

select * from import_error;

select t.* from S_CHINA_PATENT_TEXTCODE t where rownum < 1000;

select t.* from S_CHINA_PATENT_TEXTCODE t where t.classification_ipcr is not null





select * from import_session;

select * from import_error;

alter table IMPORT_ERROR modify error_message varchar2(2000);

/*
truncate table S_CHINA_PATENT_TEXTCODE;
truncate table import_error
truncate table import_session
*/
select * from IMPORT_SESSION t where t.last_time  = 0  order by t.start_time desc;

delete from IMPORT_SESSION t where t.last_time  = 0  order by t.start_time desc;

select * from IMPORT_SESSION t order by t.start_time desc;
/*
delete from IMPORT_SESSION t where t.session_id <> 'f71dfc61-9e0c-48bf-818f-89d8657e4404'
*/


select * from s_China_Patent_Textimage t order by t.import_time desc;

select * from S_China_Patent_StandardFullTxt t;

select * from import_error where session_id = 'ecea912a-e321-406c-9f39-72e56dc6ff0a';


update import_session set tablename='s_China_Patent_Textimage' where data_res_type = '中国专利全文图像数据';

update import_session set tablename='S_CHINA_PATENT_TEXTCODE' where data_res_type = '中国专利全文代码化数据';





ecea912a-e321-406c-9f39-72e56dc6ff0a

select * from IMPORT_SESSION t where t.session_id = '93b2dfc8-9554-4ac7-9541-fb1bdb604da7' order by t.start_time desc;
select * from import_error where session_id = 'ecea912a-e321-406c-9f39-72e56dc6ff0a';
select * from s_China_Patent_Textimage t where t.import_session_id = 'ecea912a-e321-406c-9f39-72e56dc6ff0a';

select * from S_CHINA_PATENT_TEXTCODE t where t.import_session_id = 'ecea912a-e321-406c-9f39-72e56dc6ff0a';



select t.*, t.rowid from import_session t
delete from s_China_Patent_Textimage where import_session_id='93b2dfc8-9554-4ac7-9541-fb1bdb604da7'
select * from import_error;




select * from S_China_Patent_StandardFullTxt t where t.sta_pub_country is null;

delete from S_China_Patent_StandardFullTxt t where t.sta_pub_country is null;


select t.*, t.rowid from S_CHINA_PATENT_GAZETTE t order by t.import_time desc



select count(*) from S_CHINA_PATENT_GAZETTE t order by t.id asc


select t.*, t.rowid from S_Patent_Payment t;



select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t order by t.id asc;


update S_DATA_RESOURCE_TYPES_DETAIL t set t.table_name = 'N', t.implemented_import_logic = 'N', t.in_process = null where t.chinese_name like '%DI%';


alter table S_CHINA_PATENT_STAND_TEXTIMAGE add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add import_time DATE;
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add session_index NUMBER;


select t.*, t.rowid from S_CHINA_PATENT_STAND_TEXTIMAGE t order by t.import_time desc; 



select t.*,trim() t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t order by t.id asc;


select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t where t.id in (3,6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230) order by t.id asc;

update S_DATA_RESOURCE_TYPES_DETAIL t 
set t.table_name = upper(t.table_name)
t.in_process = null 
where t.id > 130 and t.id < 140;

update S_DATA_RESOURCE_TYPES_DETAIL t set t.chinese_name = trim(t.chinese_name);

select t.*, t.rowid from S_CHINA_PATENT_BIBLIOGRAPHIC t order by t.import_time desc; 

update S_DATA_RESOURCE_TYPES_DETAIL t set t.in_process = null;

select * from s_import_bath t order by t.start_time desc;

/*3*/  select t.*, t.rowid from S_CHINA_PATENT_STANDARDFULLTXT t order by t.import_time desc; 
/*6*/  select t.*, t.rowid from S_CHINA_PATENT_BIBLIOGRAPHIC t order by t.import_time desc; 
/*13*/  select t.*, t.rowid from S_CHINA_STANDARD_SIMPCITATION t order by t.import_time desc; 


/*50*/  select t.*, t.rowid from S_AMERICAN_PATENT_FULLTEXT t order by t.import_time desc; 
/*51*/  select t.*, t.rowid from S_EUROPEAN_PATENT_FULLTEXT t order by t.import_time desc; 
/*52*/  select t.*, t.rowid from S_KOREAN_PATENT_FULLTEXTCODE t order by t.import_time desc; 
/*53*/  select t.*, t.rowid from S_SWISS_PATENT_FULLTEXTCODE t order by t.import_time desc; 
/*54*/  select t.*, t.rowid from S_BRITISH_PATENT_FULLTEXTCODE t order by t.import_time desc; 
/*55*/  select t.*, t.rowid from S_JAPAN_PATENT_FULLTEXTCODE t order by t.import_time desc; 
/*103*/  select t.*, t.rowid from S_BELGIAN_PATENT_FULLTEXT t order by t.import_time desc; 
/*104*/  select t.*, t.rowid from S_AUSTRIA_PATENT_FULLTEXT t order by t.import_time desc; 
/*105*/  select t.*, t.rowid from S_SPANISH_PATENT_FULLTEXT t order by t.import_time desc; 



/*106*/  select t.*, t.rowid from S_POLAND_PATENT_DESCRIPTION t order by t.import_time desc; 
/*107*/  select t.*, t.rowid from S_ISRAEL_PATENT_DESCRIPTION t order by t.import_time desc; 
/*108*/  select t.*, t.rowid from S_SINGAPORE_PATENT_DESCRIPTION t order by t.import_time desc; 
/*113*/  select t.*, t.rowid from S_AMERICAN_DESIGN_PATENT t order by t.import_time desc; 
/*115*/  select t.*, t.rowid from S_KOREA_DESIGN_PATENT t order by t.import_time desc; 
/*127*/  select t.*, t.rowid from S_RUSSIAN_PATENT_ABSTRACTS t order by t.import_time desc; 




/*213*/  select t.*, t.rowid from S_CHINA_PATENT_ABSTRACTS t order by t.import_time desc; 
/*215*/  select t.*, t.rowid from S_WIPO_PATENT_DESCRIPTION t order by t.import_time desc; 
/*216*/  select t.*, t.rowid from S_CANADIAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*217*/  select t.*, t.rowid from S_RUSSIAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*218*/  select t.*, t.rowid from S_AUSTRALIAN_PATENT_FULLTEXT t order by t.import_time desc; 
/*219*/  select t.*, t.rowid from S_GERMAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*220*/  select t.*, t.rowid from S_FRENCH_PATENT_DESCRIPTION t order by t.import_time desc; 
/*221*/  select t.*, t.rowid from S_TAIWAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*222*/  select t.*, t.rowid from S_HONGKONG_PATENT_DESCRIPTION t order by t.import_time desc; 
/*223*/  select t.*, t.rowid from S_MACAO_PATENT_DESCRIPTION t order by t.import_time desc; 
/*224*/  select t.*, t.rowid from S_EURASIAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*225*/  select t.*, t.rowid from S_JAPAN_DESIGN_PATENT t order by t.import_time desc; 
/*226*/  select t.*, t.rowid from S_GERMAN_DESIGN_PATENT t order by t.import_time desc; 
/*227*/  select t.*, t.rowid from S_FRENCH_DESIGN_PATENT t order by t.import_time desc; 
/*228*/  select t.*, t.rowid from S_RUSSIAN_DESIGN_PATENT t order by t.import_time desc; 
/*229*/  select t.*, t.rowid from S_JAPAN_PATENT_ABSTRACTS t order by t.import_time desc; 
/*230*/  select t.*, t.rowid from S_KOREA_PATENT_ABSTRACTS t order by t.import_time desc; 




select t.*, t.rowid from import_session t where t.data_res_type like '加拿大专利著录项及全文数据（CA）（标准化）%';


delete from import_session t where t.data_res_type like '加拿大专利著录项及全文数据（CA）（标准化）%';


select * from s_import_bath;






select s.id from S_DATA_RESOURCE_TYPES_DETAIL s where s.implemented_import_logic='Y' order by s.id asc;



alter table S_CHINA_BRAND add import_session_id NVARCHAR2(100);
alter table S_CHINA_BRAND add import_time DATE;
alter table S_CHINA_BRAND add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_BRAND add file_path VARCHAR2(1000);
alter table S_CHINA_BRAND add session_index NUMBER;

select s.*, s.rowid from S_DATA_RESOURCE_TYPES_DETAIL s where s.implemented_import_logic='Y' order by s.id asc;

select s.*, s.rowid from S_CHINA_COURTCASE_PROCESS s where s.pn in ('293afd54e36295513cd57f72bc10ddc8','34253cd281307297798c8da7b3a7152a','39bca78e26bd3540f8f82635bf23f5cd','4fc086dabcae461f67285c9e2b448692') order by s.import_time desc

select s.*, s.rowid from S_DATA_RESOURCE_TYPES_DETAIL s order by s.id asc;

/*1-中国专利全文代码化数据*/  select t.*, t.rowid from S_CHINA_PATENT_TEXTCODE        t order by t.import_time desc; 
/*2-中国专利全文图像数据*/  select t.*, t.rowid from S_CHINA_PATENT_TEXTIMAGE       t order by t.import_time desc; 
/*3-中国专利标准化全文文本数据*/  select t.*, t.rowid from S_CHINA_PATENT_STANDARDFULLTXT t order by t.import_time desc; 
/*4-中国专利标准化全文图像数据*/  select t.*, t.rowid from S_CHINA_PATENT_STAND_TEXTIMAGE t order by t.import_time desc; 
/*5-中国专利公报数据*/  select t.*, t.rowid from S_CHINA_PATENT_GAZETTE         t order by t.import_time desc; 
/*6-中国专利著录项目与文摘数据*/  select t.*, t.rowid from S_CHINA_PATENT_BIBLIOGRAPHIC   t order by t.import_time desc; 
/*10-中国专利法律状态数据*/  select t.*, t.rowid from S_CHINA_PATENT_LAWSTATE        t order by t.import_time desc; 
/*11-中国专利法律状态变更翻译数据*/  select t.*, t.rowid from S_CHINA_PATENT_LAWSTATE_CHANGE t order by t.import_time desc; 
/*13-中国标准化简单引文数据*/  select t.*, t.rowid from S_CHINA_STANDARD_SIMPCITATION  t order by t.import_time desc; 
/*14-专利缴费数据*/  select t.*, t.rowid from S_PATENT_PAYMENT               t order by t.import_time desc; 
/*16-公司代码库*/  select t.*, t.rowid from S_COMPANY_CODE_LIBRARY         t order by t.import_time desc; 
/*17-区域代码库*/  select t.*, t.rowid from S_ZONE_CODE_BASE               t order by t.import_time desc; 
/*50-美国专利全文文本数据*/  select t.*, t.rowid from S_AMERICAN_PATENT_FULLTEXT     t order by t.import_time desc; 
/*51-欧专局专利全文文本数据*/  select t.*, t.rowid from S_EUROPEAN_PATENT_FULLTEXT     t order by t.import_time desc; 
/*52-韩国专利全文代码化数据*/  select t.*, t.rowid from S_KOREAN_PATENT_FULLTEXTCODE   t order by t.import_time desc; 
/*53-瑞士专利全文代码化数据*/  select t.*, t.rowid from S_SWISS_PATENT_FULLTEXTCODE    t order by t.import_time desc; 
/*54-英国专利全文代码化数据*/  select t.*, t.rowid from S_BRITISH_PATENT_FULLTEXTCODE  t order by t.import_time desc; 
/*55-日本专利全文代码化数据*/  select t.*, t.rowid from S_JAPAN_PATENT_FULLTEXTCODE    t order by t.import_time desc; 
/*76-中国专利生物序列数据（DI）*/  select t.*, t.rowid from S_CHINA_PATENT_BIOLOGICALSEQ   t order by t.import_time desc; 
/*82-专利同族数据（DI）*/  select t.*, t.rowid from S_PATENT_FAMILY                t order by t.import_time desc; 
/*83-全球专利引文数据（DI）*/  select t.*, t.rowid from S_GLOBAL_PATENT_CITATION       t order by t.import_time desc; 
/*84-中国专利费用信息数据（DI）*/  select t.*, t.rowid from S_CHINA_PATENT_FEEINFORMATION  t order by t.import_time desc; 
/*85-中国专利通知书数据（DI）*/  select t.*, t.rowid from S_CHINA_PATENT_NOTICES         t order by t.import_time desc; 
/*86-中国法律状态标引库（DI）*/  select t.*, t.rowid from S_CHINA_LAWSTATE_INDEXINGLIB   t order by t.import_time desc; 
/*88-世界法律状态数据*/  select t.*, t.rowid from S_WORLD_LEGAL_STATUS           t order by t.import_time desc; 
/*90-DOCDB数据*/  select t.*, t.rowid from S_DOCDB                        t order by t.import_time desc; 
/*103-比利时专利全文数据*/  select t.*, t.rowid from S_BELGIAN_PATENT_FULLTEXT      t order by t.import_time desc; 
/*104-奥地利专利全文数据*/  select t.*, t.rowid from S_AUSTRIA_PATENT_FULLTEXT      t order by t.import_time desc; 
/*105-西班牙专利全文数据*/  select t.*, t.rowid from S_SPANISH_PATENT_FULLTEXT      t order by t.import_time desc; 
/*106-波兰专利著录项及全文数据*/  select t.*, t.rowid from S_POLAND_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*107-以色列专利著录项及全文数据*/  select t.*, t.rowid from S_ISRAEL_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*108-新加坡专利著录项及全文数据*/  select t.*, t.rowid from S_SINGAPORE_PATENT_DESCRIPTION t order by t.import_time desc; 
/*113-美国外观设计专利数据*/  select t.*, t.rowid from S_AMERICAN_DESIGN_PATENT       t order by t.import_time desc; 
/*115-韩国外观设计专利数据*/  select t.*, t.rowid from S_KOREA_DESIGN_PATENT          t order by t.import_time desc; 
/*121-中国专利全文数据PDF（DI）*/  select t.*, t.rowid from S_CHINA_PATENT_FULLTEXT_PDF    t order by t.import_time desc; 
/*122-国外专利全文数据PDF（DI）*/  select t.*, t.rowid from S_FOREIGN_PATENT_FULLTEXT_PDF  t order by t.import_time desc; 
/*127-俄罗斯专利文摘英文翻译数据*/  select t.*, t.rowid from S_RUSSIAN_PATENT_ABSTRACTS     t order by t.import_time desc; 


/*132-中国商标*/  select t.*, t.rowid from S_CHINA_BRAND                   t order by t.import_time desc; 
/*133-中国商标许可数据*/  select t.*, t.rowid from S_CHINA_BRAND_LICENSE           t order by t.import_time desc; 
/*134-中国商标转让数据*/  select t.*, t.rowid from S_CHINA_BRAND_TRANSFER          t order by t.import_time desc; 
/*136-马德里商标进入中国*/  select t.*, t.rowid from S_MADRID_BRAND_ENTER_CHINA      t order by t.import_time desc; 
/*137-中国驰名商标数据*/  select t.*, t.rowid from S_CHINA_WELLKNOWN_BRAND         t order by t.import_time desc; 
/*138-美国申请商标*/  select t.*, t.rowid from S_AMERICA_APPLY_BRAND           t order by t.import_time desc; 
/*139-美国转让商标*/  select t.*, t.rowid from S_AMERICA_TRANSFER_BRAND        t order by t.import_time desc; 
/*140-美国审判商标*/  select t.*, t.rowid from S_AMERICA_TRIAL_BRAND           t order by t.import_time desc;

 
/*147-社内外知识产权图书题录数据*/  select t.*, t.rowid from S_COMMUNITY_INTELLECTUALRECORD  t order by t.import_time desc; 
/*148-民国书*/  select t.*, t.rowid from S_CHINA_BOOK                    t order by t.import_time desc; 
/*153-中外期刊的著录项目与文摘数据*/  select t.*, t.rowid from S_JOURNAL_PROJECT_ABSTRACT      t order by t.import_time desc; 
/*162-中国法院判例初加工数据*/  select t.*, t.rowid from S_CHINA_COURTCASE_PROCESS       t order by t.import_time desc; 
/*168-中国商标分类数据*/  select t.*, t.rowid from S_CHINA_BRAND_CLASSIFICATION    t order by t.import_time desc; 
/*169-美国商标图形分类数据*/  select t.*, t.rowid from S_AMERICAN_BRAND_GRAPHCLASSIFY  t order by t.import_time desc; 
/*170-美国商标美国分类数据*/  select t.*, t.rowid from S_AMERICAN_BRAND_USCLASSIFY     t order by t.import_time desc; 
/*172-马德里商标购买数据*/  select t.*, t.rowid from S_MADRID_BRAND_PURCHASE     t order by t.import_time desc; 
/*180-中国专利代理知识产权法律法规加工数据*/  select t.*, t.rowid from S_CHINA_PATENT_LAWSPROCESS      t order by t.import_time desc; 
/*183-中国集成电路布图公告及事务数据*/  select t.*, t.rowid from S_CHINA_CIRCUITLAYOUT           t order by t.import_time desc; 
/*184-中国知识产权海关备案数据*/  select t.*, t.rowid from S_CHINA_CUSTOMS_RECORD         t order by t.import_time desc; 
/*186-国外专利生物序列加工成品数据*/  select t.*, t.rowid from S_FOREIGN_PATENT_SEQUENCE      t order by t.import_time desc; 
/*194-中国专利复审数据*/  select t.*, t.rowid from S_CHINA_PATENT_REVIEW          t order by t.import_time desc; 
/*195-中国专利无效数据*/  select t.*, t.rowid from S_CHINA_PATENT_INVALID         t order by t.import_time desc; 
/*196-中国专利的判决书数据*/  select t.*, t.rowid from S_CHINA_PATENT_JUDGMENT        t order by t.import_time desc; 
/*209-中国生物序列深加工数据*/  select t.*, t.rowid from S_CHINA_BIOLOGICAL_PROCESS     t order by t.import_time desc; 
/*210-中国中药专利翻译数据*/  select t.*, t.rowid from S_CHINA_MEDICINE_PATENT_TRANS  t order by t.import_time desc; 
/*211-中国化学药物专利深加工数据*/  select t.*, t.rowid from S_CHINA_PHARMACEUTICAL_PATENT  t order by t.import_time desc; 
/*212-中国中药专利深加工数据*/  select t.*, t.rowid from S_CHINA_MEDICINE_PATENT_HANDLE t order by t.import_time desc; 
/*213-中国专利摘要英文翻译数据*/  select t.*, t.rowid from S_CHINA_PATENT_ABSTRACTS       t order by t.import_time desc; 

/*215-国际知识产权组织专利著录项及全文数据*/  select t.*, t.rowid from S_WIPO_PATENT_DESCRIPTION      t order by t.import_time desc; 
/*216-加拿大专利著录项及全文数据*/  select t.*, t.rowid from S_CANADIAN_PATENT_DESCRIPTION  t order by t.import_time desc; 
/*217-俄罗斯专利著录项及全文数据*/  select t.*, t.rowid from S_RUSSIAN_PATENT_DESCRIPTION   t order by t.import_time desc; 
/*218-澳大利亚专利全文文本数据*/  select t.*, t.rowid from S_AUSTRALIAN_PATENT_FULLTEXT   t order by t.import_time desc; 
/*219-德国专利著录项及全文数据*/  select t.*, t.rowid from S_GERMAN_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*220-法国专利著录项及全文数据*/  select t.*, t.rowid from S_FRENCH_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*221-台湾专利著录项及全文数据*/  select t.*, t.rowid from S_TAIWAN_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*222-香港专利著录项数据*/  select t.*, t.rowid from S_HONGKONG_PATENT_DESCRIPTION  t order by t.import_time desc; 
/*223-澳门专利著录项数据*/  select t.*, t.rowid from S_MACAO_PATENT_DESCRIPTION     t order by t.import_time desc; 
/*224-欧亚组织专利著录项及全文数据*/  select t.*, t.rowid from S_EURASIAN_PATENT_DESCRIPTION  t order by t.import_time desc; 
/*225-日本外观设计专利数据*/  select t.*, t.rowid from S_JAPAN_DESIGN_PATENT          t order by t.import_time desc; 
/*226-德国外观设计专利数据*/  select t.*, t.rowid from S_GERMAN_DESIGN_PATENT         t order by t.import_time desc; 
/*227-法国外观设计专利数据*/  select t.*, t.rowid from S_FRENCH_DESIGN_PATENT         t order by t.import_time desc; 
/*228-俄罗斯外观设计专利数据*/  select t.*, t.rowid from S_RUSSIAN_DESIGN_PATENT        t order by t.import_time desc; 
/*229-日本专利文摘英文翻译数据*/  select t.*, t.rowid from S_JAPAN_PATENT_ABSTRACTS       t order by t.import_time desc; 
/*230-韩国专利文摘英文翻译数据*/  select t.*, t.rowid from S_KOREA_PATENT_ABSTRACTS       t order by t.import_time desc; 

select s.*, s.rowid from S_DATA_RESOURCE_TYPES_DETAIL s order by s.id asc;

update S_DATA_RESOURCE_TYPES_DETAIL s set s.implemented_import_logic = null;


update S_DATA_RESOURCE_TYPES_DETAIL s set s.implemented_import_logic = 'Y' where s.id in (1,2,3,4,5,6,8,9,10,11,13,14,50,51,52,53,54,55,76,77,78,79,103,104,105,106,107,108,121,132,133,134,136,137,138,139,153,162,168,169,170,172,180,186,194,196,209,210,211,212,213,214,215,216,217,218,219,220,223,224,225,226,228)

select s.*, s.rowid from S_DATA_RESOURCE_TYPES_DETAIL s where s.implemented_import_logic is null order by s.id asc;

select count(*) from S_DATA_RESOURCE_TYPES_DETAIL s where s.implemented_import_logic='Y' order by s.id asc;

select * from S_BIOLOGICAL_SEQ;




 from table S_DATA_RESOURCE_TYPES_DETAIL


update S_DATA_RESOURCE_TYPES_DETAIL s set s.chinese_name='' where id = 1












drop user drmsdev cascade;



































































