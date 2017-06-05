
-----非专利类型 列表 132,133,134,136,137,138,139,153,162,172,180
-----生成刷新视图语句
select
dtd.id as id, dtd.chinese_name, chr(10) || chr(10) || chr(10) || '----**'||dtd.id||'   '||dtd.chinese_name||'**
----查询索引表
select * from '||case dtd.is_pat when 'Y' then 's_index_file_detail ' else 's_np_index_file_detail' end||' doc where doc.data_res = '''||dtd.chinese_name||''';

----更新标准核验索引数据 doc_file_name字段 解决doc_file字段分隔符为反斜杠时不能正确解析Doc_file_name的问题
update s_index_file_detail doc 
set doc.doc_file_name = decode(instr(doc.doc_file, ''\'', 1, 1), 0, substr(doc.doc_file, instr(doc.doc_file, ''/'', -1, 1) +1), substr(doc.doc_file_name, instr(doc.doc_file, ''\'', -1, 1) + 1))
where doc.data_res = '''||dtd.chinese_name||'''
and instr(doc.doc_file_name, ''/'', -1, 1) > 0;
----查询数据表信息
select * from '||dtd.table_name||';-----'||dtd.id||'  '||dtd.chinese_name||';
---专利数据更新doc_file_name: 执行时机：数据入库完成后，生成或刷新统计视图前执行；统计结果当数据数量大部分为0时，应该检查该语句是否执行过，没执行过，执行后刷新统计视图
update  '||dtd.table_name||'  t set doc_File_Name = decode(instr(t.archive_inner_path, ''\''), 0, substr(t.archive_inner_path, instr(t.archive_inner_path, ''/'', -1, 1) + 1),substr(t.archive_inner_path, instr(t.archive_inner_path, ''\'', -1, 1) + 1)) ;
commit;
'||
'
----更新批次：标准核验索引可不执行,执行也不会有副作用, 执行时机：数据入库完成后，生成或刷新统计视图前执行；统计结果当数据数量大部分为0时，应该检查该语句是否执行过，没执行过，执行后刷新统计视图
update '||dtd.table_name||' doc set doc.batch = decode(instr(doc.file_path, ''\''), 0, substr(doc.file_path, instr(doc.file_path, ''/'', -1, 2) + 1, instr(doc.file_path, ''/'', -1, 1) - instr(doc.file_path, ''/'', -1, 2) -1), substr(doc.file_path, instr(doc.file_path, ''\'', -1, 2) + 1, instr(doc.file_path, ''\'', -1, 1) - instr(doc.file_path, ''\'', -1, 2) -1));  
commit;
'
||
'  
----查询统计结果
select * from MV_EXTRA_IDX_INFO_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end||';
select * from MV_EXTRA_DOC_INFO_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end||';
select * from MV_CHECKS_RESULT_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end||';
select * from '||case when dtd.is_pat = 'Y' then 'MV_IDX_INFO_STAT_BY_PUBDATE' else 'MV_NP_IDX_INFO_STAT_BY_BATCH' end||'  where data_res = '''||dtd.chinese_name||'''; 
----所有入库信息统计：有新索引入库完成后更新
call dbms_mview.refresh('''||case when dtd.is_pat = 'Y' then 'MV_IDX_INFO_STAT_BY_PUBDATE' else 'MV_NP_IDX_INFO_STAT_BY_BATCH' end ||''');
----索引未匹配信息：设置doc_file_name或batch后刷新
call dbms_mview.refresh(''MV_EXTRA_IDX_INFO_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end
||''');
----多余数据信息：设置doc_file_name或batch后刷新
call dbms_mview.refresh(''MV_EXTRA_DOC_INFO_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end
||''');
----刷新校验结果：设置doc_file_name或batch后刷新
call dbms_mview.refresh(''MV_CHECKS_RESULT_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end
||''');'
from s_data_resource_types_detail dtd
where dtd.haschecker = 'Y'
order by dtd.is_pat desc, dtd.id
