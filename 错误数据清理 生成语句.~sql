----生成错误数据清理语句块 所有
select
'



----'||dtl.id||' '||dtl.chinese_name || decode(dtl.sta_doc, 1, ' ***可用, 谨慎执行', '***尚不可用,千万不要执行本语句块') || '
------对应表查询
select * from '||dtl.table_name||' where rownum < 100;
------更新doc_file_name 字段
update  '||dtl.table_name||'  t set doc_File_Name = decode(instr(t.archive_inner_path, ''/'', 1, 1), 0,substr(t.archive_inner_path, instr(t.archive_inner_path, ''\'', -1, 1) + 1) , substr(t.archive_inner_path, instr(t.archive_inner_path, ''/'', -1, 1) + 1));
commit;

------更新批次信息 
update '||dtl.table_name||' doc set doc.batch = decode(instr(doc.file_path, ''\''), 0, substr(doc.file_path, instr(doc.file_path, ''/'', -1, 2) + 1, instr(doc.file_path, ''/'', -1, 1) - instr(doc.file_path, ''/'', -1, 2) -1), substr(doc.file_path, instr(doc.file_path, ''\'', -1, 2) + 1, instr(doc.file_path, ''\'', -1, 1) - instr(doc.file_path, ''\'', -1, 2) -1));
commit;


declare
 v_count number;
 v_data_count number;
 v_immidiate_sql varchar2(4000);
begin
  select count(1) into v_data_count
  from '||dtl.table_name||
  decode(dtl.sta_doc, 1, 
  '
  where  56 <> length(doc_file_name) or ori_pub_date is null;'
  , 
  '
  where 1 = 1;')
  ||
  '
  
  dbms_output.put_line(''v_data_count = '' || v_data_count);  

  select count(1) into v_count
  from user_tables ut
  where ut.TABLE_NAME = ''S_ERROR_DOC_BACKUP_'||case
  when length(to_char(dtl.id)) < 3
    then lpad(to_char(dtl.id), 3, '0')
      else replace(to_char(dtl.id), '.', '')
end||''';


  if v_count = 0
  then
    v_immidiate_sql := ''create table S_ERROR_DOC_BACKUP_'||case
  when length(to_char(dtl.id)) < 3
    then lpad(to_char(dtl.id), 3, '0')
      else replace(to_char(dtl.id), '.', '')
end||' as select * from '||dtl.table_name||  decode(dtl.sta_doc, 1, ' where 56 <> length(doc_file_name) or ori_pub_date is null'';', ' where 1 = 1 '';')||'
  else
    v_immidiate_sql := ''insert into S_ERROR_DOC_BACKUP_'||case
  when length(to_char(dtl.id)) < 3
    then lpad(to_char(dtl.id), 3, '0')
      else replace(to_char(dtl.id), '.', '')
end||' select * from '||dtl.table_name|| decode(dtl.sta_doc, 1, ' where 56 <> length(doc_file_name) or ori_pub_date is null'';', ' where 1 = 1 '';')||'
  end if;
  execute immediate v_immidiate_sql;
  dbms_output.put_line(''v_immidiate_sql = '' || v_immidiate_sql);
  delete from '||dtl.table_name|| decode(dtl.sta_doc, 1, ' where 56 <> length(doc_file_name) or ori_pub_date is null;', ' where 1 = 1  ;')||'
  commit;
exception
  when others then
    rollback;
end;
/'  
as SQLEXPR
from
(select dtli.*, case (select 1 from user_tab_columns tc
where tc.TABLE_NAME = dtli.table_name and tc.COLUMN_NAME = upper('ori_pub_date')) when 1 then 1 else 0 end as sta_doc  from s_data_resource_types_detail dtli 
) dtl
where dtl.implemented_import_logic = 'Y'
order by dtl.is_pat desc,  dtl.id
