----------------------------------------------------------
-- Export file for user DRMSTEST@DRMSTEST_192.168.3.223 --
-- Created by zhihui on 2016/9/18, 11:14:23 --------------
----------------------------------------------------------

set define off
spool userObjectDrmstest.log

prompt
prompt Creating table BPM_NODE_SET
prompt ===========================
prompt
create table DRMSTEST.BPM_NODE_SET
(
  setid            NUMBER(18) not null,
  defid            NUMBER(18),
  nodename         VARCHAR2(256),
  nodeorder        INTEGER,
  nodeid           VARCHAR2(128),
  formtype         INTEGER default 0,
  formurl          VARCHAR2(255),
  formkey          VARCHAR2(50),
  actdefid         VARCHAR2(127),
  formdefname      VARCHAR2(255),
  nodetype         INTEGER,
  jointaskkey      VARCHAR2(128),
  jointaskname     VARCHAR2(256),
  beforehandler    VARCHAR2(100),
  afterhandler     VARCHAR2(100),
  jumptype         VARCHAR2(32),
  settype          INTEGER,
  isjumpfordef     INTEGER,
  ishideoption     INTEGER,
  ishidepath       INTEGER,
  detailurl        VARCHAR2(256),
  isallowmobile    INTEGER,
  informtype       VARCHAR2(50),
  parentactdefid   VARCHAR2(128),
  mobileformkey    VARCHAR2(50),
  mobileformurl    VARCHAR2(256),
  mobiledetailurl  VARCHAR2(256),
  scope            VARCHAR2(256),
  isrequired       INTEGER default 0,
  ispopup          INTEGER default 1,
  opinionfield     VARCHAR2(64),
  opinionhtml      INTEGER default 1,
  sendmsgtocreator INTEGER
)
tablespace TS_DRMS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DRMSTEST.BPM_NODE_SET
  is '流程节点设置';
create index DRMSTEST.IDX_NODESET_DEFID on DRMSTEST.BPM_NODE_SET (DEFID)
  tablespace TS_DRMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRMSTEST.BPM_NODE_SET
  add primary key (SETID)
  using index 
  tablespace TS_DRMS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


spool off
