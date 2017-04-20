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
  is '主键';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ti
  is '题目';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ap
  is '申请号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ad
  is '申请日';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_pn
  is '公开号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_pd
  is '公开日';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_pa
  is '申请人';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_pac
  is '国别地区编码';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_addr
  is '地址';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_inr
  is '发明人';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ic0
  is '原IPC分类号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ic1
  is '主分类号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ic2
  is '加工分类号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ab
  is '摘要';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_phc
  is 'PHC号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ana
  is '分析诊断';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_bio
  is '生物方法';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_ext
  is '提取方法';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_phy
  is '物理方法';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_gal
  is '制剂方法';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_mix
  is '复方组成';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_che
  is '化学方法';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_nus
  is '新用途';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_anef
  is '相似作用';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_thef
  is '治疗作用';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_dint
  is '相互作用';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_toxi
  is '毒副作用';
comment on column DRMS.S_T_MEDICINE_HANDLE_T1.t1_diag
  is '诊断作用';
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
  is '主键';
comment on column DRMS.S_T_MEDICINE_HANDLE_T2.t2_ap
  is '申请号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T2.t2_formula
  is '方剂信息';
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
  is '主键';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_ap
  is '申请号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_cmno
  is '化合物编号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_nom1
  is '化合物名称1';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_nom2
  is '化合物名称2';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_nom3
  is '化合物名称3';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_cn
  is '化合物CN号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_rn
  is '化合物RN号';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_roles
  is '职能符';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_fs
  is '文档片段';
comment on column DRMS.S_T_MEDICINE_HANDLE_T3.t3_note
  is '备注';
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
  is '主键';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eti
  is '题目';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ap
  is '申请号';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ad
  is '申请日';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_pn
  is '公开号';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_pd
  is '公开日';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_epa
  is '申请人';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_epac
  is '国别地区编码';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eaddr
  is '地址';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_einr
  is '发明人';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ic0
  is '原IPC分类号';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ic1
  is '主分类号';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ic2
  is '加工分类号';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eab
  is '摘要';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_phc
  is 'PHC号';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eana
  is '分析诊断';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ebio
  is '生物方法';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eext
  is '提取方法';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ephy
  is '物理方法';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_egal
  is '制剂方法';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_emix
  is '复方组成';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eche
  is '化学方法';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_enus
  is '新用途';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_eanef
  is '相似作用';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ethef
  is '治疗作用';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_edint
  is '相互作用';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_etoxi
  is '毒副作用';
comment on column DRMS.S_T_MEDICINE_TRANS_T1.t1_ediag
  is '诊断作用';
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
  is '主键';
comment on column DRMS.S_T_MEDICINE_TRANS_T2.t2_ap
  is '申请号';
comment on column DRMS.S_T_MEDICINE_TRANS_T2.t2_eformula
  is '方剂处方';
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
  is '主键';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ti
  is '题目';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ap
  is '申请号';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ad
  is '申请日';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_pn
  is '公开号';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_pd
  is '公开日';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_pa
  is '申请人';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_pac
  is '国别地区编码';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_addr
  is '地址';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_inr
  is '发明人';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ic0
  is '原IPC分类号';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ic1
  is '主分类号';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ic2
  is '加工分类号';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ab
  is '摘要';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_phc
  is 'PHC号';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ana
  is '分析诊断';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_bio
  is '生物方法';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_ext
  is '提取方法';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_phy
  is '物理方法';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_gal
  is '制剂方法';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_mix
  is '复方组成';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_che
  is '化学方法';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_nus
  is '新用途';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_anef
  is '相似作用';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_thef
  is '治疗作用';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_dint
  is '相互作用';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_toxi
  is '毒副作用';
comment on column DRMS.S_T_PHARMACEUTICAL_T1.t1_diag
  is '诊断作用';
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
  is '主键';
comment on column DRMS.S_T_PHARMACEUTICAL_T2.t2_ap
  is '申请号';
comment on column DRMS.S_T_PHARMACEUTICAL_T2.t2_formula
  is '方剂信息';
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
  is '主键';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_ap
  is '申请号';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_cmno
  is '化合物编号';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_nom1
  is '化合物名称1';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_nom2
  is '化合物名称2';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_nom3
  is '化合物名称3';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_cn
  is '化合物CN号';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_rn
  is '化合物RN号';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_roles
  is '职能符';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_fs
  is '文档片段';
comment on column DRMS.S_T_PHARMACEUTICAL_T3.t3_note
  is '备注';
alter table DRMS.S_T_PHARMACEUTICAL_T3
  add primary key (ID);
