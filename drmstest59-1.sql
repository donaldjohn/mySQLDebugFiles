select * from S_FOREIGN_PATENT_SEQUENCE;


select * from S_BIOLOGICAL_SEQ;







select * from S_CHINA_PATENT_TEXTIMAGE where rownum < 100;



----3 中国专利标准化全文文本数据 ***可用
declare
 v_count number;
 v_data_count number;
 v_immidiate_sql varchar2(4000);
begin
  select count(1) into v_data_count
  from S_CHINA_PATENT_STANDARDFULLTXT
  where  56 <> length(doc_file_name) or ori_pub_date is null;
   dbms_output.put_line('v_data_count = ' || v_data_count);
  
  select count(1) into v_count
  from user_tables ut
  where ut.TABLE_NAME = 'S_ERROR_DOC_BACKUP_003';
  
  
  if v_data_count > 0
    then       
        if v_count = 0
        then
          v_immidiate_sql := 'create table S_ERROR_DOC_BACKUP_003 as select * from S_CHINA_PATENT_STANDARDFULLTXT where 56 <> length(doc_file_name) or ori_pub_date is null';
        else
          v_immidiate_sql := 'insert into S_ERROR_DOC_BACKUP_003 select * from S_CHINA_PATENT_STANDARDFULLTXT where 56 <> length(doc_file_name) or ori_pub_date is null';
        end if;
        execute immediate v_immidiate_sql;
        dbms_output.put_line('v_immidiate_sql = ' || v_immidiate_sql);
        delete from S_CHINA_PATENT_STANDARDFULLTXT where 56 <> length(doc_file_name) or ori_pub_date is null;
        commit;
    else
       dbms_output.put_line('Nothing to clear!');
  end if;
exception
  when others then
    rollback;
end
;





































select * from MV_NP_IDX_INFO_STAT_BY_BATCH  where data_res = '中国商标';








update S_MADRID_BRAND_PURCHASE doc set doc.batch = 
case instr(doc.file_path, '\') > 0 
  then 
    substr(doc.file_path, instr(doc.file_path, '\', -1, 2) + 1, instr(doc.file_path, '\', -1, 1) - instr(doc.file_path, '\', -1, 2) -1) 
  else substr(doc.file_path, instr(doc.file_path, '/', -1, 2) + 1, instr(doc.file_path, '/', -1, 1) - instr(doc.file_path, '/', -1, 2) -1) 
end;


//更新数据批次信息
update S_MADRID_BRAND_PURCHASE doc set doc.batch = decode(instr(doc.file_path, '\'), 0, substr(doc.file_path, instr(doc.file_path, '/', -1, 2) + 1, instr(doc.file_path, '/', -1, 1) - instr(doc.file_path, '/', -1, 2) -1), substr(doc.file_path, instr(doc.file_path, '\', -1, 2) + 1, instr(doc.file_path, '\', -1, 1) - instr(doc.file_path, '\', -1, 2) -1));




update S_MADRID_BRAND_PURCHASE doc set doc.batch = substr(doc.file_path, instr(doc.file_path, '\', -1, 2) + 1, instr(doc.file_path, '\', -1, 1) - instr(doc.file_path, '\', -1, 2) -1);



select * from MV_IDX_INFO_STAT_BY_PUBDATE where data_res = '';



create index ix_file_path_214 on s_docdb(file_path);

select '/**'||dtl.id||'**/ create index ix_file_path_'||dtl.id||' on '||dtl.table_name||'(file_path);' from s_data_resource_types_detail dtl
order by dtl.id
;













select * from s_data_resource_types_detail dtl where dtl.id = 214;
DOCDB数据（标准化）


select * from import_session s where s.completed = 'N' and s.data_res_type='DOCDB数据（标准化）';
select * from s_docdb dc where dc.


select count(1) from s_index_file_detail;

select dtl.id, 
'PARTITION par_'||dtl.id||' VALUES ('''||dtl.chinese_name||''')'||chr(10)||
'  ('||chr(10)||chr(10)||
'  SUBPARTITION spar_'||dtl.id||'_default VALUES (DEFAULT)'||chr(10)||
'  ),'
from s_data_resource_types_detail dtl where dtl.id not in (209.1, 209.2)
order by dtl.id asc;



------查看非专利标准化索引 详细信息
select * from s_index_file_detail idl where idl.data_res = '中国标准化简单引文数据';-- 13
select * from S_CHINA_STANDARD_SIMPCITATION;--13


select * from s_index_file_detail idl where idl.data_res = '世界专利法律状态（INPADOC）（标准化）';-- 231
select doc.prspublicationdate from S_WORLD_PATENT_LAWSTATUS doc;--231


----232
select * from s_index_file_detail idl where idl.data_res = '日本引文(STD_JP_CIT)（标准化）';
select (doc.ori_app_country || doc.ori_app_number),doc.sta_app_number, doc.sta_app_date, (doc.sta_pub_country || doc.sta_pub_number || doc.sta_pub_kind) from S_STD_JP_CIT doc;

--233
select * from s_index_file_detail idl where idl.data_res = '韩国引文(STD_KR_CIT)（标准化）'; 
select * from S_STD_KR_CIT;--233

--234
select * from s_index_file_detail idl where idl.data_res = '韩国法律状态数据(STD_KR_PRS)（标准化）';
select * from s_index_file_detail idl where idl.data_res = 'abaccd';
select * from S_STD_KR_PRS;


-- 132
select distinct doclist_topic, idl.doclist_pn from s_np_index_file_detail idl where idl.data_res = '中国商标';
select * from s_np_index_file_detail idl where idl.data_res = '中国商标';
select * from s_np_index_file_detail idl where idl.data_res = '中国商标';
select * from s_np_index_file_detail idl where idl.data_res = '中国商标';
select * from S_CHINA_BRAND;--132
select doc.mark_cn_id from S_CHINA_BRAND doc;--132
select  from S_CHINA_BRAND;--132
select * from S_CHINA_BRAND;--132

select * from s_np_index_file_detail idl where idl.data_res = '中国商标许可数据';-- 133
select * from S_CHINA_BRAND_LICENSE;--133
select * from s_np_index_file_detail idl where idl.data_res = '中国商标转让数据';-- 134
select * from S_CHINA_BRAND_TRANSFER;--134
select * from s_np_index_file_detail idl where idl.data_res = '马德里商标进入中国';-- 136
select * from S_MADRID_BRAND_ENTER_CHINA;--136

select * from s_np_index_file_detail idl where idl.data_res = '中国驰名商标数据';-- 137
select * from S_CHINA_WELLKNOWN_BRAND;--137

select * from s_np_index_file_detail idl where idl.data_res = '美国申请商标';-- 138
select serial_number from S_AMERICA_APPLY_BRAND;--138


select * from s_np_index_file_detail idl where idl.data_res = '美国转让商标';-- 139
select * from S_AMERICA_TRANSFER_BRAND;--139
select * from s_np_index_file_detail idl where idl.data_res = '中外期刊的著录项目与文摘数据';-- 153
select * from S_JOURNAL_PROJECT_ABSTRACT;--153
select * from s_np_index_file_detail idl where idl.data_res = '中国法院判例初加工数据';-- 162
select * from S_CHINA_COURTCASE_PROCESS;--162
select * from s_np_index_file_detail idl where idl.data_res = '马德里商标购买数据';-- 172
select * from S_MADRID_BRAND_PURCHASE;--172
select * from s_np_index_file_detail idl where idl.data_res = '中国专利代理知识产权法律法规加工数据';-- 180
select * from S_CHINA_PATENT_LAWSPROCESS;--180




select 
count(1)
from
s_index_file_detail id
where
id.data_res = '瑞士专利全文代码化数据（标准化）'




select 
count(1)
from
s_index_file_detail id
where
id.data_res = '欧专局专利全文文本数据（标准化）'





select * from S_SWISS_PATENT_FULLTEXTCODE where doc_file_name is null;

select * from S_EUROPEAN_PATENT_FULLTEXT where doc_file_name is null;







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









---
(
select 
pubdate, count(1) ds_pat_cnt
from
(
select
to_char(s.ori_pub_date, 'yyyyMMdd') pubdate,
s.doc_file_name
from
S_CHINA_PATENT_STANDARDFULLTXT s
group by s.ori_pub_date, s.doc_file_name
having count(1) = 1
) ds_Doc
)
;













(
select 
pub_date, count(1) dis_pnt_cnts
from
(
select
id.pub_date, id.doc_file_name
from
s_index_file_detail id
where 
id.data_res='中国专利标准化全文文本数据'
group by id.pub_date, id.doc_file_name
having count(1) = 1 
)
group by pub_date
)
;


















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



select 
(select sum(s.doclist_count) from s_index_file_info s where s.fully_imported = 'Y') if_pat_cnt, 
(select count(*) from s_index_file_detail s) id_pat_cnt
from dual
;

select count










select
doc_file_name
from
(
select
sta.ori_pub_date, sta.doc_file_name, count(1)
from S_CHINA_PATENT_STANDARDFULLTXT sta
group by sta.ori_pub_date, sta.doc_file_name
having count(1) > 1
)
group by doc_file_name
having count(1) > 1
;





















select * from 
s_index_file_detail
where
doc_file_name
in
(
select
d.doc_file_name
from
s_index_file_detail d
where d.data_res='中国专利标准化全文文本数据'
group by d.doc_file_name
having count(1) > 1
)
order by doc_file_name;
































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



select 
d.id, to_char(d.ori_pub_date, 'yyyyMMdd') pub_date, d.file_path, d.archive_inner_path, d.doc_file_name 
from S_CHINA_PATENT_STANDARDFULLTXT d
where 
56 = length(d.doc_file_name)
and
d.ori_pub_number is not null
and
not exists
(
select 1 from s_index_file_detail i
where d.doc_file_name = i.doc_file_name
)
order by d.ori_pub_date, d.doc_file_name



--获取003多余数据信息
drop materialized view mv_extra_doc_info_003;

create materialized view mv_extra_doc_info_003
as
select 
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name
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



























select 
to_char(s.ori_pub_date, 'yyyyMMdd'), count(distinct s.doc_file_name)
from
S_CHINA_PATENT_STANDARDFULLTXT s
where 56 = length(s.doc_file_name) and s.ori_pub_number is not null
group by grouping sets (s.ori_pub_date);















select 
t.doc_file_name "XML文件名", t.file_path "压缩包路径",t.archive_inner_path "压缩包内路径"
from 
S_CHINA_PATENT_STANDARDFULLTXT t
where
length(t.doc_file_name) = 56
and
t.sta_app_number is null;

















select 
i.date_publication ,i.pub_kind, i.pat_cnt, i.doclist_count, i.data_res "数据类型", i.file_path "索引路径"
from 
s_index_file_info i
where
i.pat_cnt <> i.doclist_count
and
i.data_res = '中国专利标准化全文文本数据'
order by i.date_publication






select 
count(distinct t.doc_file_name)
from
s_index_file_detail t
where 
length(t.doc_file_name) = 56
and
t.sta_app_number is not null
and
t.doc_file_name = some
(
select 
d.doc_file_name
from 
S_CHINA_PATENT_STANDARDFULLTXT d
);







select 
t.id,
t.chinese_name,
'alter table '
||
t.table_name
||
' add doc_File_Name varchar2(500);',
'update '
||
t.table_name
||
' t set doc_File_Name = substr(t.archive_inner_path, instr(t.archive_inner_path, ''/'', -1, 1) + 1); '
from 
s_data_resource_types_detail t;









select length('INDEX-CN-19851010-U-001.XML') from dual;

select s.* from S_CHINA_PATENT_STANDARDFULLTXT s order by s.import_time desc;

select * from S_CHINA_PATENT_STANDARDFULLTXT m
where m.archive_inner_path in
(
select s.archive_inner_path from S_CHINA_PATENT_STANDARDFULLTXT s group by s.archive_inner_path having count(*) >1
)
order by m.archive_inner_path, m.import_time
;























select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION GRANT\%';

select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INDUSTRIAL DESIGN\%';

select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR UTILITY MODEL\%';

select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION PUBLICATION\%';

select count(*) from import_session s where s.zip_or_dir_path like  '\\192.168.3.77\vol17\中国专利全文代码化数据\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION PUBLICATION\%';
























insert into S_MADRID_BRAND_ENTER_CHINA 
       select * from S_MADRID_BRAND_ENTER_CHINA_A e where e.import_session_id 
       in
(
select s.session_id from import_session s 
where 
s.batch_id in 
(
'0ef9b350-8375-4e59-8a60-2b4c3ff38931','d9cb4661-4092-4ab5-a618-633d9860666f','c5dbdc98-89b9-4cce-ac5a-4e780ec7e9d8','eaa71e42-5d1f-4210-94b8-fd0bd5036a2f','6c9ffa07-0e49-4ad5-8318-9ce9ccbf5ec9','5a25208d-9ccd-4623-8cf0-f4e9d9c50fbf','9fb2d412-cd65-4612-85be-27c7c90af47c','c9881e54-7603-4076-b402-6728acc0024b','4e7fd6ce-c32d-465f-b5fd-af0a618b895b','9e26d459-aeb7-44cf-a196-3c40a5138c37','55ae7139-bfba-485b-aa09-8021848d3e23','2c57045f-49f8-4102-a34c-3cdb3b165d56')
)  
;
commit;


select count(*) from S_MADRID_BRAND_ENTER_CHINA;
select count(*) from S_MADRID_BRAND_ENTER_CHINA_A;



select a.mark_cn_id, a.file_path, a.archive_inner_path from S_MADRID_BRAND_ENTER_CHINA a order by a.mark_cn_id;














S_MADRID_BRAND_ENTER_CHINA


S_MADRID_BRAND_ENTER_CHINA_A

truncate table S_MADRID_BRAND_ENTER_CHINA;



























select * from s_import_bath b
where b.id
in
(
select b.id from S_MADRID_BRAND_ENTER_CHINA t left join import_session s on t.import_session_id = s.session_id left join s_import_bath b on s.batch_id = b.id
)


select * from import_session s where s.batch_id 
in 
(
  select b.id from S_MADRID_BRAND_ENTER_CHINA t left join import_session s on t.import_session_id = s.session_id left join s_import_bath b on s.batch_id = b.id
)





select * from s_import_bath b where b.res_type = '马德里商标进入中国' order by b.dir_path;


59ff474d-4f0d-4354-a942-91225caa75b4
0ef9b350-8375-4e59-8a60-2b4c3ff38931

select * from S_MADRID_BRAND_ENTER_CHINA e where e.import_session_id 
in
(
select s.session_id from import_session s 
where 
s.batch_id = '0ef9b350-8375-4e59-8a60-2b4c3ff38931'
) 


select * from S_MADRID_BRAND_ENTER_CHINA x
where
x.mark_cn_id
in
(
select e.mark_cn_id from S_MADRID_BRAND_ENTER_CHINA_A e where e.import_session_id 
in
(
select s.session_id from import_session s 
where 
s.batch_id = '0ef9b350-8375-4e59-8a60-2b4c3ff38931'
)
) 




select e.mark_cn_id from S_MADRID_BRAND_ENTER_CHINA e where e.import_session_id 
in
(
select s.session_id from import_session s 
where 
s.batch_id = '0ef9b350-8375-4e59-8a60-2b4c3ff38931'
)





select a.mark_cn_id, b.mark_cn_id from S_MADRID_BRAND_ENTER_CHINA a
join
S_MADRID_BRAND_ENTER_CHINA_A b
on 
a.mark_cn_id = b.mark_cn_id








select * from S_MADRID_BRAND_ENTER_CHINA x
where
x.mark_cn_id
in
(
select e.mark_cn_id from S_MADRID_BRAND_ENTER_CHINA_A e where e.import_session_id 
in
(
select s.session_id from import_session s 
where 
s.batch_id = '0ef9b350-8375-4e59-8a60-2b4c3ff38931'
)
) 




























select sum(s.total_item) from import_session s 
where 
s.batch_id = '59ff474d-4f0d-4354-a942-91225caa75b4'












select * from 
(
select * from S_MADRID_BRAND_ENTER_CHINA
where 
 mark_cn_id
       in
       (
         select mark_cn_id, max(import_time)
         from 
         S_MADRID_BRAND_ENTER_CHINA 
         group by 
         mark_cn_id 
         having count(mark_cn_id) >1
         )
)
t

            


select * from
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
         order by mark_cn_id) t
         left join S_MADRID_BRAND_ENTER_CHINA d
         on t.mark_cn_id = d.mark_cn_id and d.import_time = t.import_time
         )
order by o.mark_cn_id















         (select mark_cn_id, max(import_time)
         from 
         S_MADRID_BRAND_ENTER_CHINA 
         group by 
         mark_cn_id 
         having count(mark_cn_id) >1)

select * from S_MADRID_BRAND_ENTER_CHINA where 









select * from S_MADRID_BRAND_ENTER_CHINA_A
where 
 mark_cn_id 
 in 
       (
         select mark_cn_id 
         from 
         S_MADRID_BRAND_ENTER_CHINA 
         group by 
         mark_cn_id 
         having count(mark_cn_id) >1
         )
order by import_time;         




drop table zcgdebug;
commit;



select count(distinct t.mark_cn_id) from S_MADRID_BRAND_ENTER_CHINA t;
620070

select count(distinct t.mark_cn_id) from S_MADRID_BRAND_ENTER_CHINA_A t;
620070

select count(*) from S_MADRID_BRAND_ENTER_CHINA t;
select count(*) from S_MADRID_BRAND_ENTER_CHINA_A t;



















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



select * from S_MADRID_BRAND_ENTER_CHINA
where 
 mark_cn_id 
 in 
       (
         select mark_cn_id 
         from 
         S_MADRID_BRAND_ENTER_CHINA 
         group by 
         mark_cn_id 
         having count(mark_cn_id) >1
         ))     
 and 
 import_time
 not in 
       (
       select max(import_time) 
       from 
       S_MADRID_BRAND_ENTER_CHINA 
       group by 
       mark_cn_id 
       having count(mark_cn_id) >1)
        
order by d.mark_cn_id;





select * from S_MADRID_BRAND_ENTER_CHINA d 
where 
 d.mark_cn_id 
 in 
       (
         select mark_cn_id 
         from 
         S_MADRID_BRAND_ENTER_CHINA 
         group by 
         mark_cn_id,import_time 
         having count(*) >1
         ) 
       
       
       
       
       
       


select * from S_MADRID_BRAND_ENTER_CHINA d where d.mark_cn_id in     (select t.mark_cn_id from S_MADRID_BRAND_ENTER_CHINA t where t.mark_cn_id in(select c.mark_cn_id from S_MADRID_BRAND_ENTER_CHINA c group by c.mark_cn_id having count(c.mark_cn_id) >1)) order by d.mark_cn_id;
select * from S_MADRID_BRAND_ENTER_CHINA d where d.mark_cn_id not in (select t.mark_cn_id from S_MADRID_BRAND_ENTER_CHINA t where t.import_time not in (select max(c.import_time) from S_MADRID_BRAND_ENTER_CHINA c group by c.mark_cn_id having count(c.mark_cn_id) >1)) order by d.mark_cn_id;

CN00000G13010303
select * from S_MADRID_BRAND_ENTER_CHINA d where d.mark_cn_id = 'CN00000G13010303' and d.mark_cn_id not in (select t.mark_cn_id from S_MADRID_BRAND_ENTER_CHINA t where t.import_time not in (select max(c.import_time) from S_MADRID_BRAND_ENTER_CHINA c group by c.mark_cn_id having count(c.mark_cn_id) >1));
