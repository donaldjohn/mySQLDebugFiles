/**003 多余索引信息**/
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
);


/**003 多余数据信息**/
select
sta.id, sta.sta_pub_number, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
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
);

/**003 可以匹配的数据  可能包含数据表重复数据**/
select
sta.id, sta.sta_pub_number, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_STANDARDFULLTXT sta
where
exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);
