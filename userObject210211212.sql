-------------------------------------------------
-- Export file for user DRMS@DRMS_192.168.3.59 --
-- Created by zhihui on 2017/3/27, 16:46:12 -----
-------------------------------------------------

create table DRMS.S_T_MEDICINE_HANDLE_T1
(
  id                 VARCHAR2(30) not null,
  t1_ti              VARCHAR2(200),
  t1_ap              VARCHAR2(20),
  t1_ad              DATE,
  t1_pn              VARCHAR2(20),
  t1_pd              DATE,
  t1_pa              CLOB,
  t1_pac             VARCHAR2(20),
  t1_addr            VARCHAR2(500),
  t1_inr             CLOB,
  t1_ic0             CLOB,
  t1_ic1             VARCHAR2(20),
  t1_ic2             CLOB,
  t1_ab              CLOB,
  t1_phc             VARCHAR2(200),
  t1_ana             CLOB,
  t1_bio             CLOB,
  t1_ext             CLOB,
  t1_phy             CLOB,
  t1_gal             CLOB,
  t1_mix             CLOB,
  t1_che             CLOB,
  t1_nus             CLOB,
  t1_anef            CLOB,
  t1_thef            CLOB,
  t1_dint            CLOB,
  t1_toxi            CLOB,
  t1_diag            CLOB,
  import_session_id  NVARCHAR2(100),
  import_time        DATE,
  archive_inner_path VARCHAR2(1000),
  file_path          VARCHAR2(1000),
  session_index      NUMBER,
  doc_file_name      VARCHAR2(500)
);
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.id
  is '����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ti
  is '��Ŀ';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ap
  is '�����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ad
  is '������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_pn
  is '������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_pd
  is '������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_pa
  is '������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_pac
  is '�����������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_addr
  is '��ַ';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_inr
  is '������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ic0
  is 'ԭIPC�����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ic1
  is '�������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ic2
  is '�ӹ������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ab
  is 'ժҪ';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_phc
  is 'PHC��';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ana
  is '�������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_bio
  is '���﷽��';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ext
  is '��ȡ����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_phy
  is '������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_gal
  is '�Ƽ�����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_mix
  is '�������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_che
  is '��ѧ����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_nus
  is '����;';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_anef
  is '��������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_thef
  is '��������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_dint
  is '�໥����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_toxi
  is '��������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_diag
  is '�������';
alter table DRMS.S_T_MEDICINE_HANDLE_T1
  add primary key (ID);

prompt
prompt Creating table S_T_MEDICINE_HANDLE_T2
prompt =====================================
prompt
create table DRMS.S_T_MEDICINE_HANDLE_T2
(
  id         VARCHAR2(30) not null,
  t2_ap      VARCHAR2(20),
  t2_formula CLOB
)
;
comment on column DRMS.S_T_MEDICINE_HANDLE_T2.id
  is '����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T2.t2_ap
  is '�����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T2.t2_formula
  is '������Ϣ';
alter table DRMS.S_T_MEDICINE_HANDLE_T2
  add primary key (ID);

prompt
prompt Creating table S_T_MEDICINE_HANDLE_T3
prompt =====================================
prompt
create table DRMS.S_T_MEDICINE_HANDLE_T3
(
  id       VARCHAR2(30) not null,
  t3_ap    VARCHAR2(20),
  t3_cmno  VARCHAR2(20),
  t3_nom1  VARCHAR2(1000),
  t3_nom2  VARCHAR2(1000),
  t3_nom3  VARCHAR2(1000),
  t3_cn    VARCHAR2(50),
  t3_rn    VARCHAR2(50),
  t3_roles VARCHAR2(20),
  t3_fs    VARCHAR2(20),
  t3_note  CLOB
)
;
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.id
  is '����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_ap
  is '�����';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_cmno
  is '��������';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_nom1
  is '����������1';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_nom2
  is '����������2';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_nom3
  is '����������3';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_cn
  is '������CN��';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_rn
  is '������RN��';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_roles
  is 'ְ�ܷ�';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_fs
  is '�ĵ�Ƭ��';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_note
  is '��ע';
alter table DRMS.S_T_MEDICINE_HANDLE_T3
  add primary key (ID);

prompt
prompt Creating table S_T_MEDICINE_TRANS_T1
prompt ====================================
prompt
create table DRMS.S_T_MEDICINE_TRANS_T1
(
  id                 VARCHAR2(30) not null,
  t1_eti             VARCHAR2(200),
  t1_ap              VARCHAR2(20),
  t1_ad              DATE,
  t1_pn              VARCHAR2(20),
  t1_pd              DATE,
  t1_epa             CLOB,
  t1_epac            VARCHAR2(20),
  t1_eaddr           VARCHAR2(500),
  t1_einr            CLOB,
  t1_ic0             CLOB,
  t1_ic1             VARCHAR2(20),
  t1_ic2             CLOB,
  t1_eab             CLOB,
  t1_phc             VARCHAR2(200),
  t1_eana            CLOB,
  t1_ebio            CLOB,
  t1_eext            CLOB,
  t1_ephy            CLOB,
  t1_egal            CLOB,
  t1_emix            CLOB,
  t1_eche            CLOB,
  t1_enus            CLOB,
  t1_eanef           CLOB,
  t1_ethef           CLOB,
  t1_edint           CLOB,
  t1_etoxi           CLOB,
  t1_ediag           CLOB,
  import_session_id  NVARCHAR2(100),
  import_time        DATE,
  archive_inner_path VARCHAR2(1000),
  file_path          VARCHAR2(1000),
  session_index      NUMBER,
  doc_file_name      VARCHAR2(500)
)
;
comment on column DRMS.S_T_MEDICINE_TRANS_T1.id
  is '����';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eti
  is '��Ŀ';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ap
  is '�����';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ad
  is '������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_pn
  is '������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_pd
  is '������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_epa
  is '������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_epac
  is '�����������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eaddr
  is '��ַ';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_einr
  is '������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ic0
  is 'ԭIPC�����';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ic1
  is '�������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ic2
  is '�ӹ������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eab
  is 'ժҪ';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_phc
  is 'PHC��';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eana
  is '�������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ebio
  is '���﷽��';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eext
  is '��ȡ����';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ephy
  is '������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_egal
  is '�Ƽ�����';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_emix
  is '�������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eche
  is '��ѧ����';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_enus
  is '����;';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eanef
  is '��������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ethef
  is '��������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_edint
  is '�໥����';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_etoxi
  is '��������';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ediag
  is '�������';
alter table DRMS.S_T_MEDICINE_TRANS_T1
  add primary key (ID);

prompt
prompt Creating table S_T_MEDICINE_TRANS_T2
prompt ====================================
prompt
create table DRMS.S_T_MEDICINE_TRANS_T2
(
  id          VARCHAR2(30) not null,
  t2_ap       VARCHAR2(20),
  t2_eformula CLOB
);
comment on column DRMS.S_T_MEDICINE_TRANS_T2.id
  is '����';
comment on column DRMS.S_T_MEDICINE_TRANS_T2.t2_ap
  is '�����';
comment on column DRMS.S_T_MEDICINE_TRANS_T2.t2_eformula
  is '��������';
alter table DRMS.S_T_MEDICINE_TRANS_T2
  add primary key (ID);

prompt
prompt Creating table S_T_PHARMACEUTICAL_T1
prompt ====================================
prompt
create table DRMS.S_T_PHARMACEUTICAL_T1
(
  id                 VARCHAR2(30) not null,
  t1_ti              VARCHAR2(200),
  t1_ap              VARCHAR2(20),
  t1_ad              DATE,
  t1_pn              VARCHAR2(20),
  t1_pd              DATE,
  t1_pa              CLOB,
  t1_pac             VARCHAR2(20),
  t1_addr            VARCHAR2(500),
  t1_inr             CLOB,
  t1_ic0             CLOB,
  t1_ic1             VARCHAR2(20),
  t1_ic2             CLOB,
  t1_ab              CLOB,
  t1_phc             VARCHAR2(200),
  t1_ana             CLOB,
  t1_bio             CLOB,
  t1_ext             CLOB,
  t1_phy             CLOB,
  t1_gal             CLOB,
  t1_mix             CLOB,
  t1_che             CLOB,
  t1_nus             CLOB,
  t1_anef            CLOB,
  t1_thef            CLOB,
  t1_dint            CLOB,
  t1_toxi            CLOB,
  t1_diag            CLOB,
  import_session_id  NVARCHAR2(100),
  import_time        DATE,
  archive_inner_path VARCHAR2(1000),
  file_path          VARCHAR2(1000),
  session_index      NUMBER,
  doc_file_name      VARCHAR2(500)
);
comment on column DRMS.S_T_PHARMACEUTICAL_T1.id
  is '����';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ti
  is '��Ŀ';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ap
  is '�����';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ad
  is '������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_pn
  is '������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_pd
  is '������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_pa
  is '������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_pac
  is '�����������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_addr
  is '��ַ';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_inr
  is '������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ic0
  is 'ԭIPC�����';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ic1
  is '�������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ic2
  is '�ӹ������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ab
  is 'ժҪ';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_phc
  is 'PHC��';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ana
  is '�������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_bio
  is '���﷽��';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ext
  is '��ȡ����';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_phy
  is '������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_gal
  is '�Ƽ�����';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_mix
  is '�������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_che
  is '��ѧ����';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_nus
  is '����;';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_anef
  is '��������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_thef
  is '��������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_dint
  is '�໥����';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_toxi
  is '��������';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_diag
  is '�������';
alter table DRMS.S_T_PHARMACEUTICAL_T1
  add primary key (ID);

prompt
prompt Creating table S_T_PHARMACEUTICAL_T2
prompt ====================================
prompt
create table DRMS.S_T_PHARMACEUTICAL_T2
(
  id         VARCHAR2(30) not null,
  t2_ap      VARCHAR2(20),
  t2_formula CLOB
)
;
comment on column DRMS.S_T_PHARMACEUTICAL_T2.id
  is '����';
comment on column DRMS.S_T_PHARMACEUTICAL_T2.t2_ap
  is '�����';
comment on column DRMS.S_T_PHARMACEUTICAL_T2.t2_formula
  is '������Ϣ';
alter table DRMS.S_T_PHARMACEUTICAL_T2
  add primary key (ID)
 ;

prompt
prompt Creating table S_T_PHARMACEUTICAL_T3
prompt ====================================
prompt
create table DRMS.S_T_PHARMACEUTICAL_T3
(
  id       VARCHAR2(30) not null,
  t3_ap    VARCHAR2(20),
  t3_cmno  VARCHAR2(20),
  t3_nom1  VARCHAR2(1000),
  t3_nom2  VARCHAR2(1000),
  t3_nom3  VARCHAR2(1000),
  t3_cn    VARCHAR2(50),
  t3_rn    VARCHAR2(50),
  t3_roles VARCHAR2(20),
  t3_fs    VARCHAR2(20),
  t3_note  CLOB
)
;
comment on column DRMS.S_T_PHARMACEUTICAL_T3.id
  is '����';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_ap
  is '�����';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_cmno
  is '��������';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_nom1
  is '����������1';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_nom2
  is '����������2';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_nom3
  is '����������3';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_cn
  is '������CN��';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_rn
  is '������RN��';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_roles
  is 'ְ�ܷ�';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_fs
  is '�ĵ�Ƭ��';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_note
  is '��ע';
alter table DRMS.S_T_PHARMACEUTICAL_T3
  add primary key (ID);
