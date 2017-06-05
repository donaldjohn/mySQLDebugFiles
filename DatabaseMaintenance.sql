/**�鿴�洢�ռ�ʹ�����**/
select 
b.file_id �ļ�ID��, 
b.tablespace_name ��ռ���, 
b.bytes/1024/1024||'M'�ֽ���, 
(b.bytes-sum(nvl(a.bytes,0)))/1024/1024||'M' ��ʹ��, 
sum(nvl(a.bytes,0))/1024/1024||'M' ʣ��ռ�, 
100 - sum(nvl(a.bytes,0))/(b.bytes)*100 ռ�ðٷֱ� 
from dba_free_space a,dba_data_files b 
where  a.file_id=b.file_id 
group by b.tablespace_name,b.file_id,b.bytes
order by b.file_id;
;

/**��ѯ���С**/
select 
seg.segment_name, seg.segment_type,
sum(seg.BYTES) /1024/1024/1024 || 'GB' 
from 
user_segments seg 
group by seg.segment_name, seg.segment_type
order by sum(seg.BYTES) desc
;




