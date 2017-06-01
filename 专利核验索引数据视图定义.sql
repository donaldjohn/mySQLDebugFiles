



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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
where d.id.doc_file_name
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
sta.id.doc_file_name
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
  nvl(matched_Rec.matched_ds_count, 0) matched_dis_count,
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
      d.pub_date, count(1) as matched_count, count(distinct d.doc_file_name) as matched_ds_count
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
