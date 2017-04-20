
----003 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_003
refresh force on demand
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
);

----003 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_003
refresh force on demand
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
);

----003 校验结果
create materialized view MV_CHECKS_RESULT_003
refresh force on demand
as
(
select
  stat.pub_date,
  stat.idx_pat_cnt,
  stat.doc_pat_cnt,
  nvl(ds_index.idx_dis_pnt_cnts, 0) idx_dis_pnt_cnts,
  case when ds_index.idx_dis_pnt_cnts <> 0 and stat.idx_pat_cnt <> ds_index.idx_dis_pnt_cnts then 'Y' else 'N' end as index_dup,
  nvl(ds_Doc.doc_ds_pat_cnt, 0) doc_ds_pat_cnt,
  case when  ds_Doc.doc_ds_pat_cnt <> 0 and stat.doc_pat_cnt <> ds_Doc.doc_ds_pat_cnt then 'Y' else 'N' end as Doc_dup,
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
          --索引入库符合要求
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
);
