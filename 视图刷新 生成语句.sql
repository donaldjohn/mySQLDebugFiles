
-----��ר������ �б� 132,133,134,136,137,138,139,153,162,172,180
-----����ˢ����ͼ���
select
dtd.id as id, dtd.chinese_name, chr(10) || chr(10) || chr(10) || '----**'||dtd.id||'   '||dtd.chinese_name||'**
----��ѯ������
select * from '||case dtd.is_pat when 'Y' then 's_index_file_detail ' else 's_np_index_file_detail' end||' doc where doc.data_res = '''||dtd.chinese_name||''';

----���±�׼������������ doc_file_name�ֶ� ���doc_file�ֶηָ���Ϊ��б��ʱ������ȷ����Doc_file_name������
update s_index_file_detail doc 
set doc.doc_file_name = decode(instr(doc.doc_file, ''\'', 1, 1), 0, substr(doc.doc_file, instr(doc.doc_file, ''/'', -1, 1) +1), substr(doc.doc_file_name, instr(doc.doc_file, ''\'', -1, 1) + 1))
where doc.data_res = '''||dtd.chinese_name||'''
and instr(doc.doc_file_name, ''/'', -1, 1) > 0;
----��ѯ���ݱ���Ϣ
select * from '||dtd.table_name||';-----'||dtd.id||'  '||dtd.chinese_name||';
---ר�����ݸ���doc_file_name: ִ��ʱ�������������ɺ����ɻ�ˢ��ͳ����ͼǰִ�У�ͳ�ƽ�������������󲿷�Ϊ0ʱ��Ӧ�ü�������Ƿ�ִ�й���ûִ�й���ִ�к�ˢ��ͳ����ͼ
update  '||dtd.table_name||'  t set doc_File_Name = decode(instr(t.archive_inner_path, ''\''), 0, substr(t.archive_inner_path, instr(t.archive_inner_path, ''/'', -1, 1) + 1),substr(t.archive_inner_path, instr(t.archive_inner_path, ''\'', -1, 1) + 1)) ;
commit;
'||
'
----�������Σ���׼���������ɲ�ִ��,ִ��Ҳ�����и�����, ִ��ʱ�������������ɺ����ɻ�ˢ��ͳ����ͼǰִ�У�ͳ�ƽ�������������󲿷�Ϊ0ʱ��Ӧ�ü�������Ƿ�ִ�й���ûִ�й���ִ�к�ˢ��ͳ����ͼ
update '||dtd.table_name||' doc set doc.batch = decode(instr(doc.file_path, ''\''), 0, substr(doc.file_path, instr(doc.file_path, ''/'', -1, 2) + 1, instr(doc.file_path, ''/'', -1, 1) - instr(doc.file_path, ''/'', -1, 2) -1), substr(doc.file_path, instr(doc.file_path, ''\'', -1, 2) + 1, instr(doc.file_path, ''\'', -1, 1) - instr(doc.file_path, ''\'', -1, 2) -1));  
commit;
'
||
'  
----��ѯͳ�ƽ��
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
----���������Ϣͳ�ƣ��������������ɺ����
call dbms_mview.refresh('''||case when dtd.is_pat = 'Y' then 'MV_IDX_INFO_STAT_BY_PUBDATE' else 'MV_NP_IDX_INFO_STAT_BY_BATCH' end ||''');
----����δƥ����Ϣ������doc_file_name��batch��ˢ��
call dbms_mview.refresh(''MV_EXTRA_IDX_INFO_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end
||''');
----����������Ϣ������doc_file_name��batch��ˢ��
call dbms_mview.refresh(''MV_EXTRA_DOC_INFO_'||
case
  when length(to_char(dtd.id)) < 3
    then lpad(to_char(dtd.id), 3, '0')
  else replace(to_char(dtd.id), '.', '')
end
||''');
----ˢ��У����������doc_file_name��batch��ˢ��
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
