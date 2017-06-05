



----3 �й�ר����׼��ȫ���ı����ݶ��������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_003;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_003;
--�½�
create materialized view MV_EXTRA_IDX_INFO_003
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '�й�ר����׼��ȫ���ı�����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_STANDARDFULLTXT d
where d.doc_file_name = id.doc_file_name
);

----3 �й�ר����׼��ȫ���ı����ݶ��������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_003;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_003;
--�½�
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


----3 �й�ר����׼��ȫ���ı����� У����
--�鿴
select * from MV_CHECKS_RESULT_003;
--ɾ��
drop materialized view MV_CHECKS_RESULT_003;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '�й�ר����׼��ȫ���ı�����'
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
    id.data_res='�й�ר����׼��ȫ���ı�����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='�й�ר����׼��ȫ���ı�����'
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




----6 �й�ר����¼��Ŀ����ժ���ݶ��������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_006;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_006;
--�½�
create materialized view MV_EXTRA_IDX_INFO_006
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '�й�ר����¼��Ŀ����ժ����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_BIBLIOGRAPHIC d
where d.doc_file_name = id.doc_file_name
);

----6 �й�ר����¼��Ŀ����ժ���ݶ��������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_006;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_006;
--�½�
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


----6 �й�ר����¼��Ŀ����ժ���� У����
--�鿴
select * from MV_CHECKS_RESULT_006;
--ɾ��
drop materialized view MV_CHECKS_RESULT_006;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '�й�ר����¼��Ŀ����ժ����'
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
    id.data_res='�й�ר����¼��Ŀ����ժ����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='�й�ר����¼��Ŀ����ժ����'
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




----50 ����ר��ȫ���ı����ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_050;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_050;
--�½�
create materialized view MV_EXTRA_IDX_INFO_050
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '����ר��ȫ���ı����ݣ���׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AMERICAN_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----50 ����ר��ȫ���ı����ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_050;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_050;
--�½�
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


----50 ����ר��ȫ���ı����ݣ���׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_050;
--ɾ��
drop materialized view MV_CHECKS_RESULT_050;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '����ר��ȫ���ı����ݣ���׼����'
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
    id.data_res='����ר��ȫ���ı����ݣ���׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='����ר��ȫ���ı����ݣ���׼����'
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




----51 ŷר��ר��ȫ���ı����ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_051;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_051;
--�½�
create materialized view MV_EXTRA_IDX_INFO_051
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = 'ŷר��ר��ȫ���ı����ݣ���׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_EUROPEAN_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----51 ŷר��ר��ȫ���ı����ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_051;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_051;
--�½�
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


----51 ŷר��ר��ȫ���ı����ݣ���׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_051;
--ɾ��
drop materialized view MV_CHECKS_RESULT_051;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = 'ŷר��ר��ȫ���ı����ݣ���׼����'
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
    id.data_res='ŷר��ר��ȫ���ı����ݣ���׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='ŷר��ר��ȫ���ı����ݣ���׼����'
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




----52 ����ר��ȫ�Ĵ��뻯���ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_052;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_052;
--�½�
create materialized view MV_EXTRA_IDX_INFO_052
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '����ר��ȫ�Ĵ��뻯���ݣ���׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_KOREAN_PATENT_FULLTEXTCODE d
where d.doc_file_name = id.doc_file_name
);

----52 ����ר��ȫ�Ĵ��뻯���ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_052;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_052;
--�½�
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


----52 ����ר��ȫ�Ĵ��뻯���ݣ���׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_052;
--ɾ��
drop materialized view MV_CHECKS_RESULT_052;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '����ר��ȫ�Ĵ��뻯���ݣ���׼����'
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
    id.data_res='����ר��ȫ�Ĵ��뻯���ݣ���׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='����ר��ȫ�Ĵ��뻯���ݣ���׼����'
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




----53 ��ʿר��ȫ�Ĵ��뻯���ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_053;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_053;
--�½�
create materialized view MV_EXTRA_IDX_INFO_053
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '��ʿר��ȫ�Ĵ��뻯���ݣ���׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_SWISS_PATENT_FULLTEXTCODE d
where d.doc_file_name = id.doc_file_name
);

----53 ��ʿר��ȫ�Ĵ��뻯���ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_053;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_053;
--�½�
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


----53 ��ʿר��ȫ�Ĵ��뻯���ݣ���׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_053;
--ɾ��
drop materialized view MV_CHECKS_RESULT_053;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '��ʿר��ȫ�Ĵ��뻯���ݣ���׼����'
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
    id.data_res='��ʿר��ȫ�Ĵ��뻯���ݣ���׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='��ʿר��ȫ�Ĵ��뻯���ݣ���׼����'
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




----54 Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_054;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_054;
--�½�
create materialized view MV_EXTRA_IDX_INFO_054
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = 'Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_BRITISH_PATENT_FULLTEXTCODE d
where d.doc_file_name = id.doc_file_name
);

----54 Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_054;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_054;
--�½�
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


----54 Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_054;
--ɾ��
drop materialized view MV_CHECKS_RESULT_054;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = 'Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼����'
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
    id.data_res='Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼����'
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




----55 �ձ�ר��ȫ�Ĵ��뻯���ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_055;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_055;
--�½�
create materialized view MV_EXTRA_IDX_INFO_055
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '�ձ�ר��ȫ�Ĵ��뻯���ݣ���׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_JAPAN_PATENT_FULLTEXTCODE d
where d.doc_file_name = id.doc_file_name
);

----55 �ձ�ר��ȫ�Ĵ��뻯���ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_055;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_055;
--�½�
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


----55 �ձ�ר��ȫ�Ĵ��뻯���ݣ���׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_055;
--ɾ��
drop materialized view MV_CHECKS_RESULT_055;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '�ձ�ר��ȫ�Ĵ��뻯���ݣ���׼����'
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
    id.data_res='�ձ�ר��ȫ�Ĵ��뻯���ݣ���׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='�ձ�ר��ȫ�Ĵ��뻯���ݣ���׼����'
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




----103 ����ʱר��ȫ�����ݣ�BE������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_103;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_103;
--�½�
create materialized view MV_EXTRA_IDX_INFO_103
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '����ʱר��ȫ�����ݣ�BE������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_BELGIAN_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----103 ����ʱר��ȫ�����ݣ�BE������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_103;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_103;
--�½�
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


----103 ����ʱר��ȫ�����ݣ�BE������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_103;
--ɾ��
drop materialized view MV_CHECKS_RESULT_103;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '����ʱר��ȫ�����ݣ�BE������׼����'
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
    id.data_res='����ʱר��ȫ�����ݣ�BE������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='����ʱר��ȫ�����ݣ�BE������׼����'
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




----104 �µ���ר��ȫ�����ݣ�AT������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_104;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_104;
--�½�
create materialized view MV_EXTRA_IDX_INFO_104
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '�µ���ר��ȫ�����ݣ�AT������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AUSTRIA_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----104 �µ���ר��ȫ�����ݣ�AT������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_104;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_104;
--�½�
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


----104 �µ���ר��ȫ�����ݣ�AT������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_104;
--ɾ��
drop materialized view MV_CHECKS_RESULT_104;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '�µ���ר��ȫ�����ݣ�AT������׼����'
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
    id.data_res='�µ���ר��ȫ�����ݣ�AT������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='�µ���ר��ȫ�����ݣ�AT������׼����'
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




----105 ������ר��ȫ�����ݣ�ES������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_105;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_105;
--�½�
create materialized view MV_EXTRA_IDX_INFO_105
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '������ר��ȫ�����ݣ�ES������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_SPANISH_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----105 ������ר��ȫ�����ݣ�ES������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_105;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_105;
--�½�
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


----105 ������ר��ȫ�����ݣ�ES������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_105;
--ɾ��
drop materialized view MV_CHECKS_RESULT_105;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '������ר��ȫ�����ݣ�ES������׼����'
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
    id.data_res='������ר��ȫ�����ݣ�ES������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='������ר��ȫ�����ݣ�ES������׼����'
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




----106 ����ר����¼�ȫ�����ݣ�PL������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_106;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_106;
--�½�
create materialized view MV_EXTRA_IDX_INFO_106
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '����ר����¼�ȫ�����ݣ�PL������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_POLAND_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----106 ����ר����¼�ȫ�����ݣ�PL������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_106;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_106;
--�½�
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


----106 ����ר����¼�ȫ�����ݣ�PL������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_106;
--ɾ��
drop materialized view MV_CHECKS_RESULT_106;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '����ר����¼�ȫ�����ݣ�PL������׼����'
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
    id.data_res='����ר����¼�ȫ�����ݣ�PL������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='����ר����¼�ȫ�����ݣ�PL������׼����'
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




----107 ��ɫ��ר����¼�ȫ�����ݣ�IL������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_107;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_107;
--�½�
create materialized view MV_EXTRA_IDX_INFO_107
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '��ɫ��ר����¼�ȫ�����ݣ�IL������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_ISRAEL_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----107 ��ɫ��ר����¼�ȫ�����ݣ�IL������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_107;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_107;
--�½�
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


----107 ��ɫ��ר����¼�ȫ�����ݣ�IL������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_107;
--ɾ��
drop materialized view MV_CHECKS_RESULT_107;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '��ɫ��ר����¼�ȫ�����ݣ�IL������׼����'
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
    id.data_res='��ɫ��ר����¼�ȫ�����ݣ�IL������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='��ɫ��ר����¼�ȫ�����ݣ�IL������׼����'
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




----108 �¼���ר����¼�ȫ�����ݣ�SG������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_108;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_108;
--�½�
create materialized view MV_EXTRA_IDX_INFO_108
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '�¼���ר����¼�ȫ�����ݣ�SG������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_SINGAPORE_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----108 �¼���ר����¼�ȫ�����ݣ�SG������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_108;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_108;
--�½�
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


----108 �¼���ר����¼�ȫ�����ݣ�SG������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_108;
--ɾ��
drop materialized view MV_CHECKS_RESULT_108;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '�¼���ר����¼�ȫ�����ݣ�SG������׼����'
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
    id.data_res='�¼���ר����¼�ȫ�����ݣ�SG������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='�¼���ר����¼�ȫ�����ݣ�SG������׼����'
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




----213 �й�ר��ժҪӢ�ķ������ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_213;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_213;
--�½�
create materialized view MV_EXTRA_IDX_INFO_213
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '�й�ר��ժҪӢ�ķ������ݣ���׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CHINA_PATENT_ABSTRACTS d
where d.doc_file_name = id.doc_file_name
);

----213 �й�ר��ժҪӢ�ķ������ݣ���׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_213;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_213;
--�½�
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


----213 �й�ר��ժҪӢ�ķ������ݣ���׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_213;
--ɾ��
drop materialized view MV_CHECKS_RESULT_213;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '�й�ר��ժҪӢ�ķ������ݣ���׼����'
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
    id.data_res='�й�ר��ժҪӢ�ķ������ݣ���׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='�й�ר��ժҪӢ�ķ������ݣ���׼����'
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




----215 ����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_215;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_215;
--�½�
create materialized view MV_EXTRA_IDX_INFO_215
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_WIPO_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----215 ����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_215;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_215;
--�½�
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


----215 ����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_215;
--ɾ��
drop materialized view MV_CHECKS_RESULT_215;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼����'
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
    id.data_res='����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼����'
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




----216 ���ô�ר����¼�ȫ�����ݣ�CA������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_216;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_216;
--�½�
create materialized view MV_EXTRA_IDX_INFO_216
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '���ô�ר����¼�ȫ�����ݣ�CA������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_CANADIAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----216 ���ô�ר����¼�ȫ�����ݣ�CA������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_216;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_216;
--�½�
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


----216 ���ô�ר����¼�ȫ�����ݣ�CA������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_216;
--ɾ��
drop materialized view MV_CHECKS_RESULT_216;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '���ô�ר����¼�ȫ�����ݣ�CA������׼����'
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
    id.data_res='���ô�ר����¼�ȫ�����ݣ�CA������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='���ô�ר����¼�ȫ�����ݣ�CA������׼����'
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




----217 ����˹ר����¼�ȫ�����ݣ�RU������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_217;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_217;
--�½�
create materialized view MV_EXTRA_IDX_INFO_217
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '����˹ר����¼�ȫ�����ݣ�RU������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_RUSSIAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----217 ����˹ר����¼�ȫ�����ݣ�RU������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_217;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_217;
--�½�
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


----217 ����˹ר����¼�ȫ�����ݣ�RU������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_217;
--ɾ��
drop materialized view MV_CHECKS_RESULT_217;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '����˹ר����¼�ȫ�����ݣ�RU������׼����'
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
    id.data_res='����˹ר����¼�ȫ�����ݣ�RU������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='����˹ר����¼�ȫ�����ݣ�RU������׼����'
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




----218 �Ĵ�����ר��ȫ���ı����ݣ�AU������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_218;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_218;
--�½�
create materialized view MV_EXTRA_IDX_INFO_218
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '�Ĵ�����ר��ȫ���ı����ݣ�AU������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_AUSTRALIAN_PATENT_FULLTEXT d
where d.doc_file_name = id.doc_file_name
);

----218 �Ĵ�����ר��ȫ���ı����ݣ�AU������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_218;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_218;
--�½�
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


----218 �Ĵ�����ר��ȫ���ı����ݣ�AU������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_218;
--ɾ��
drop materialized view MV_CHECKS_RESULT_218;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '�Ĵ�����ר��ȫ���ı����ݣ�AU������׼����'
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
    id.data_res='�Ĵ�����ר��ȫ���ı����ݣ�AU������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='�Ĵ�����ר��ȫ���ı����ݣ�AU������׼����'
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




----219 �¹�ר����¼�ȫ�����ݣ�DE������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_219;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_219;
--�½�
create materialized view MV_EXTRA_IDX_INFO_219
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '�¹�ר����¼�ȫ�����ݣ�DE������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_GERMAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----219 �¹�ר����¼�ȫ�����ݣ�DE������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_219;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_219;
--�½�
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


----219 �¹�ר����¼�ȫ�����ݣ�DE������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_219;
--ɾ��
drop materialized view MV_CHECKS_RESULT_219;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '�¹�ר����¼�ȫ�����ݣ�DE������׼����'
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
    id.data_res='�¹�ר����¼�ȫ�����ݣ�DE������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='�¹�ר����¼�ȫ�����ݣ�DE������׼����'
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




----220 ����ר����¼�ȫ�����ݣ�FR������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_220;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_220;
--�½�
create materialized view MV_EXTRA_IDX_INFO_220
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '����ר����¼�ȫ�����ݣ�FR������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_FRENCH_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----220 ����ר����¼�ȫ�����ݣ�FR������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_220;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_220;
--�½�
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


----220 ����ר����¼�ȫ�����ݣ�FR������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_220;
--ɾ��
drop materialized view MV_CHECKS_RESULT_220;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '����ר����¼�ȫ�����ݣ�FR������׼����'
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
    id.data_res='����ר����¼�ȫ�����ݣ�FR������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='����ר����¼�ȫ�����ݣ�FR������׼����'
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




----221 ̨��ר����¼�ȫ�����ݣ�TW������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_221;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_221;
--�½�
create materialized view MV_EXTRA_IDX_INFO_221
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '̨��ר����¼�ȫ�����ݣ�TW������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_TAIWAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----221 ̨��ר����¼�ȫ�����ݣ�TW������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_221;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_221;
--�½�
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


----221 ̨��ר����¼�ȫ�����ݣ�TW������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_221;
--ɾ��
drop materialized view MV_CHECKS_RESULT_221;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '̨��ר����¼�ȫ�����ݣ�TW������׼����'
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
    id.data_res='̨��ר����¼�ȫ�����ݣ�TW������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='̨��ר����¼�ȫ�����ݣ�TW������׼����'
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




----222 ���ר����¼�����ݣ�HK������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_222;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_222;
--�½�
create materialized view MV_EXTRA_IDX_INFO_222
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '���ר����¼�����ݣ�HK������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_HONGKONG_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----222 ���ר����¼�����ݣ�HK������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_222;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_222;
--�½�
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


----222 ���ר����¼�����ݣ�HK������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_222;
--ɾ��
drop materialized view MV_CHECKS_RESULT_222;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '���ר����¼�����ݣ�HK������׼����'
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
    id.data_res='���ר����¼�����ݣ�HK������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='���ר����¼�����ݣ�HK������׼����'
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




----223 ����ר����¼�����ݣ�MO������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_223;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_223;
--�½�
create materialized view MV_EXTRA_IDX_INFO_223
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '����ר����¼�����ݣ�MO������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_MACAO_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----223 ����ר����¼�����ݣ�MO������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_223;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_223;
--�½�
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


----223 ����ר����¼�����ݣ�MO������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_223;
--ɾ��
drop materialized view MV_CHECKS_RESULT_223;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '����ר����¼�����ݣ�MO������׼����'
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
    id.data_res='����ר����¼�����ݣ�MO������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='����ר����¼�����ݣ�MO������׼����'
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




----224 ŷ����֯ר����¼�ȫ�����ݣ�EA������׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_224;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_224;
--�½�
create materialized view MV_EXTRA_IDX_INFO_224
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = 'ŷ����֯ר����¼�ȫ�����ݣ�EA������׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_EURASIAN_PATENT_DESCRIPTION d
where d.doc_file_name = id.doc_file_name
);

----224 ŷ����֯ר����¼�ȫ�����ݣ�EA������׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_224;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_224;
--�½�
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


----224 ŷ����֯ר����¼�ȫ�����ݣ�EA������׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_224;
--ɾ��
drop materialized view MV_CHECKS_RESULT_224;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = 'ŷ����֯ר����¼�ȫ�����ݣ�EA������׼����'
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
    id.data_res='ŷ����֯ר����¼�ȫ�����ݣ�EA������׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='ŷ����֯ר����¼�ȫ�����ݣ�EA������׼����'
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




----229 �ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼�������������б�
--�鿴
select * from MV_EXTRA_IDX_INFO_229;
--ɾ��
drop materialized view MV_EXTRA_IDX_INFO_229;
--�½�
create materialized view MV_EXTRA_IDX_INFO_229
refresh force on demand
as
select
id.pub_date, id.pub_kind, id.doc_file, id.index_file_path, id.doc_file_name
from
s_index_file_detail id
where
id.data_res = '�ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼����'
and
56 = length(id.doc_file_name)
and
not exists
(
select 1 from S_JAPAN_PATENT_ABSTRACTS d
where d.doc_file_name = id.doc_file_name
);

----229 �ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼�������������б�
--�鿴
select * from MV_EXTRA_DOC_INFO_229;
--ɾ��
drop materialized view MV_EXTRA_DOC_INFO_229;
--�½�
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


----229 �ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼���� У����
--�鿴
select * from MV_CHECKS_RESULT_229;
--ɾ��
drop materialized view MV_CHECKS_RESULT_229;
--�½�
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
          --����������Ҫ��
          select
          s.date_publication as pub_date,
          sum(s.doclist_count) as pat_cnt_Index
          from
          s_index_file_info s
          where
          s.data_res = '�ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼����'
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
    id.data_res='�ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼����'
    group by id.pub_date, id.doc_file_name
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
      where d.data_res='�ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼����'
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
