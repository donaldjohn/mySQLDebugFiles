



----1 中国专利全文代码化数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_001
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利全文代码化数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_TEXTCODE d
where d.doc_file_name = id.doc_file_name
);

----1 中国专利全文代码化数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_001
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_TEXTCODE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----1 中国专利全文代码化数据 校验结果
create materialized view MV_CHECKS_RESULT_001
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
          s.data_res = '中国专利全文代码化数据'
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
          S_CHINA_PATENT_TEXTCODE d
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
    id.data_res='中国专利全文代码化数据'
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
  S_CHINA_PATENT_TEXTCODE s
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
      where d.data_res='中国专利全文代码化数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_TEXTCODE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----2 中国专利全文图像数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_002
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利全文图像数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_TEXTIMAGE d
where d.doc_file_name = id.doc_file_name
);

----2 中国专利全文图像数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_002
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_TEXTIMAGE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----2 中国专利全文图像数据 校验结果
create materialized view MV_CHECKS_RESULT_002
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
          s.data_res = '中国专利全文图像数据'
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
          S_CHINA_PATENT_TEXTIMAGE d
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
    id.data_res='中国专利全文图像数据'
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
  S_CHINA_PATENT_TEXTIMAGE s
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
      where d.data_res='中国专利全文图像数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_TEXTIMAGE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----3 中国专利标准化全文文本数据 多余索引列表
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

----3 中国专利标准化全文文本数据 多余数据列表
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


----3 中国专利标准化全文文本数据 校验结果
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




----4 中国专利标准化全文图像数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_004
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利标准化全文图像数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_STAND_TEXTIMAGE d
where d.doc_file_name = id.doc_file_name
);

----4 中国专利标准化全文图像数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_004
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_STAND_TEXTIMAGE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----4 中国专利标准化全文图像数据 校验结果
create materialized view MV_CHECKS_RESULT_004
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
          s.data_res = '中国专利标准化全文图像数据'
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
          S_CHINA_PATENT_STAND_TEXTIMAGE d
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
    id.data_res='中国专利标准化全文图像数据'
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
  S_CHINA_PATENT_STAND_TEXTIMAGE s
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
      where d.data_res='中国专利标准化全文图像数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_STAND_TEXTIMAGE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----5 中国专利公报数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_005
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利公报数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_GAZETTE d
where d.doc_file_name = id.doc_file_name
);

----5 中国专利公报数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_005
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_GAZETTE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----5 中国专利公报数据 校验结果
create materialized view MV_CHECKS_RESULT_005
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
          s.data_res = '中国专利公报数据'
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
          S_CHINA_PATENT_GAZETTE d
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
    id.data_res='中国专利公报数据'
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
  S_CHINA_PATENT_GAZETTE s
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
      where d.data_res='中国专利公报数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_GAZETTE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----6 中国专利著录项目与文摘数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_006
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利著录项目与文摘数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_BIBLIOGRAPHIC d
where d.doc_file_name = id.doc_file_name
);

----6 中国专利著录项目与文摘数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_006
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_BIBLIOGRAPHIC sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----6 中国专利著录项目与文摘数据 校验结果
create materialized view MV_CHECKS_RESULT_006
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
          s.data_res = '中国专利著录项目与文摘数据'
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
          S_CHINA_PATENT_BIBLIOGRAPHIC d
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
    id.data_res='中国专利著录项目与文摘数据'
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
  S_CHINA_PATENT_BIBLIOGRAPHIC s
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
      where d.data_res='中国专利著录项目与文摘数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_BIBLIOGRAPHIC s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----10 中国专利法律状态数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_010
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利法律状态数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_LAWSTATE d
where d.doc_file_name = id.doc_file_name
);

----10 中国专利法律状态数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_010
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_LAWSTATE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----10 中国专利法律状态数据 校验结果
create materialized view MV_CHECKS_RESULT_010
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
          s.data_res = '中国专利法律状态数据'
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
          S_CHINA_PATENT_LAWSTATE d
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
    id.data_res='中国专利法律状态数据'
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
  S_CHINA_PATENT_LAWSTATE s
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
      where d.data_res='中国专利法律状态数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_LAWSTATE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----11 中国专利法律状态变更翻译数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_011
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利法律状态变更翻译数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_LAWSTATE_CHANGE d
where d.doc_file_name = id.doc_file_name
);

----11 中国专利法律状态变更翻译数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_011
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_LAWSTATE_CHANGE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----11 中国专利法律状态变更翻译数据 校验结果
create materialized view MV_CHECKS_RESULT_011
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
          s.data_res = '中国专利法律状态变更翻译数据'
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
          S_CHINA_PATENT_LAWSTATE_CHANGE d
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
    id.data_res='中国专利法律状态变更翻译数据'
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
  S_CHINA_PATENT_LAWSTATE_CHANGE s
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
      where d.data_res='中国专利法律状态变更翻译数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_LAWSTATE_CHANGE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----13 中国标准化简单引文数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_013
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国标准化简单引文数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_STANDARD_SIMPCITATION d
where d.doc_file_name = id.doc_file_name
);

----13 中国标准化简单引文数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_013
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_STANDARD_SIMPCITATION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----13 中国标准化简单引文数据 校验结果
create materialized view MV_CHECKS_RESULT_013
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
          s.data_res = '中国标准化简单引文数据'
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
          S_CHINA_STANDARD_SIMPCITATION d
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
    id.data_res='中国标准化简单引文数据'
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
  S_CHINA_STANDARD_SIMPCITATION s
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
      where d.data_res='中国标准化简单引文数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_STANDARD_SIMPCITATION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----14 专利缴费数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_014
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '专利缴费数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_PATENT_PAYMENT d
where d.doc_file_name = id.doc_file_name
);

----14 专利缴费数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_014
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_PATENT_PAYMENT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----14 专利缴费数据 校验结果
create materialized view MV_CHECKS_RESULT_014
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
          s.data_res = '专利缴费数据'
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
          S_PATENT_PAYMENT d
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
    id.data_res='专利缴费数据'
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
  S_PATENT_PAYMENT s
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
      where d.data_res='专利缴费数据'
      and
      exists
      (
        select
        1
        from
        S_PATENT_PAYMENT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----16 公司代码库 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_016
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '公司代码库'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_COMPANY_CODE_LIBRARY d
where d.doc_file_name = id.doc_file_name
);

----16 公司代码库 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_016
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_COMPANY_CODE_LIBRARY sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----16 公司代码库 校验结果
create materialized view MV_CHECKS_RESULT_016
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
          s.data_res = '公司代码库'
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
          S_COMPANY_CODE_LIBRARY d
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
    id.data_res='公司代码库'
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
  S_COMPANY_CODE_LIBRARY s
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
      where d.data_res='公司代码库'
      and
      exists
      (
        select
        1
        from
        S_COMPANY_CODE_LIBRARY s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----17 区域代码库 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_017
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '区域代码库'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_ZONE_CODE_BASE d
where d.doc_file_name = id.doc_file_name
);

----17 区域代码库 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_017
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_ZONE_CODE_BASE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----17 区域代码库 校验结果
create materialized view MV_CHECKS_RESULT_017
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
          s.data_res = '区域代码库'
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
          S_ZONE_CODE_BASE d
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
    id.data_res='区域代码库'
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
  S_ZONE_CODE_BASE s
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
      where d.data_res='区域代码库'
      and
      exists
      (
        select
        1
        from
        S_ZONE_CODE_BASE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----50 美国专利全文文本数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_050
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '美国专利全文文本数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AMERICAN_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----50 美国专利全文文本数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_050
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_AMERICAN_PATENT_FULLTEXT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----50 美国专利全文文本数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_050
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
          s.data_res = '美国专利全文文本数据（标准化）'
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
          S_AMERICAN_PATENT_FULLTEXT d
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
    id.data_res='美国专利全文文本数据（标准化）'
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
  S_AMERICAN_PATENT_FULLTEXT s
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
      where d.data_res='美国专利全文文本数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_AMERICAN_PATENT_FULLTEXT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----51 欧专局专利全文文本数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_051
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '欧专局专利全文文本数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_EUROPEAN_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----51 欧专局专利全文文本数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_051
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_EUROPEAN_PATENT_FULLTEXT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----51 欧专局专利全文文本数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_051
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
          s.data_res = '欧专局专利全文文本数据（标准化）'
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
          S_EUROPEAN_PATENT_FULLTEXT d
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
    id.data_res='欧专局专利全文文本数据（标准化）'
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
  S_EUROPEAN_PATENT_FULLTEXT s
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
      where d.data_res='欧专局专利全文文本数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_EUROPEAN_PATENT_FULLTEXT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----52 韩国专利全文代码化数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_052
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '韩国专利全文代码化数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_KOREAN_PATENT_FULLTEXTCODE d
where d.doc_file_name = id.doc_file_name
);

----52 韩国专利全文代码化数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_052
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_KOREAN_PATENT_FULLTEXTCODE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----52 韩国专利全文代码化数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_052
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
          s.data_res = '韩国专利全文代码化数据（标准化）'
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
          S_KOREAN_PATENT_FULLTEXTCODE d
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
    id.data_res='韩国专利全文代码化数据（标准化）'
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
  S_KOREAN_PATENT_FULLTEXTCODE s
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
      where d.data_res='韩国专利全文代码化数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_KOREAN_PATENT_FULLTEXTCODE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----53 瑞士专利全文代码化数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_053
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '瑞士专利全文代码化数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_SWISS_PATENT_FULLTEXTCODE d
where d.doc_file_name = id.doc_file_name
);

----53 瑞士专利全文代码化数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_053
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_SWISS_PATENT_FULLTEXTCODE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----53 瑞士专利全文代码化数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_053
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
          s.data_res = '瑞士专利全文代码化数据（标准化）'
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
          S_SWISS_PATENT_FULLTEXTCODE d
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
    id.data_res='瑞士专利全文代码化数据（标准化）'
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
  S_SWISS_PATENT_FULLTEXTCODE s
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
      where d.data_res='瑞士专利全文代码化数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_SWISS_PATENT_FULLTEXTCODE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----54 英国专利全文代码化数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_054
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '英国专利全文代码化数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_BRITISH_PATENT_FULLTEXTCODE d
where d.doc_file_name = id.doc_file_name
);

----54 英国专利全文代码化数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_054
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_BRITISH_PATENT_FULLTEXTCODE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----54 英国专利全文代码化数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_054
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
          s.data_res = '英国专利全文代码化数据（标准化）'
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
          S_BRITISH_PATENT_FULLTEXTCODE d
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
    id.data_res='英国专利全文代码化数据（标准化）'
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
  S_BRITISH_PATENT_FULLTEXTCODE s
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
      where d.data_res='英国专利全文代码化数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_BRITISH_PATENT_FULLTEXTCODE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----55 日本专利全文代码化数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_055
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '日本专利全文代码化数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_JAPAN_PATENT_FULLTEXTCODE d
where d.doc_file_name = id.doc_file_name
);

----55 日本专利全文代码化数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_055
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_JAPAN_PATENT_FULLTEXTCODE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----55 日本专利全文代码化数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_055
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
          s.data_res = '日本专利全文代码化数据（标准化）'
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
          S_JAPAN_PATENT_FULLTEXTCODE d
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
    id.data_res='日本专利全文代码化数据（标准化）'
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
  S_JAPAN_PATENT_FULLTEXTCODE s
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
      where d.data_res='日本专利全文代码化数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_JAPAN_PATENT_FULLTEXTCODE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----76 中国专利生物序列数据（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_076
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利生物序列数据（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_BIOLOGICALSEQ d
where d.doc_file_name = id.doc_file_name
);

----76 中国专利生物序列数据（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_076
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_BIOLOGICALSEQ sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----76 中国专利生物序列数据（DI） 校验结果
create materialized view MV_CHECKS_RESULT_076
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
          s.data_res = '中国专利生物序列数据（DI）'
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
          S_CHINA_PATENT_BIOLOGICALSEQ d
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
    id.data_res='中国专利生物序列数据（DI）'
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
  S_CHINA_PATENT_BIOLOGICALSEQ s
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
      where d.data_res='中国专利生物序列数据（DI）'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_BIOLOGICALSEQ s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----82 专利同族数据（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_082
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '专利同族数据（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_PATENT_FAMILY d
where d.doc_file_name = id.doc_file_name
);

----82 专利同族数据（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_082
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_PATENT_FAMILY sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----82 专利同族数据（DI） 校验结果
create materialized view MV_CHECKS_RESULT_082
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
          s.data_res = '专利同族数据（DI）'
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
          S_PATENT_FAMILY d
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
    id.data_res='专利同族数据（DI）'
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
  S_PATENT_FAMILY s
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
      where d.data_res='专利同族数据（DI）'
      and
      exists
      (
        select
        1
        from
        S_PATENT_FAMILY s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----83 全球专利引文数据（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_083
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '全球专利引文数据（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_GLOBAL_PATENT_CITATION d
where d.doc_file_name = id.doc_file_name
);

----83 全球专利引文数据（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_083
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_GLOBAL_PATENT_CITATION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----83 全球专利引文数据（DI） 校验结果
create materialized view MV_CHECKS_RESULT_083
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
          s.data_res = '全球专利引文数据（DI）'
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
          S_GLOBAL_PATENT_CITATION d
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
    id.data_res='全球专利引文数据（DI）'
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
  S_GLOBAL_PATENT_CITATION s
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
      where d.data_res='全球专利引文数据（DI）'
      and
      exists
      (
        select
        1
        from
        S_GLOBAL_PATENT_CITATION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----84 中国专利费用信息数据（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_084
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利费用信息数据（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_FEEINFORMATION d
where d.doc_file_name = id.doc_file_name
);

----84 中国专利费用信息数据（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_084
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_FEEINFORMATION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----84 中国专利费用信息数据（DI） 校验结果
create materialized view MV_CHECKS_RESULT_084
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
          s.data_res = '中国专利费用信息数据（DI）'
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
          S_CHINA_PATENT_FEEINFORMATION d
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
    id.data_res='中国专利费用信息数据（DI）'
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
  S_CHINA_PATENT_FEEINFORMATION s
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
      where d.data_res='中国专利费用信息数据（DI）'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_FEEINFORMATION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----85 中国专利通知书数据（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_085
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利通知书数据（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_NOTICES d
where d.doc_file_name = id.doc_file_name
);

----85 中国专利通知书数据（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_085
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_NOTICES sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----85 中国专利通知书数据（DI） 校验结果
create materialized view MV_CHECKS_RESULT_085
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
          s.data_res = '中国专利通知书数据（DI）'
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
          S_CHINA_PATENT_NOTICES d
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
    id.data_res='中国专利通知书数据（DI）'
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
  S_CHINA_PATENT_NOTICES s
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
      where d.data_res='中国专利通知书数据（DI）'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_NOTICES s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----86 中国法律状态标引库（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_086
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国法律状态标引库（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_LAWSTATE_INDEXINGLIB d
where d.doc_file_name = id.doc_file_name
);

----86 中国法律状态标引库（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_086
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_LAWSTATE_INDEXINGLIB sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----86 中国法律状态标引库（DI） 校验结果
create materialized view MV_CHECKS_RESULT_086
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
          s.data_res = '中国法律状态标引库（DI）'
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
          S_CHINA_LAWSTATE_INDEXINGLIB d
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
    id.data_res='中国法律状态标引库（DI）'
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
  S_CHINA_LAWSTATE_INDEXINGLIB s
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
      where d.data_res='中国法律状态标引库（DI）'
      and
      exists
      (
        select
        1
        from
        S_CHINA_LAWSTATE_INDEXINGLIB s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----88 世界法律状态数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_088
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '世界法律状态数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_WORLD_LEGAL_STATUS d
where d.doc_file_name = id.doc_file_name
);

----88 世界法律状态数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_088
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_WORLD_LEGAL_STATUS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----88 世界法律状态数据 校验结果
create materialized view MV_CHECKS_RESULT_088
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
          s.data_res = '世界法律状态数据'
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
          S_WORLD_LEGAL_STATUS d
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
    id.data_res='世界法律状态数据'
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
  S_WORLD_LEGAL_STATUS s
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
      where d.data_res='世界法律状态数据'
      and
      exists
      (
        select
        1
        from
        S_WORLD_LEGAL_STATUS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----90 DOCDB数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_090
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = 'DOCDB数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_DOCDB d
where d.doc_file_name = id.doc_file_name
);

----90 DOCDB数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_090
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_DOCDB sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----90 DOCDB数据 校验结果
create materialized view MV_CHECKS_RESULT_090
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
          s.data_res = 'DOCDB数据'
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
          S_DOCDB d
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
    id.data_res='DOCDB数据'
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
  S_DOCDB s
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
      where d.data_res='DOCDB数据'
      and
      exists
      (
        select
        1
        from
        S_DOCDB s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----103 比利时专利全文数据（BE）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_103
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '比利时专利全文数据（BE）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_BELGIAN_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----103 比利时专利全文数据（BE）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_103
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_BELGIAN_PATENT_FULLTEXT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----103 比利时专利全文数据（BE）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_103
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
          s.data_res = '比利时专利全文数据（BE）（标准化）'
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
          S_BELGIAN_PATENT_FULLTEXT d
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
    id.data_res='比利时专利全文数据（BE）（标准化）'
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
  S_BELGIAN_PATENT_FULLTEXT s
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
      where d.data_res='比利时专利全文数据（BE）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_BELGIAN_PATENT_FULLTEXT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----104 奥地利专利全文数据（AT）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_104
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '奥地利专利全文数据（AT）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AUSTRIA_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----104 奥地利专利全文数据（AT）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_104
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_AUSTRIA_PATENT_FULLTEXT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----104 奥地利专利全文数据（AT）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_104
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
          s.data_res = '奥地利专利全文数据（AT）（标准化）'
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
          S_AUSTRIA_PATENT_FULLTEXT d
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
    id.data_res='奥地利专利全文数据（AT）（标准化）'
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
  S_AUSTRIA_PATENT_FULLTEXT s
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
      where d.data_res='奥地利专利全文数据（AT）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_AUSTRIA_PATENT_FULLTEXT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----105 西班牙专利全文数据（ES）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_105
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '西班牙专利全文数据（ES）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_SPANISH_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----105 西班牙专利全文数据（ES）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_105
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_SPANISH_PATENT_FULLTEXT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----105 西班牙专利全文数据（ES）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_105
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
          s.data_res = '西班牙专利全文数据（ES）（标准化）'
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
          S_SPANISH_PATENT_FULLTEXT d
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
    id.data_res='西班牙专利全文数据（ES）（标准化）'
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
  S_SPANISH_PATENT_FULLTEXT s
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
      where d.data_res='西班牙专利全文数据（ES）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_SPANISH_PATENT_FULLTEXT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----106 波兰专利著录项及全文数据（PL）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_106
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '波兰专利著录项及全文数据（PL）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_POLAND_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----106 波兰专利著录项及全文数据（PL）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_106
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_POLAND_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----106 波兰专利著录项及全文数据（PL）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_106
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
          s.data_res = '波兰专利著录项及全文数据（PL）（标准化）'
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
          S_POLAND_PATENT_DESCRIPTION d
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
    id.data_res='波兰专利著录项及全文数据（PL）（标准化）'
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
  S_POLAND_PATENT_DESCRIPTION s
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
      where d.data_res='波兰专利著录项及全文数据（PL）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_POLAND_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----107 以色列专利著录项及全文数据（IL）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_107
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '以色列专利著录项及全文数据（IL）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_ISRAEL_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----107 以色列专利著录项及全文数据（IL）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_107
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_ISRAEL_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----107 以色列专利著录项及全文数据（IL）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_107
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
          s.data_res = '以色列专利著录项及全文数据（IL）（标准化）'
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
          S_ISRAEL_PATENT_DESCRIPTION d
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
    id.data_res='以色列专利著录项及全文数据（IL）（标准化）'
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
  S_ISRAEL_PATENT_DESCRIPTION s
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
      where d.data_res='以色列专利著录项及全文数据（IL）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_ISRAEL_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----108 新加坡专利著录项及全文数据（SG）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_108
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '新加坡专利著录项及全文数据（SG）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_SINGAPORE_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----108 新加坡专利著录项及全文数据（SG）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_108
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_SINGAPORE_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----108 新加坡专利著录项及全文数据（SG）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_108
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
          s.data_res = '新加坡专利著录项及全文数据（SG）（标准化）'
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
          S_SINGAPORE_PATENT_DESCRIPTION d
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
    id.data_res='新加坡专利著录项及全文数据（SG）（标准化）'
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
  S_SINGAPORE_PATENT_DESCRIPTION s
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
      where d.data_res='新加坡专利著录项及全文数据（SG）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_SINGAPORE_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----113 美国外观设计专利数据（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_113
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '美国外观设计专利数据（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AMERICAN_DESIGN_PATENT d
where d.doc_file_name = id.doc_file_name
);

----113 美国外观设计专利数据（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_113
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_AMERICAN_DESIGN_PATENT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----113 美国外观设计专利数据（DI） 校验结果
create materialized view MV_CHECKS_RESULT_113
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
          s.data_res = '美国外观设计专利数据（DI）'
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
          S_AMERICAN_DESIGN_PATENT d
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
    id.data_res='美国外观设计专利数据（DI）'
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
  S_AMERICAN_DESIGN_PATENT s
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
      where d.data_res='美国外观设计专利数据（DI）'
      and
      exists
      (
        select
        1
        from
        S_AMERICAN_DESIGN_PATENT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----115 韩国外观设计专利数据（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_115
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '韩国外观设计专利数据（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_KOREA_DESIGN_PATENT d
where d.doc_file_name = id.doc_file_name
);

----115 韩国外观设计专利数据（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_115
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_KOREA_DESIGN_PATENT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----115 韩国外观设计专利数据（DI） 校验结果
create materialized view MV_CHECKS_RESULT_115
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
          s.data_res = '韩国外观设计专利数据（DI）'
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
          S_KOREA_DESIGN_PATENT d
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
    id.data_res='韩国外观设计专利数据（DI）'
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
  S_KOREA_DESIGN_PATENT s
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
      where d.data_res='韩国外观设计专利数据（DI）'
      and
      exists
      (
        select
        1
        from
        S_KOREA_DESIGN_PATENT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----121 中国专利全文数据PDF（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_121
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利全文数据PDF（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_FULLTEXT_PDF d
where d.doc_file_name = id.doc_file_name
);

----121 中国专利全文数据PDF（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_121
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_FULLTEXT_PDF sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----121 中国专利全文数据PDF（DI） 校验结果
create materialized view MV_CHECKS_RESULT_121
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
          s.data_res = '中国专利全文数据PDF（DI）'
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
          S_CHINA_PATENT_FULLTEXT_PDF d
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
    id.data_res='中国专利全文数据PDF（DI）'
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
  S_CHINA_PATENT_FULLTEXT_PDF s
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
      where d.data_res='中国专利全文数据PDF（DI）'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_FULLTEXT_PDF s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----122 国外专利全文数据PDF（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_122
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '国外专利全文数据PDF（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_FOREIGN_PATENT_FULLTEXT_PDF d
where d.doc_file_name = id.doc_file_name
);

----122 国外专利全文数据PDF（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_122
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_FOREIGN_PATENT_FULLTEXT_PDF sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----122 国外专利全文数据PDF（DI） 校验结果
create materialized view MV_CHECKS_RESULT_122
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
          s.data_res = '国外专利全文数据PDF（DI）'
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
          S_FOREIGN_PATENT_FULLTEXT_PDF d
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
    id.data_res='国外专利全文数据PDF（DI）'
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
  S_FOREIGN_PATENT_FULLTEXT_PDF s
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
      where d.data_res='国外专利全文数据PDF（DI）'
      and
      exists
      (
        select
        1
        from
        S_FOREIGN_PATENT_FULLTEXT_PDF s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----127 俄罗斯专利文摘英文翻译数据（DI） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_127
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '俄罗斯专利文摘英文翻译数据（DI）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_RUSSIAN_PATENT_ABSTRACTS d
where d.doc_file_name = id.doc_file_name
);

----127 俄罗斯专利文摘英文翻译数据（DI） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_127
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_RUSSIAN_PATENT_ABSTRACTS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----127 俄罗斯专利文摘英文翻译数据（DI） 校验结果
create materialized view MV_CHECKS_RESULT_127
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
          s.data_res = '俄罗斯专利文摘英文翻译数据（DI）'
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
          S_RUSSIAN_PATENT_ABSTRACTS d
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
    id.data_res='俄罗斯专利文摘英文翻译数据（DI）'
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
  S_RUSSIAN_PATENT_ABSTRACTS s
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
      where d.data_res='俄罗斯专利文摘英文翻译数据（DI）'
      and
      exists
      (
        select
        1
        from
        S_RUSSIAN_PATENT_ABSTRACTS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----132 中国商标 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_132
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国商标'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_BRAND d
where d.doc_file_name = id.doc_file_name
);

----132 中国商标 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_132
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_BRAND sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----132 中国商标 校验结果
create materialized view MV_CHECKS_RESULT_132
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
          s.data_res = '中国商标'
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
          S_CHINA_BRAND d
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
    id.data_res='中国商标'
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
  S_CHINA_BRAND s
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
      where d.data_res='中国商标'
      and
      exists
      (
        select
        1
        from
        S_CHINA_BRAND s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----133 中国商标许可数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_133
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国商标许可数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_BRAND_LICENSE d
where d.doc_file_name = id.doc_file_name
);

----133 中国商标许可数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_133
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_BRAND_LICENSE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----133 中国商标许可数据 校验结果
create materialized view MV_CHECKS_RESULT_133
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
          s.data_res = '中国商标许可数据'
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
          S_CHINA_BRAND_LICENSE d
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
    id.data_res='中国商标许可数据'
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
  S_CHINA_BRAND_LICENSE s
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
      where d.data_res='中国商标许可数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_BRAND_LICENSE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----134 中国商标转让数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_134
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国商标转让数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_BRAND_TRANSFER d
where d.doc_file_name = id.doc_file_name
);

----134 中国商标转让数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_134
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_BRAND_TRANSFER sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----134 中国商标转让数据 校验结果
create materialized view MV_CHECKS_RESULT_134
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
          s.data_res = '中国商标转让数据'
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
          S_CHINA_BRAND_TRANSFER d
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
    id.data_res='中国商标转让数据'
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
  S_CHINA_BRAND_TRANSFER s
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
      where d.data_res='中国商标转让数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_BRAND_TRANSFER s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----136 马德里商标进入中国 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_136
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '马德里商标进入中国'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_MADRID_BRAND_ENTER_CHINA d
where d.doc_file_name = id.doc_file_name
);

----136 马德里商标进入中国 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_136
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_MADRID_BRAND_ENTER_CHINA sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----136 马德里商标进入中国 校验结果
create materialized view MV_CHECKS_RESULT_136
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
          s.data_res = '马德里商标进入中国'
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
          S_MADRID_BRAND_ENTER_CHINA d
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
    id.data_res='马德里商标进入中国'
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
  S_MADRID_BRAND_ENTER_CHINA s
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
      where d.data_res='马德里商标进入中国'
      and
      exists
      (
        select
        1
        from
        S_MADRID_BRAND_ENTER_CHINA s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----137 中国驰名商标数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_137
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国驰名商标数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_WELLKNOWN_BRAND d
where d.doc_file_name = id.doc_file_name
);

----137 中国驰名商标数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_137
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_WELLKNOWN_BRAND sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----137 中国驰名商标数据 校验结果
create materialized view MV_CHECKS_RESULT_137
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
          s.data_res = '中国驰名商标数据'
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
          S_CHINA_WELLKNOWN_BRAND d
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
    id.data_res='中国驰名商标数据'
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
  S_CHINA_WELLKNOWN_BRAND s
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
      where d.data_res='中国驰名商标数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_WELLKNOWN_BRAND s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----138 美国申请商标 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_138
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '美国申请商标'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AMERICA_APPLY_BRAND d
where d.doc_file_name = id.doc_file_name
);

----138 美国申请商标 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_138
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_AMERICA_APPLY_BRAND sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----138 美国申请商标 校验结果
create materialized view MV_CHECKS_RESULT_138
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
          s.data_res = '美国申请商标'
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
          S_AMERICA_APPLY_BRAND d
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
    id.data_res='美国申请商标'
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
  S_AMERICA_APPLY_BRAND s
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
      where d.data_res='美国申请商标'
      and
      exists
      (
        select
        1
        from
        S_AMERICA_APPLY_BRAND s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----139 美国转让商标 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_139
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '美国转让商标'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AMERICA_TRANSFER_BRAND d
where d.doc_file_name = id.doc_file_name
);

----139 美国转让商标 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_139
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_AMERICA_TRANSFER_BRAND sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----139 美国转让商标 校验结果
create materialized view MV_CHECKS_RESULT_139
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
          s.data_res = '美国转让商标'
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
          S_AMERICA_TRANSFER_BRAND d
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
    id.data_res='美国转让商标'
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
  S_AMERICA_TRANSFER_BRAND s
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
      where d.data_res='美国转让商标'
      and
      exists
      (
        select
        1
        from
        S_AMERICA_TRANSFER_BRAND s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----140 美国审判商标 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_140
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '美国审判商标'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AMERICA_TRIAL_BRAND d
where d.doc_file_name = id.doc_file_name
);

----140 美国审判商标 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_140
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_AMERICA_TRIAL_BRAND sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----140 美国审判商标 校验结果
create materialized view MV_CHECKS_RESULT_140
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
          s.data_res = '美国审判商标'
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
          S_AMERICA_TRIAL_BRAND d
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
    id.data_res='美国审判商标'
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
  S_AMERICA_TRIAL_BRAND s
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
      where d.data_res='美国审判商标'
      and
      exists
      (
        select
        1
        from
        S_AMERICA_TRIAL_BRAND s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----147 社内外知识产权图书题录数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_147
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '社内外知识产权图书题录数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_COMMUNITY_INTELLECTUALRECORD d
where d.doc_file_name = id.doc_file_name
);

----147 社内外知识产权图书题录数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_147
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_COMMUNITY_INTELLECTUALRECORD sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----147 社内外知识产权图书题录数据 校验结果
create materialized view MV_CHECKS_RESULT_147
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
          s.data_res = '社内外知识产权图书题录数据'
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
          S_COMMUNITY_INTELLECTUALRECORD d
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
    id.data_res='社内外知识产权图书题录数据'
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
  S_COMMUNITY_INTELLECTUALRECORD s
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
      where d.data_res='社内外知识产权图书题录数据'
      and
      exists
      (
        select
        1
        from
        S_COMMUNITY_INTELLECTUALRECORD s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----148 民国书 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_148
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '民国书'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_BOOK d
where d.doc_file_name = id.doc_file_name
);

----148 民国书 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_148
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_BOOK sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----148 民国书 校验结果
create materialized view MV_CHECKS_RESULT_148
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
          s.data_res = '民国书'
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
          S_CHINA_BOOK d
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
    id.data_res='民国书'
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
  S_CHINA_BOOK s
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
      where d.data_res='民国书'
      and
      exists
      (
        select
        1
        from
        S_CHINA_BOOK s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----153 中外期刊的著录项目与文摘数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_153
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中外期刊的著录项目与文摘数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_JOURNAL_PROJECT_ABSTRACT d
where d.doc_file_name = id.doc_file_name
);

----153 中外期刊的著录项目与文摘数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_153
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_JOURNAL_PROJECT_ABSTRACT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----153 中外期刊的著录项目与文摘数据 校验结果
create materialized view MV_CHECKS_RESULT_153
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
          s.data_res = '中外期刊的著录项目与文摘数据'
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
          S_JOURNAL_PROJECT_ABSTRACT d
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
    id.data_res='中外期刊的著录项目与文摘数据'
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
  S_JOURNAL_PROJECT_ABSTRACT s
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
      where d.data_res='中外期刊的著录项目与文摘数据'
      and
      exists
      (
        select
        1
        from
        S_JOURNAL_PROJECT_ABSTRACT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----162 中国法院判例初加工数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_162
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国法院判例初加工数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_COURTCASE_PROCESS d
where d.doc_file_name = id.doc_file_name
);

----162 中国法院判例初加工数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_162
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_COURTCASE_PROCESS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----162 中国法院判例初加工数据 校验结果
create materialized view MV_CHECKS_RESULT_162
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
          s.data_res = '中国法院判例初加工数据'
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
          S_CHINA_COURTCASE_PROCESS d
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
    id.data_res='中国法院判例初加工数据'
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
  S_CHINA_COURTCASE_PROCESS s
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
      where d.data_res='中国法院判例初加工数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_COURTCASE_PROCESS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----168 中国商标分类数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_168
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国商标分类数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_BRAND_CLASSIFICATION d
where d.doc_file_name = id.doc_file_name
);

----168 中国商标分类数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_168
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_BRAND_CLASSIFICATION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----168 中国商标分类数据 校验结果
create materialized view MV_CHECKS_RESULT_168
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
          s.data_res = '中国商标分类数据'
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
          S_CHINA_BRAND_CLASSIFICATION d
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
    id.data_res='中国商标分类数据'
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
  S_CHINA_BRAND_CLASSIFICATION s
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
      where d.data_res='中国商标分类数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_BRAND_CLASSIFICATION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----169 美国商标图形分类数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_169
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '美国商标图形分类数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AMERICAN_BRAND_GRAPHCLASSIFY d
where d.doc_file_name = id.doc_file_name
);

----169 美国商标图形分类数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_169
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_AMERICAN_BRAND_GRAPHCLASSIFY sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----169 美国商标图形分类数据 校验结果
create materialized view MV_CHECKS_RESULT_169
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
          s.data_res = '美国商标图形分类数据'
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
          S_AMERICAN_BRAND_GRAPHCLASSIFY d
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
    id.data_res='美国商标图形分类数据'
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
  S_AMERICAN_BRAND_GRAPHCLASSIFY s
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
      where d.data_res='美国商标图形分类数据'
      and
      exists
      (
        select
        1
        from
        S_AMERICAN_BRAND_GRAPHCLASSIFY s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----170 美国商标美国分类数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_170
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '美国商标美国分类数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AMERICAN_BRAND_USCLASSIFY d
where d.doc_file_name = id.doc_file_name
);

----170 美国商标美国分类数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_170
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_AMERICAN_BRAND_USCLASSIFY sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----170 美国商标美国分类数据 校验结果
create materialized view MV_CHECKS_RESULT_170
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
          s.data_res = '美国商标美国分类数据'
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
          S_AMERICAN_BRAND_USCLASSIFY d
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
    id.data_res='美国商标美国分类数据'
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
  S_AMERICAN_BRAND_USCLASSIFY s
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
      where d.data_res='美国商标美国分类数据'
      and
      exists
      (
        select
        1
        from
        S_AMERICAN_BRAND_USCLASSIFY s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----172 马德里商标购买数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_172
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '马德里商标购买数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_MADRID_BRAND_PURCHASE d
where d.doc_file_name = id.doc_file_name
);

----172 马德里商标购买数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_172
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_MADRID_BRAND_PURCHASE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----172 马德里商标购买数据 校验结果
create materialized view MV_CHECKS_RESULT_172
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
          s.data_res = '马德里商标购买数据'
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
          S_MADRID_BRAND_PURCHASE d
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
    id.data_res='马德里商标购买数据'
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
  S_MADRID_BRAND_PURCHASE s
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
      where d.data_res='马德里商标购买数据'
      and
      exists
      (
        select
        1
        from
        S_MADRID_BRAND_PURCHASE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----180 中国专利代理知识产权法律法规加工数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_180
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利代理知识产权法律法规加工数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_LAWSPROCESS d
where d.doc_file_name = id.doc_file_name
);

----180 中国专利代理知识产权法律法规加工数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_180
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_LAWSPROCESS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----180 中国专利代理知识产权法律法规加工数据 校验结果
create materialized view MV_CHECKS_RESULT_180
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
          s.data_res = '中国专利代理知识产权法律法规加工数据'
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
          S_CHINA_PATENT_LAWSPROCESS d
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
    id.data_res='中国专利代理知识产权法律法规加工数据'
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
  S_CHINA_PATENT_LAWSPROCESS s
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
      where d.data_res='中国专利代理知识产权法律法规加工数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_LAWSPROCESS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----183 中国集成电路布图公告及事务数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_183
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国集成电路布图公告及事务数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_CIRCUITLAYOUT d
where d.doc_file_name = id.doc_file_name
);

----183 中国集成电路布图公告及事务数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_183
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_CIRCUITLAYOUT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----183 中国集成电路布图公告及事务数据 校验结果
create materialized view MV_CHECKS_RESULT_183
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
          s.data_res = '中国集成电路布图公告及事务数据'
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
          S_CHINA_CIRCUITLAYOUT d
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
    id.data_res='中国集成电路布图公告及事务数据'
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
  S_CHINA_CIRCUITLAYOUT s
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
      where d.data_res='中国集成电路布图公告及事务数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_CIRCUITLAYOUT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----184 中国知识产权海关备案数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_184
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国知识产权海关备案数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_CUSTOMS_RECORD d
where d.doc_file_name = id.doc_file_name
);

----184 中国知识产权海关备案数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_184
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_CUSTOMS_RECORD sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----184 中国知识产权海关备案数据 校验结果
create materialized view MV_CHECKS_RESULT_184
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
          s.data_res = '中国知识产权海关备案数据'
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
          S_CHINA_CUSTOMS_RECORD d
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
    id.data_res='中国知识产权海关备案数据'
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
  S_CHINA_CUSTOMS_RECORD s
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
      where d.data_res='中国知识产权海关备案数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_CUSTOMS_RECORD s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----186 国外专利生物序列加工成品数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_186
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '国外专利生物序列加工成品数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_FOREIGN_PATENT_SEQUENCE d
where d.doc_file_name = id.doc_file_name
);

----186 国外专利生物序列加工成品数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_186
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_FOREIGN_PATENT_SEQUENCE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----186 国外专利生物序列加工成品数据 校验结果
create materialized view MV_CHECKS_RESULT_186
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
          s.data_res = '国外专利生物序列加工成品数据'
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
          S_FOREIGN_PATENT_SEQUENCE d
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
    id.data_res='国外专利生物序列加工成品数据'
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
  S_FOREIGN_PATENT_SEQUENCE s
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
      where d.data_res='国外专利生物序列加工成品数据'
      and
      exists
      (
        select
        1
        from
        S_FOREIGN_PATENT_SEQUENCE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----194 中国专利复审（无效）数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_194
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利复审（无效）数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_REVIEW d
where d.doc_file_name = id.doc_file_name
);

----194 中国专利复审（无效）数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_194
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_REVIEW sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----194 中国专利复审（无效）数据 校验结果
create materialized view MV_CHECKS_RESULT_194
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
          s.data_res = '中国专利复审（无效）数据'
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
          S_CHINA_PATENT_REVIEW d
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
    id.data_res='中国专利复审（无效）数据'
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
  S_CHINA_PATENT_REVIEW s
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
      where d.data_res='中国专利复审（无效）数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_REVIEW s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----195 中国专利无效数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_195
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利无效数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_INVALID d
where d.doc_file_name = id.doc_file_name
);

----195 中国专利无效数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_195
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_INVALID sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----195 中国专利无效数据 校验结果
create materialized view MV_CHECKS_RESULT_195
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
          s.data_res = '中国专利无效数据'
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
          S_CHINA_PATENT_INVALID d
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
    id.data_res='中国专利无效数据'
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
  S_CHINA_PATENT_INVALID s
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
      where d.data_res='中国专利无效数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_INVALID s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----196 中国专利的判决书数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_196
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利的判决书数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_JUDGMENT d
where d.doc_file_name = id.doc_file_name
);

----196 中国专利的判决书数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_196
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_JUDGMENT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----196 中国专利的判决书数据 校验结果
create materialized view MV_CHECKS_RESULT_196
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
          s.data_res = '中国专利的判决书数据'
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
          S_CHINA_PATENT_JUDGMENT d
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
    id.data_res='中国专利的判决书数据'
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
  S_CHINA_PATENT_JUDGMENT s
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
      where d.data_res='中国专利的判决书数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_JUDGMENT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----209 中国生物序列深加工数据-智能 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_209
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国生物序列深加工数据-智能'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_BIOLOGICAL_PROCESS d
where d.doc_file_name = id.doc_file_name
);

----209 中国生物序列深加工数据-智能 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_209
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_BIOLOGICAL_PROCESS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----209 中国生物序列深加工数据-智能 校验结果
create materialized view MV_CHECKS_RESULT_209
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
          s.data_res = '中国生物序列深加工数据-智能'
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
          S_CHINA_BIOLOGICAL_PROCESS d
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
    id.data_res='中国生物序列深加工数据-智能'
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
  S_CHINA_BIOLOGICAL_PROCESS s
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
      where d.data_res='中国生物序列深加工数据-智能'
      and
      exists
      (
        select
        1
        from
        S_CHINA_BIOLOGICAL_PROCESS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----209.1 中国生物序列深加工数据-中文 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_2091
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国生物序列深加工数据-中文'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_T_BIOLOGICAL_CN d
where d.doc_file_name = id.doc_file_name
);

----209.1 中国生物序列深加工数据-中文 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_2091
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_T_BIOLOGICAL_CN sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----209.1 中国生物序列深加工数据-中文 校验结果
create materialized view MV_CHECKS_RESULT_2091
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
          s.data_res = '中国生物序列深加工数据-中文'
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
          S_T_BIOLOGICAL_CN d
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
    id.data_res='中国生物序列深加工数据-中文'
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
  S_T_BIOLOGICAL_CN s
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
      where d.data_res='中国生物序列深加工数据-中文'
      and
      exists
      (
        select
        1
        from
        S_T_BIOLOGICAL_CN s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----209.2 中国生物序列深加工数据-翻译 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_2092
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国生物序列深加工数据-翻译'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_T_BIOLOGICAL_FY d
where d.doc_file_name = id.doc_file_name
);

----209.2 中国生物序列深加工数据-翻译 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_2092
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_T_BIOLOGICAL_FY sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----209.2 中国生物序列深加工数据-翻译 校验结果
create materialized view MV_CHECKS_RESULT_2092
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
          s.data_res = '中国生物序列深加工数据-翻译'
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
          S_T_BIOLOGICAL_FY d
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
    id.data_res='中国生物序列深加工数据-翻译'
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
  S_T_BIOLOGICAL_FY s
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
      where d.data_res='中国生物序列深加工数据-翻译'
      and
      exists
      (
        select
        1
        from
        S_T_BIOLOGICAL_FY s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----210 中国中药专利翻译数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_210
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国中药专利翻译数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_MEDICINE_PATENT_TRANS d
where d.doc_file_name = id.doc_file_name
);

----210 中国中药专利翻译数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_210
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_MEDICINE_PATENT_TRANS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----210 中国中药专利翻译数据 校验结果
create materialized view MV_CHECKS_RESULT_210
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
          s.data_res = '中国中药专利翻译数据'
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
          S_CHINA_MEDICINE_PATENT_TRANS d
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
    id.data_res='中国中药专利翻译数据'
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
  S_CHINA_MEDICINE_PATENT_TRANS s
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
      where d.data_res='中国中药专利翻译数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_MEDICINE_PATENT_TRANS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----211 中国化学药物专利深加工数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_211
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国化学药物专利深加工数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PHARMACEUTICAL_PATENT d
where d.doc_file_name = id.doc_file_name
);

----211 中国化学药物专利深加工数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_211
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PHARMACEUTICAL_PATENT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----211 中国化学药物专利深加工数据 校验结果
create materialized view MV_CHECKS_RESULT_211
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
          s.data_res = '中国化学药物专利深加工数据'
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
          S_CHINA_PHARMACEUTICAL_PATENT d
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
    id.data_res='中国化学药物专利深加工数据'
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
  S_CHINA_PHARMACEUTICAL_PATENT s
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
      where d.data_res='中国化学药物专利深加工数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PHARMACEUTICAL_PATENT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----212 中国中药专利深加工数据 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_212
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国中药专利深加工数据'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_MEDICINE_PATENT_HANDLE d
where d.doc_file_name = id.doc_file_name
);

----212 中国中药专利深加工数据 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_212
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_MEDICINE_PATENT_HANDLE sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----212 中国中药专利深加工数据 校验结果
create materialized view MV_CHECKS_RESULT_212
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
          s.data_res = '中国中药专利深加工数据'
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
          S_CHINA_MEDICINE_PATENT_HANDLE d
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
    id.data_res='中国中药专利深加工数据'
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
  S_CHINA_MEDICINE_PATENT_HANDLE s
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
      where d.data_res='中国中药专利深加工数据'
      and
      exists
      (
        select
        1
        from
        S_CHINA_MEDICINE_PATENT_HANDLE s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----213 中国专利摘要英文翻译数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_213
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '中国专利摘要英文翻译数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_ABSTRACTS d
where d.doc_file_name = id.doc_file_name
);

----213 中国专利摘要英文翻译数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_213
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CHINA_PATENT_ABSTRACTS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----213 中国专利摘要英文翻译数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_213
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
          s.data_res = '中国专利摘要英文翻译数据（标准化）'
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
          S_CHINA_PATENT_ABSTRACTS d
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
    id.data_res='中国专利摘要英文翻译数据（标准化）'
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
  S_CHINA_PATENT_ABSTRACTS s
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
      where d.data_res='中国专利摘要英文翻译数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_CHINA_PATENT_ABSTRACTS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----214 DOCDB数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_214
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = 'DOCDB数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_DOCDB d
where d.doc_file_name = id.doc_file_name
);

----214 DOCDB数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_214
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_DOCDB sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----214 DOCDB数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_214
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
          s.data_res = 'DOCDB数据（标准化）'
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
          S_DOCDB d
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
    id.data_res='DOCDB数据（标准化）'
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
  S_DOCDB s
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
      where d.data_res='DOCDB数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_DOCDB s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----215 国际知识产权组织专利著录项及全文数据（WIPO)（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_215
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '国际知识产权组织专利著录项及全文数据（WIPO)（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_WIPO_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----215 国际知识产权组织专利著录项及全文数据（WIPO)（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_215
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_WIPO_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----215 国际知识产权组织专利著录项及全文数据（WIPO)（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_215
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
          s.data_res = '国际知识产权组织专利著录项及全文数据（WIPO)（标准化）'
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
          S_WIPO_PATENT_DESCRIPTION d
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
    id.data_res='国际知识产权组织专利著录项及全文数据（WIPO)（标准化）'
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
  S_WIPO_PATENT_DESCRIPTION s
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
      where d.data_res='国际知识产权组织专利著录项及全文数据（WIPO)（标准化）'
      and
      exists
      (
        select
        1
        from
        S_WIPO_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----216 加拿大专利著录项及全文数据（CA）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_216
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '加拿大专利著录项及全文数据（CA）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CANADIAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----216 加拿大专利著录项及全文数据（CA）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_216
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_CANADIAN_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----216 加拿大专利著录项及全文数据（CA）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_216
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
          s.data_res = '加拿大专利著录项及全文数据（CA）（标准化）'
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
          S_CANADIAN_PATENT_DESCRIPTION d
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
    id.data_res='加拿大专利著录项及全文数据（CA）（标准化）'
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
  S_CANADIAN_PATENT_DESCRIPTION s
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
      where d.data_res='加拿大专利著录项及全文数据（CA）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_CANADIAN_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----217 俄罗斯专利著录项及全文数据（RU）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_217
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '俄罗斯专利著录项及全文数据（RU）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_RUSSIAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----217 俄罗斯专利著录项及全文数据（RU）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_217
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_RUSSIAN_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----217 俄罗斯专利著录项及全文数据（RU）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_217
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
          s.data_res = '俄罗斯专利著录项及全文数据（RU）（标准化）'
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
          S_RUSSIAN_PATENT_DESCRIPTION d
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
    id.data_res='俄罗斯专利著录项及全文数据（RU）（标准化）'
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
  S_RUSSIAN_PATENT_DESCRIPTION s
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
      where d.data_res='俄罗斯专利著录项及全文数据（RU）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_RUSSIAN_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----218 澳大利亚专利全文文本数据（AU）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_218
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '澳大利亚专利全文文本数据（AU）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AUSTRALIAN_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----218 澳大利亚专利全文文本数据（AU）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_218
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_AUSTRALIAN_PATENT_FULLTEXT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----218 澳大利亚专利全文文本数据（AU）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_218
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
          s.data_res = '澳大利亚专利全文文本数据（AU）（标准化）'
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
          S_AUSTRALIAN_PATENT_FULLTEXT d
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
    id.data_res='澳大利亚专利全文文本数据（AU）（标准化）'
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
  S_AUSTRALIAN_PATENT_FULLTEXT s
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
      where d.data_res='澳大利亚专利全文文本数据（AU）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_AUSTRALIAN_PATENT_FULLTEXT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----219 德国专利著录项及全文数据（DE）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_219
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '德国专利著录项及全文数据（DE）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_GERMAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----219 德国专利著录项及全文数据（DE）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_219
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_GERMAN_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----219 德国专利著录项及全文数据（DE）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_219
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
          s.data_res = '德国专利著录项及全文数据（DE）（标准化）'
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
          S_GERMAN_PATENT_DESCRIPTION d
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
    id.data_res='德国专利著录项及全文数据（DE）（标准化）'
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
  S_GERMAN_PATENT_DESCRIPTION s
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
      where d.data_res='德国专利著录项及全文数据（DE）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_GERMAN_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----220 法国专利著录项及全文数据（FR）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_220
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '法国专利著录项及全文数据（FR）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_FRENCH_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----220 法国专利著录项及全文数据（FR）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_220
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_FRENCH_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----220 法国专利著录项及全文数据（FR）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_220
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
          s.data_res = '法国专利著录项及全文数据（FR）（标准化）'
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
          S_FRENCH_PATENT_DESCRIPTION d
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
    id.data_res='法国专利著录项及全文数据（FR）（标准化）'
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
  S_FRENCH_PATENT_DESCRIPTION s
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
      where d.data_res='法国专利著录项及全文数据（FR）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_FRENCH_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----221 台湾专利著录项及全文数据（TW）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_221
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '台湾专利著录项及全文数据（TW）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_TAIWAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----221 台湾专利著录项及全文数据（TW）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_221
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_TAIWAN_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----221 台湾专利著录项及全文数据（TW）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_221
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
          s.data_res = '台湾专利著录项及全文数据（TW）（标准化）'
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
          S_TAIWAN_PATENT_DESCRIPTION d
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
    id.data_res='台湾专利著录项及全文数据（TW）（标准化）'
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
  S_TAIWAN_PATENT_DESCRIPTION s
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
      where d.data_res='台湾专利著录项及全文数据（TW）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_TAIWAN_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----222 香港专利著录项数据（HK）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_222
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '香港专利著录项数据（HK）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_HONGKONG_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----222 香港专利著录项数据（HK）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_222
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_HONGKONG_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----222 香港专利著录项数据（HK）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_222
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
          s.data_res = '香港专利著录项数据（HK）（标准化）'
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
          S_HONGKONG_PATENT_DESCRIPTION d
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
    id.data_res='香港专利著录项数据（HK）（标准化）'
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
  S_HONGKONG_PATENT_DESCRIPTION s
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
      where d.data_res='香港专利著录项数据（HK）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_HONGKONG_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----223 澳门专利著录项数据（MO）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_223
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '澳门专利著录项数据（MO）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_MACAO_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----223 澳门专利著录项数据（MO）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_223
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_MACAO_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----223 澳门专利著录项数据（MO）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_223
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
          s.data_res = '澳门专利著录项数据（MO）（标准化）'
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
          S_MACAO_PATENT_DESCRIPTION d
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
    id.data_res='澳门专利著录项数据（MO）（标准化）'
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
  S_MACAO_PATENT_DESCRIPTION s
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
      where d.data_res='澳门专利著录项数据（MO）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_MACAO_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----224 欧亚组织专利著录项及全文数据（EA）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_224
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '欧亚组织专利著录项及全文数据（EA）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_EURASIAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----224 欧亚组织专利著录项及全文数据（EA）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_224
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_EURASIAN_PATENT_DESCRIPTION sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----224 欧亚组织专利著录项及全文数据（EA）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_224
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
          s.data_res = '欧亚组织专利著录项及全文数据（EA）（标准化）'
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
          S_EURASIAN_PATENT_DESCRIPTION d
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
    id.data_res='欧亚组织专利著录项及全文数据（EA）（标准化）'
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
  S_EURASIAN_PATENT_DESCRIPTION s
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
      where d.data_res='欧亚组织专利著录项及全文数据（EA）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_EURASIAN_PATENT_DESCRIPTION s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----225 日本外观设计专利数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_225
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '日本外观设计专利数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_JAPAN_DESIGN_PATENT d
where d.doc_file_name = id.doc_file_name
);

----225 日本外观设计专利数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_225
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_JAPAN_DESIGN_PATENT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----225 日本外观设计专利数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_225
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
          s.data_res = '日本外观设计专利数据（标准化）'
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
          S_JAPAN_DESIGN_PATENT d
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
    id.data_res='日本外观设计专利数据（标准化）'
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
  S_JAPAN_DESIGN_PATENT s
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
      where d.data_res='日本外观设计专利数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_JAPAN_DESIGN_PATENT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----226 德国外观设计专利数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_226
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '德国外观设计专利数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_GERMAN_DESIGN_PATENT d
where d.doc_file_name = id.doc_file_name
);

----226 德国外观设计专利数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_226
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_GERMAN_DESIGN_PATENT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----226 德国外观设计专利数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_226
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
          s.data_res = '德国外观设计专利数据（标准化）'
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
          S_GERMAN_DESIGN_PATENT d
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
    id.data_res='德国外观设计专利数据（标准化）'
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
  S_GERMAN_DESIGN_PATENT s
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
      where d.data_res='德国外观设计专利数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_GERMAN_DESIGN_PATENT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----227 法国外观设计专利数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_227
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '法国外观设计专利数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_FRENCH_DESIGN_PATENT d
where d.doc_file_name = id.doc_file_name
);

----227 法国外观设计专利数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_227
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_FRENCH_DESIGN_PATENT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----227 法国外观设计专利数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_227
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
          s.data_res = '法国外观设计专利数据（标准化）'
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
          S_FRENCH_DESIGN_PATENT d
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
    id.data_res='法国外观设计专利数据（标准化）'
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
  S_FRENCH_DESIGN_PATENT s
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
      where d.data_res='法国外观设计专利数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_FRENCH_DESIGN_PATENT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----228 俄罗斯外观设计专利数据（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_228
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '俄罗斯外观设计专利数据（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_RUSSIAN_DESIGN_PATENT d
where d.doc_file_name = id.doc_file_name
);

----228 俄罗斯外观设计专利数据（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_228
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_RUSSIAN_DESIGN_PATENT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----228 俄罗斯外观设计专利数据（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_228
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
          s.data_res = '俄罗斯外观设计专利数据（标准化）'
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
          S_RUSSIAN_DESIGN_PATENT d
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
    id.data_res='俄罗斯外观设计专利数据（标准化）'
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
  S_RUSSIAN_DESIGN_PATENT s
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
      where d.data_res='俄罗斯外观设计专利数据（标准化）'
      and
      exists
      (
        select
        1
        from
        S_RUSSIAN_DESIGN_PATENT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----229 日本专利文摘英文翻译数据（PAJ)（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_229
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '日本专利文摘英文翻译数据（PAJ)（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_JAPAN_PATENT_ABSTRACTS d
where d.doc_file_name = id.doc_file_name
);

----229 日本专利文摘英文翻译数据（PAJ)（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_229
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_JAPAN_PATENT_ABSTRACTS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----229 日本专利文摘英文翻译数据（PAJ)（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_229
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
          s.data_res = '日本专利文摘英文翻译数据（PAJ)（标准化）'
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
          S_JAPAN_PATENT_ABSTRACTS d
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
    id.data_res='日本专利文摘英文翻译数据（PAJ)（标准化）'
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
  S_JAPAN_PATENT_ABSTRACTS s
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
      where d.data_res='日本专利文摘英文翻译数据（PAJ)（标准化）'
      and
      exists
      (
        select
        1
        from
        S_JAPAN_PATENT_ABSTRACTS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----230 韩国专利文摘英文翻译数据(KPA)（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_230
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '韩国专利文摘英文翻译数据(KPA)（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_KOREA_PATENT_ABSTRACTS d
where d.doc_file_name = id.doc_file_name
);

----230 韩国专利文摘英文翻译数据(KPA)（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_230
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_KOREA_PATENT_ABSTRACTS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----230 韩国专利文摘英文翻译数据(KPA)（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_230
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
          s.data_res = '韩国专利文摘英文翻译数据(KPA)（标准化）'
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
          S_KOREA_PATENT_ABSTRACTS d
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
    id.data_res='韩国专利文摘英文翻译数据(KPA)（标准化）'
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
  S_KOREA_PATENT_ABSTRACTS s
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
      where d.data_res='韩国专利文摘英文翻译数据(KPA)（标准化）'
      and
      exists
      (
        select
        1
        from
        S_KOREA_PATENT_ABSTRACTS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----231 世界专利法律状态（INPADOC）（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_231
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '世界专利法律状态（INPADOC）（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_WORLD_PATENT_LAWSTATUS d
where d.doc_file_name = id.doc_file_name
);

----231 世界专利法律状态（INPADOC）（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_231
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_WORLD_PATENT_LAWSTATUS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----231 世界专利法律状态（INPADOC）（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_231
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
          s.data_res = '世界专利法律状态（INPADOC）（标准化）'
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
          S_WORLD_PATENT_LAWSTATUS d
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
    id.data_res='世界专利法律状态（INPADOC）（标准化）'
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
  S_WORLD_PATENT_LAWSTATUS s
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
      where d.data_res='世界专利法律状态（INPADOC）（标准化）'
      and
      exists
      (
        select
        1
        from
        S_WORLD_PATENT_LAWSTATUS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----232 日本引文(STD_JP_CIT)（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_232
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '日本引文(STD_JP_CIT)（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_STD_JP_CIT d
where d.doc_file_name = id.doc_file_name
);

----232 日本引文(STD_JP_CIT)（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_232
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_STD_JP_CIT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----232 日本引文(STD_JP_CIT)（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_232
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
          s.data_res = '日本引文(STD_JP_CIT)（标准化）'
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
          S_STD_JP_CIT d
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
    id.data_res='日本引文(STD_JP_CIT)（标准化）'
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
  S_STD_JP_CIT s
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
      where d.data_res='日本引文(STD_JP_CIT)（标准化）'
      and
      exists
      (
        select
        1
        from
        S_STD_JP_CIT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----233 韩国引文(STD_KR_CIT)（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_233
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '韩国引文(STD_KR_CIT)（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_STD_KR_CIT d
where d.doc_file_name = id.doc_file_name
);

----233 韩国引文(STD_KR_CIT)（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_233
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_STD_KR_CIT sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----233 韩国引文(STD_KR_CIT)（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_233
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
          s.data_res = '韩国引文(STD_KR_CIT)（标准化）'
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
          S_STD_KR_CIT d
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
    id.data_res='韩国引文(STD_KR_CIT)（标准化）'
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
  S_STD_KR_CIT s
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
      where d.data_res='韩国引文(STD_KR_CIT)（标准化）'
      and
      exists
      (
        select
        1
        from
        S_STD_KR_CIT s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);




----234 韩国法律状态数据(STD_KR_PRS)（标准化） 多余索引列表
create materialized view MV_EXTRA_IDX_INFO_234
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '韩国法律状态数据(STD_KR_PRS)（标准化）'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_STD_KR_PRS d
where d.doc_file_name = id.doc_file_name
);

----234 韩国法律状态数据(STD_KR_PRS)（标准化） 多余数据列表
create materialized view MV_EXTRA_DOC_INFO_234
refresh force on demand
as
select
sta.id, to_char(sta.ori_pub_date, 'yyyyMMdd') pub_date, sta.file_path, sta.archive_inner_path, sta.doc_file_name, rownum as rownb
from
S_STD_KR_PRS sta
where
not exists
(
select 1
from
s_index_file_detail id
where
sta.doc_file_name = id.doc_file_name
);


----234 韩国法律状态数据(STD_KR_PRS)（标准化） 校验结果
create materialized view MV_CHECKS_RESULT_234
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
          s.data_res = '韩国法律状态数据(STD_KR_PRS)（标准化）'
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
          S_STD_KR_PRS d
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
    id.data_res='韩国法律状态数据(STD_KR_PRS)（标准化）'
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
  S_STD_KR_PRS s
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
      where d.data_res='韩国法律状态数据(STD_KR_PRS)（标准化）'
      and
      exists
      (
        select
        1
        from
        S_STD_KR_PRS s
        where s.doc_file_name = d.doc_file_name
      )
      group by d.pub_date
) matched_Rec
on
stat.pub_date = matched_Rec.pub_date
);
