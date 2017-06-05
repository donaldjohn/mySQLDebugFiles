/**查看存储空间使用情况**/
select 
b.file_id 文件ID号, 
b.tablespace_name 表空间名, 
b.bytes/1024/1024||'M'字节数, 
(b.bytes-sum(nvl(a.bytes,0)))/1024/1024||'M' 已使用, 
sum(nvl(a.bytes,0))/1024/1024||'M' 剩余空间, 
100 - sum(nvl(a.bytes,0))/(b.bytes)*100 占用百分比 
from dba_free_space a,dba_data_files b 
where  a.file_id=b.file_id 
group by b.tablespace_name,b.file_id,b.bytes
order by b.file_id;
;

/**查询表大小**/
select 
seg.segment_name, seg.segment_type,
sum(seg.BYTES) /1024/1024/1024 || 'GB' 
from 
user_segments seg 
group by seg.segment_name, seg.segment_type
order by sum(seg.BYTES) desc
;




