select * from S_INDEX_FILE_DETAIL_ORIGIN;



-- Create table
create table S_INDEX_FILE_DETAIL_ORIGIN
(
  id                    VARCHAR2(100) not null,
  date_exchange         VARCHAR2(100),
  date_produced         VARCHAR2(100),
  date_publication      VARCHAR2(100),
  pat_cnt               VARCHAR2(100),
  pub_country           VARCHAR2(500),
  pub_doc_number        VARCHAR2(500),
  pub_kind              VARCHAR2(100),
  pub_date              VARCHAR2(100),
  app_country           VARCHAR2(500),
  app_doc_number        VARCHAR2(500),
  app_date              VARCHAR2(500),
  doc_file              VARCHAR2(4000),
  index_file_path       VARCHAR2(4000),
  import_time           TIMESTAMP(6),
  data_res              VARCHAR2(500),
  index_info_id         VARCHAR2(100),
  validate_data_success VARCHAR2(100),
  self_check_successed  VARCHAR2(100),
  note                  VARCHAR2(4000),
  archive_inner_path    VARCHAR2(4000),
  doc_file_name         VARCHAR2(1000),
  batch                 VARCHAR2(1000),
  dc_application_num    VARCHAR2(100),
  dc_application_date   VARCHAR2(500),
  dc_publication_num    VARCHAR2(500),
  dc_publication_date   VARCHAR2(500),
  dc_an                 VARCHAR2(500),
  dc_country            VARCHAR2(500)
)
;
-- Create/Recreate indexes 
create index IDXINDEXDETPUBD on S_INDEX_FILE_DETAIL_ORIGIN (PUB_DATE);
create index IDX_DT_DOC_NAME on S_INDEX_FILE_DETAIL_ORIGIN (DOC_FILE_NAME);
create index IDX_IDT_BATCH on S_INDEX_FILE_DETAIL_ORIGIN (BATCH);
create index IDX_IDX_DT_PD on S_INDEX_FILE_DETAIL_ORIGIN (DATE_PUBLICATION);
create index INDEXDETILFILEPATH on S_INDEX_FILE_DETAIL_ORIGIN (INDEX_FILE_PATH);
create bitmap index I_IDX_DT_DATA_RES on S_INDEX_FILE_DETAIL_ORIGIN (DATA_RES);
-- Create/Recreate primary, unique and foreign key constraints 
alter table S_INDEX_FILE_DETAIL_ORIGIN
  add constraint INDEXFILEKEY primary key (ID)
  using index;










-- Create table
create table IMPORT_SESSION_BK
(
  session_id        VARCHAR2(200) not null,
  start_time        DATE,
  last_time         NUMBER,
  has_error         VARCHAR2(10) default 'N',
  zip_or_dir_path   VARCHAR2(1000),
  completed         VARCHAR2(10),
  failed_count      NUMBER,
  is_zip            VARCHAR2(10),
  zip_entries_count NUMBER,
  data_res_type     VARCHAR2(200),
  zip_entry_pointor NUMBER,
  rolled_back       VARCHAR2(10),
  items_point       NUMBER,
  total_item        NUMBER,
  zip_entry_path    VARCHAR2(1000),
  note              VARCHAR2(1000),
  tablename         VARCHAR2(500),
  batch_id          VARCHAR2(100),
  zip_path          VARCHAR2(1000)
);
-- Add comments to the columns 
comment on column IMPORT_SESSION_BK.session_id
  is '����GUI';
comment on column IMPORT_SESSION_BK.start_time
  is '��ʼʱ��';
comment on column IMPORT_SESSION_BK.last_time
  is '����ʱ��S';
comment on column IMPORT_SESSION_BK.has_error
  is '�����Ƿ��д�';
comment on column IMPORT_SESSION_BK.zip_or_dir_path
  is '����ѹ������Ŀ¼·��';
comment on column IMPORT_SESSION_BK.completed
  is '�Ƿ������';
comment on column IMPORT_SESSION_BK.failed_count
  is 'ʧ������';
comment on column IMPORT_SESSION_BK.is_zip
  is '�Ƿ���ѹ����';
comment on column IMPORT_SESSION_BK.zip_entries_count
  is 'ѹ������Ŀ��';
comment on column IMPORT_SESSION_BK.data_res_type
  is '��Դ����';
comment on column IMPORT_SESSION_BK.zip_entry_pointor
  is '��ǰ�Ѵ�������һ����Ŀλ��';
comment on column IMPORT_SESSION_BK.rolled_back
  is '�Ƿ�ع����ε���';
comment on column IMPORT_SESSION_BK.items_point
  is '�Ѿ�������Ŀλ��';
comment on column IMPORT_SESSION_BK.total_item
  is '����Ŀ��';
comment on column IMPORT_SESSION_BK.zip_entry_path
  is 'ѹ������·��';
comment on column IMPORT_SESSION_BK.note
  is '��ע';
comment on column IMPORT_SESSION_BK.tablename
  is '����';
comment on column IMPORT_SESSION_BK.batch_id
  is '������Ϣ';
-- Create/Recreate indexes 
create index IMPORTSESSIONPATHINDEX on IMPORT_SESSION_BK (ZIP_OR_DIR_PATH);
-- Create/Recreate primary, unique and foreign key constraints 
alter table IMPORT_SESSION_BK
  add constraint PRIMARY_KEY primary key (SESSION_ID)
;
