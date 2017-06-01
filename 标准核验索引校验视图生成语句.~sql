
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where dtd.haschecker = 'Y' and dtd.is_pat = 'Y' and dtd.id not in (13,231,232,233,234)
order by dtd.id
)
select sql1 as sql, num1 as num from result_subq
union 
select sql2 as sql, num2 as num from result_subq
order by num;
