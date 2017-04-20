
--建立003删除备份表
create table S_CHINA_PATENT_STDFULLTXT_RM as
select * from S_CHINA_PATENT_STANDARDFULLTXT
where 56 <> length(doc_file_name) or ori_pub_date is null;
delete from S_CHINA_PATENT_STANDARDFULLTXT where 56 <> length(doc_file_name) or ori_pub_date is null;
commit;
