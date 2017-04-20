231. S_World_Patent_LawStatus        世界专利法律状态（INPADOC）
232. S_STD_JP_CIT                    日本引文(STD_JP_CIT)（标准化）
233. S_STD_KR_CIT                    韩国引文(STD_KR_CIT)（标准化）
234. S_STD_KR_PRS                    韩国法律状态数据(STD_KR_PRS)（标准化）
select t.rowid, t.* from S_CHINA_BRAND t where t.trademark_notice_status is not null order by t.import_time desc;

select t.rowid, t.* from S_CHINA_BRAND t  order by t.import_time desc;

select t.rowid, t.* from S_CHINA_BRAND t where DBMS_LOB.GETLENGTH(t.service_list) <> 0 order by t.import_time desc;


select * from S_CHINA_BRAND t where t.mark_cn_id = 'CN00000024649811';


select * from import_session t order by t.start_time desc;





select * from s_import_bath;

select * from S_World_Patent_LawStatus t order by t.import_time desc;
select * from S_STD_JP_CIT t order by t.import_time desc;
select * from S_STD_KR_CIT t order by t.import_time desc;
select * from S_STD_KR_PRS t order by t.import_time desc;

truncate table S_World_Patent_LawStatus;

alter table S_World_Patent_LawStatus add import_session_id NVARCHAR2(100);
alter table S_World_Patent_LawStatus add import_time DATE;
alter table S_World_Patent_LawStatus add archive_inner_path VARCHAR2(1000);
alter table S_World_Patent_LawStatus add file_path VARCHAR2(1000);
alter table S_World_Patent_LawStatus add session_index NUMBER;


select * from s_import_bath b where b.id = 'a9fd17c0-9d8f-4186-85c2-5f838983ccc3';


alter table S_China_Patent_StandardFullTxt add ver_classificationlocarno varchar2(200);alter table S_China_Patent_StandardFullTxt add sta_classificationlocarno varchar2(200);alter table S_China_Patent_StandardFullTxt add ori_classificationlocarno varchar2(200);alter table S_China_Patent_StandardFullTxt add oth_classificationlocarno varchar2(200);

alter table S_China_Patent_Bibliographic   add ver_classificationlocarno varchar2(200);alter table S_China_Patent_Bibliographic   add sta_classificationlocarno varchar2(200);alter table S_China_Patent_Bibliographic   add ori_classificationlocarno varchar2(200);alter table S_China_Patent_Bibliographic   add oth_classificationlocarno varchar2(200);

alter table S_China_Standard_SimpCitation  add ver_classificationlocarno varchar2(200);alter table S_China_Standard_SimpCitation  add sta_classificationlocarno varchar2(200);alter table S_China_Standard_SimpCitation  add ori_classificationlocarno varchar2(200);alter table S_China_Standard_SimpCitation  add oth_classificationlocarno varchar2(200);

alter table S_American_Patent_FullText     add ver_classificationlocarno varchar2(200);alter table S_American_Patent_FullText     add sta_classificationlocarno varchar2(200);alter table S_American_Patent_FullText     add ori_classificationlocarno varchar2(200);alter table S_American_Patent_FullText     add oth_classificationlocarno varchar2(200);

alter table S_European_Patent_FullText     add ver_classificationlocarno varchar2(200);alter table S_European_Patent_FullText     add sta_classificationlocarno varchar2(200);alter table S_European_Patent_FullText     add ori_classificationlocarno varchar2(200);alter table S_European_Patent_FullText     add oth_classificationlocarno varchar2(200);

alter table S_Korean_Patent_FullTextCode   add ver_classificationlocarno varchar2(200);alter table S_Korean_Patent_FullTextCode   add sta_classificationlocarno varchar2(200);alter table S_Korean_Patent_FullTextCode   add ori_classificationlocarno varchar2(200);alter table S_Korean_Patent_FullTextCode   add oth_classificationlocarno varchar2(200);

alter table S_Swiss_Patent_FullTextCode    add ver_classificationlocarno varchar2(200);alter table S_Swiss_Patent_FullTextCode    add sta_classificationlocarno varchar2(200);alter table S_Swiss_Patent_FullTextCode    add ori_classificationlocarno varchar2(200);alter table S_Swiss_Patent_FullTextCode    add oth_classificationlocarno varchar2(200);

alter table S_British_Patent_FullTextCode  add ver_classificationlocarno varchar2(200);alter table S_British_Patent_FullTextCode  add sta_classificationlocarno varchar2(200);alter table S_British_Patent_FullTextCode  add ori_classificationlocarno varchar2(200);alter table S_British_Patent_FullTextCode  add oth_classificationlocarno varchar2(200);

alter table S_Japan_Patent_FullTextCode    add ver_classificationlocarno varchar2(200);alter table S_Japan_Patent_FullTextCode    add sta_classificationlocarno varchar2(200);alter table S_Japan_Patent_FullTextCode    add ori_classificationlocarno varchar2(200);alter table S_Japan_Patent_FullTextCode    add oth_classificationlocarno varchar2(200);

alter table S_Belgian_Patent_FullText      add ver_classificationlocarno varchar2(200);alter table S_Belgian_Patent_FullText      add sta_classificationlocarno varchar2(200);alter table S_Belgian_Patent_FullText      add ori_classificationlocarno varchar2(200);alter table S_Belgian_Patent_FullText      add oth_classificationlocarno varchar2(200);

alter table S_Austria_Patent_FullText      add ver_classificationlocarno varchar2(200);alter table S_Austria_Patent_FullText      add sta_classificationlocarno varchar2(200);alter table S_Austria_Patent_FullText      add ori_classificationlocarno varchar2(200);alter table S_Austria_Patent_FullText      add oth_classificationlocarno varchar2(200);

alter table S_Spanish_Patent_FullText      add ver_classificationlocarno varchar2(200);alter table S_Spanish_Patent_FullText      add sta_classificationlocarno varchar2(200);alter table S_Spanish_Patent_FullText      add ori_classificationlocarno varchar2(200);alter table S_Spanish_Patent_FullText      add oth_classificationlocarno varchar2(200);

alter table S_Poland_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_Poland_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_Poland_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_Poland_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_Israel_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_Israel_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_Israel_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_Israel_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_Singapore_Patent_Description add ver_classificationlocarno varchar2(200);alter table S_Singapore_Patent_Description add sta_classificationlocarno varchar2(200);alter table S_Singapore_Patent_Description add ori_classificationlocarno varchar2(200);alter table S_Singapore_Patent_Description add oth_classificationlocarno varchar2(200);

alter table S_American_Design_Patent       add ver_classificationlocarno varchar2(200);alter table S_American_Design_Patent       add sta_classificationlocarno varchar2(200);alter table S_American_Design_Patent       add ori_classificationlocarno varchar2(200);alter table S_American_Design_Patent       add oth_classificationlocarno varchar2(200);

alter table S_Korea_Design_Patent          add ver_classificationlocarno varchar2(200);alter table S_Korea_Design_Patent          add sta_classificationlocarno varchar2(200);alter table S_Korea_Design_Patent          add ori_classificationlocarno varchar2(200);alter table S_Korea_Design_Patent          add oth_classificationlocarno varchar2(200);

alter table S_Russian_Patent_Abstracts     add ver_classificationlocarno varchar2(200);alter table S_Russian_Patent_Abstracts     add sta_classificationlocarno varchar2(200);alter table S_Russian_Patent_Abstracts     add ori_classificationlocarno varchar2(200);alter table S_Russian_Patent_Abstracts     add oth_classificationlocarno varchar2(200);

alter table S_China_Patent_Abstracts       add ver_classificationlocarno varchar2(200);alter table S_China_Patent_Abstracts       add sta_classificationlocarno varchar2(200);alter table S_China_Patent_Abstracts       add ori_classificationlocarno varchar2(200);alter table S_China_Patent_Abstracts       add oth_classificationlocarno varchar2(200);

alter table S_WIPO_Patent_Description      add ver_classificationlocarno varchar2(200);alter table S_WIPO_Patent_Description      add sta_classificationlocarno varchar2(200);alter table S_WIPO_Patent_Description      add ori_classificationlocarno varchar2(200);alter table S_WIPO_Patent_Description      add oth_classificationlocarno varchar2(200);

alter table S_Canadian_Patent_Description  add ver_classificationlocarno varchar2(200);alter table S_Canadian_Patent_Description  add sta_classificationlocarno varchar2(200);alter table S_Canadian_Patent_Description  add ori_classificationlocarno varchar2(200);alter table S_Canadian_Patent_Description  add oth_classificationlocarno varchar2(200);

alter table S_Russian_Patent_Description   add ver_classificationlocarno varchar2(200);alter table S_Russian_Patent_Description   add sta_classificationlocarno varchar2(200);alter table S_Russian_Patent_Description   add ori_classificationlocarno varchar2(200);alter table S_Russian_Patent_Description   add oth_classificationlocarno varchar2(200);

alter table S_Australian_Patent_FullText   add ver_classificationlocarno varchar2(200);alter table S_Australian_Patent_FullText   add sta_classificationlocarno varchar2(200);alter table S_Australian_Patent_FullText   add ori_classificationlocarno varchar2(200);alter table S_Australian_Patent_FullText   add oth_classificationlocarno varchar2(200);

alter table S_German_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_German_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_German_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_German_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_French_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_French_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_French_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_French_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_Taiwan_Patent_Description    add ver_classificationlocarno varchar2(200);alter table S_Taiwan_Patent_Description    add sta_classificationlocarno varchar2(200);alter table S_Taiwan_Patent_Description    add ori_classificationlocarno varchar2(200);alter table S_Taiwan_Patent_Description    add oth_classificationlocarno varchar2(200);

alter table S_Hongkong_Patent_Description  add ver_classificationlocarno varchar2(200);alter table S_Hongkong_Patent_Description  add sta_classificationlocarno varchar2(200);alter table S_Hongkong_Patent_Description  add ori_classificationlocarno varchar2(200);alter table S_Hongkong_Patent_Description  add oth_classificationlocarno varchar2(200);

alter table S_Macao_Patent_Description     add ver_classificationlocarno varchar2(200);alter table S_Macao_Patent_Description     add sta_classificationlocarno varchar2(200);alter table S_Macao_Patent_Description     add ori_classificationlocarno varchar2(200);alter table S_Macao_Patent_Description     add oth_classificationlocarno varchar2(200);

alter table S_Eurasian_Patent_Description  add ver_classificationlocarno varchar2(200);alter table S_Eurasian_Patent_Description  add sta_classificationlocarno varchar2(200);alter table S_Eurasian_Patent_Description  add ori_classificationlocarno varchar2(200);alter table S_Eurasian_Patent_Description  add oth_classificationlocarno varchar2(200);

alter table S_Japan_Design_Patent          add ver_classificationlocarno varchar2(200);alter table S_Japan_Design_Patent          add sta_classificationlocarno varchar2(200);alter table S_Japan_Design_Patent          add ori_classificationlocarno varchar2(200);alter table S_Japan_Design_Patent          add oth_classificationlocarno varchar2(200);

alter table S_German_Design_Patent         add ver_classificationlocarno varchar2(200);alter table S_German_Design_Patent         add sta_classificationlocarno varchar2(200);alter table S_German_Design_Patent         add ori_classificationlocarno varchar2(200);alter table S_German_Design_Patent         add oth_classificationlocarno varchar2(200);

alter table S_French_Design_Patent         add ver_classificationlocarno varchar2(200);alter table S_French_Design_Patent         add sta_classificationlocarno varchar2(200);alter table S_French_Design_Patent         add ori_classificationlocarno varchar2(200);alter table S_French_Design_Patent         add oth_classificationlocarno varchar2(200);

alter table S_Russian_Design_Patent        add ver_classificationlocarno varchar2(200);alter table S_Russian_Design_Patent        add sta_classificationlocarno varchar2(200);alter table S_Russian_Design_Patent        add ori_classificationlocarno varchar2(200);alter table S_Russian_Design_Patent        add oth_classificationlocarno varchar2(200);

alter table S_Japan_Patent_Abstracts       add ver_classificationlocarno varchar2(200);alter table S_Japan_Patent_Abstracts       add sta_classificationlocarno varchar2(200);alter table S_Japan_Patent_Abstracts       add ori_classificationlocarno varchar2(200);alter table S_Japan_Patent_Abstracts       add oth_classificationlocarno varchar2(200);

alter table S_Korea_Patent_Abstracts       add ver_classificationlocarno varchar2(200);alter table S_Korea_Patent_Abstracts       add sta_classificationlocarno varchar2(200);alter table S_Korea_Patent_Abstracts       add ori_classificationlocarno varchar2(200);alter table S_Korea_Patent_Abstracts       add oth_classificationlocarno varchar2(200);

/**03**/
select * from S_CHINA_PATENT_STANDARDFULLTXT t order by t.import_time desc;
select count(*) from S_CHINA_PATENT_STANDARDFULLTXT t;

delete from S_CHINA_PATENT_STANDARDFULLTXT;

truncate table S_CHINA_PATENT_STANDARDFULLTXT;

select * from import_session i where i.batch_id = '01fd204b-62e9-4b15-b076-3d8968f88843' order by i.start_time desc;

select * from s_import_bath b where b.id = '3176a2eb-2351-4ba7-97be-dbf46ed5a621';

3176a2eb-2351-4ba7-97be-dbf46ed5a621
01fd204b-62e9-4b15-b076-3d8968f88843

delete from s_import_bath;
delete from import_session;



/**52**/
select * from S_KOREAN_PATENT_FULLTEXTCODE;
select count(*) from S_KOREAN_PATENT_FULLTEXTCODE;
delete from S_KOREAN_PATENT_FULLTEXTCODE


/**54**/
select * from S_BRITISH_PATENT_FULLTEXTCODE;
select count(*) from S_BRITISH_PATENT_FULLTEXTCODE;
delete from S_BRITISH_PATENT_FULLTEXTCODE




select * from S_MADRID_BRAND_ENTER_CHINA t where t.application_persion_infos is not null;


select t.*, t.rowid from S_CHINA_BRAND_LICENSE t where t.mark_cn_id= 'CN00000074774230' order by t.import_time desc;
select * from S_CHINA_LICENSE_PROCESSINFO;
delete from S_CHINA_BRAND_TRANSFER;
delete from S_CHINA_BRAND_TRANS_INFO;
select * from S_CHINA_BRAND_TRANSFER;
select * from S_CHINA_BRAND_TRANS_INFO;


delete from S_CHINA_BRAND_LICENSE;
delete from S_CHINA_LICENSE_PROCESSINFO;
select * from S_CHINA_BRAND_LICENSE;
select * from S_CHINA_LICENSE_PROCESSINFO;

select t.*, t.rowid from S_CHINA_WELLKNOWN_BRAND t where t.mark_cn_id= 'CN00000084603001';

delete from S_CHINA_WELLKNOWN_BRAND;

CN00000084603001

select * from S_China_Patent_TextCode t
select count(*) from S_CHINA_Patent_TextCode t;
"insert into S_CHINA_PATENT_TEXTCODE(APPL_TYPE,PUB_COUNTRY,PUB_NUMBER,PUB_DATE,PUB_KIND,GAZETTE_NUM,GAZETTE_DATE,INVENTION_TITLE,ABSTRACT,PATH_XML,EXIST_XML,ID) values (APPL_TYPE,PUB_COUNTRY,PUB_NUMBER,PUB_DATE,PUB_KIND,GAZETTE_NUM,GAZETTE_DATE,INVENTION_TITLE,ABSTRACT,PATH_XML,EXIST_XML,ID,'4b731e80-1f86-446d-b7ac-69a22be7e178')"




insert into 
S_CHINA_PATENT_TEXTCODE
(
APPL_TYPE,
PUB_COUNTRY,
PUB_NUMBER,
PUB_DATE,
PUB_KIND,
GAZETTE_NUM,
GAZETTE_DATE,
INVENTION_TITLE,
ABSTRACT,
PATH_XML,
EXIST_XML,
ID) 
values 
(
'外观专利',
'CN',
'303732996',TO_DATE('20160706', 'yyyymmdd'),'S','32-27',TO_DATE('20160706', 'yyyymmdd'),'织物块','1．本外观设计产品的名称：织物块。2．本外观设计产品的用途：本外观设计产品用于纺织纤维制品。3．本外观设计产品的设计要点：外观设计产品的图案。4.最能表明设计要点的图片为：设计1主视图。5.本外观设计申请包含2项相似外观设计，其中，设计1为基本设计。6.本外观设计要求保护色彩。','20160706\\201330279585.1\\201330279585NEW.XML','1','37534f39-46ca-4a42-89d3-4b933c960e7b')

insert into S_CHINA_PATENT_TEXTCODE(APPL_TYPE,PUB_COUNTRY,PUB_NUMBER,PUB_DATE,PUB_KIND,GAZETTE_NUM,GAZETTE_DATE,INVENTION_TITLE,ABSTRACT,PATH_XML,EXIST_XML,ID) values ('外观''专利','CN','303732996',TO_DATE('20160706', 'yyyymmdd'),'S','32-27',TO_DATE('20160706', 'yyyymmdd'),'织物块','1．本外观设计产品的名称：织物块。2．本外观设计产品的用途：本外观设计产品用于纺织纤维制品。3．本外观设计产品的设计要点：外观设计产品的图案。4.最能表明设计要点的图片为：设计1主视图。5.本外观设计申请包含2项相似外观设计，其中，设计1为基本设计。6.本外观设计要求保护色彩。','20160706\\201330279585.1\\201330279585NEW.XML','1','dff410-7eec-49a5-8705-be1e8a5024c3')

select count(*) from S_CHINA_PATENT_TEXTCODE;

select * from S_CHINA_PATENT_TEXTCODE t where t.invention_title like '一种%';

select * from S_CHINA_PATENT_TEXTCODE t where PUB_COUNTRY ='Kingdon';

select count(*) from S_CHINA_PATENT_TEXTCODE t where t.invention_title like '一种%';

select * from import_session;

select * from import_error;

select t.* from S_CHINA_PATENT_TEXTCODE t where rownum < 1000;

select t.* from S_CHINA_PATENT_TEXTCODE t where t.classification_ipcr is not null





select * from import_session;

select * from import_error;

alter table IMPORT_ERROR modify error_message varchar2(2000);

/*
truncate table S_CHINA_PATENT_TEXTCODE;
truncate table import_error
truncate table import_session
*/
select * from IMPORT_SESSION t where t.last_time  = 0  order by t.start_time desc;

delete from IMPORT_SESSION t where t.last_time  = 0  order by t.start_time desc;

select * from IMPORT_SESSION t order by t.start_time desc;
/*
delete from IMPORT_SESSION t where t.session_id <> 'f71dfc61-9e0c-48bf-818f-89d8657e4404'
*/


select * from s_China_Patent_Textimage t order by t.import_time desc;

select * from S_China_Patent_StandardFullTxt t;

select * from import_error where session_id = 'ecea912a-e321-406c-9f39-72e56dc6ff0a';




update import_session set tablename='s_China_Patent_Textimage' where data_res_type = '中国专利全文图像数据';

update import_session set tablename='S_CHINA_PATENT_TEXTCODE' where data_res_type = '中国专利全文代码化数据';





ecea912a-e321-406c-9f39-72e56dc6ff0a

select * from IMPORT_SESSION t where t.session_id = '93b2dfc8-9554-4ac7-9541-fb1bdb604da7' order by t.start_time desc;
select * from import_error where session_id = 'ecea912a-e321-406c-9f39-72e56dc6ff0a';
select * from s_China_Patent_Textimage t where t.import_session_id = 'ecea912a-e321-406c-9f39-72e56dc6ff0a';

select * from S_CHINA_PATENT_TEXTCODE t where t.import_session_id = 'ecea912a-e321-406c-9f39-72e56dc6ff0a';



select t.*, t.rowid from import_session t
delete from s_China_Patent_Textimage where import_session_id='93b2dfc8-9554-4ac7-9541-fb1bdb604da7'
select * from import_error;




select * from S_China_Patent_StandardFullTxt t where t.sta_pub_country is null;

delete from S_China_Patent_StandardFullTxt t where t.sta_pub_country is null;


select t.*, t.rowid from S_CHINA_PATENT_GAZETTE t order by t.import_time desc



select count(*) from S_CHINA_PATENT_GAZETTE t order by t.id asc


select t.*, t.rowid from S_Patent_Payment t;



select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t order by t.id asc;


update S_DATA_RESOURCE_TYPES_DETAIL t set t.table_name = 'N', t.implemented_import_logic = 'N', t.in_process = null where t.chinese_name like '%DI%';


alter table S_CHINA_PATENT_STAND_TEXTIMAGE add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add import_time DATE;
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add session_index NUMBER;


select t.*, t.rowid from S_CHINA_PATENT_STAND_TEXTIMAGE t order by t.import_time desc; 



select t.*,trim() t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t order by t.id asc;


select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t where t.id in (3,6,13,50,51,52,53,54,55,103,104,105,106,107,108,213,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230) order by t.id asc;

update S_DATA_RESOURCE_TYPES_DETAIL t 
set t.table_name = upper(t.table_name)
t.in_process = null 
where t.id > 130 and t.id < 140;

update S_DATA_RESOURCE_TYPES_DETAIL t set t.chinese_name = trim(t.chinese_name);

select t.*, t.rowid from S_CHINA_PATENT_BIBLIOGRAPHIC t order by t.import_time desc; 

update S_DATA_RESOURCE_TYPES_DETAIL t set t.in_process = null;

select * from s_import_bath t order by t.start_time desc;

/*3*/  select t.*, t.rowid from S_CHINA_PATENT_STANDARDFULLTXT t order by t.import_time desc; 
/*6*/  select t.*, t.rowid from S_CHINA_PATENT_BIBLIOGRAPHIC t order by t.import_time desc; 
/*13*/  select t.*, t.rowid from S_CHINA_STANDARD_SIMPCITATION t order by t.import_time desc; 


/*50*/  select t.*, t.rowid from S_AMERICAN_PATENT_FULLTEXT t order by t.import_time desc; 
/*51*/  select t.*, t.rowid from S_EUROPEAN_PATENT_FULLTEXT t order by t.import_time desc; 
/*52*/  select t.*, t.rowid from S_KOREAN_PATENT_FULLTEXTCODE t order by t.import_time desc; 
/*53*/  select t.*, t.rowid from S_SWISS_PATENT_FULLTEXTCODE t order by t.import_time desc; 
/*54*/  select t.*, t.rowid from S_BRITISH_PATENT_FULLTEXTCODE t order by t.import_time desc; 
/*55*/  select t.*, t.rowid from S_JAPAN_PATENT_FULLTEXTCODE t order by t.import_time desc; 
/*103*/  select t.*, t.rowid from S_BELGIAN_PATENT_FULLTEXT t order by t.import_time desc; 
/*104*/  select t.*, t.rowid from S_AUSTRIA_PATENT_FULLTEXT t order by t.import_time desc; 
/*105*/  select t.*, t.rowid from S_SPANISH_PATENT_FULLTEXT t order by t.import_time desc; 



/*106*/  select t.*, t.rowid from S_POLAND_PATENT_DESCRIPTION t order by t.import_time desc; 
/*107*/  select t.*, t.rowid from S_ISRAEL_PATENT_DESCRIPTION t order by t.import_time desc; 
/*108*/  select t.*, t.rowid from S_SINGAPORE_PATENT_DESCRIPTION t order by t.import_time desc; 
/*113*/  select t.*, t.rowid from S_AMERICAN_DESIGN_PATENT t order by t.import_time desc; 
/*115*/  select t.*, t.rowid from S_KOREA_DESIGN_PATENT t order by t.import_time desc; 
/*127*/  select t.*, t.rowid from S_RUSSIAN_PATENT_ABSTRACTS t order by t.import_time desc; 




/*213*/  select t.*, t.rowid from S_CHINA_PATENT_ABSTRACTS t order by t.import_time desc; 
/*215*/  select t.*, t.rowid from S_WIPO_PATENT_DESCRIPTION t order by t.import_time desc; 
/*216*/  select t.*, t.rowid from S_CANADIAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*217*/  select t.*, t.rowid from S_RUSSIAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*218*/  select t.*, t.rowid from S_AUSTRALIAN_PATENT_FULLTEXT t order by t.import_time desc; 
/*219*/  select t.*, t.rowid from S_GERMAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*220*/  select t.*, t.rowid from S_FRENCH_PATENT_DESCRIPTION t order by t.import_time desc; 
/*221*/  select t.*, t.rowid from S_TAIWAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*222*/  select t.*, t.rowid from S_HONGKONG_PATENT_DESCRIPTION t order by t.import_time desc; 
/*223*/  select t.*, t.rowid from S_MACAO_PATENT_DESCRIPTION t order by t.import_time desc; 
/*224*/  select t.*, t.rowid from S_EURASIAN_PATENT_DESCRIPTION t order by t.import_time desc; 
/*225*/  select t.*, t.rowid from S_JAPAN_DESIGN_PATENT t order by t.import_time desc; 
/*226*/  select t.*, t.rowid from S_GERMAN_DESIGN_PATENT t order by t.import_time desc; 
/*227*/  select t.*, t.rowid from S_FRENCH_DESIGN_PATENT t order by t.import_time desc; 
/*228*/  select t.*, t.rowid from S_RUSSIAN_DESIGN_PATENT t order by t.import_time desc; 
/*229*/  select t.*, t.rowid from S_JAPAN_PATENT_ABSTRACTS t order by t.import_time desc; 
/*230*/  select t.*, t.rowid from S_KOREA_PATENT_ABSTRACTS t order by t.import_time desc; 




select t.*, t.rowid from import_session t where t.data_res_type like '加拿大专利著录项及全文数据（CA）（标准化）%';


delete from import_session t where t.data_res_type like '加拿大专利著录项及全文数据（CA）（标准化）%';


select * from s_import_bath;






select s.id from S_DATA_RESOURCE_TYPES_DETAIL s where s.implemented_import_logic='Y' order by s.id asc;



alter table S_CHINA_BRAND add import_session_id NVARCHAR2(100);
alter table S_CHINA_BRAND add import_time DATE;
alter table S_CHINA_BRAND add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_BRAND add file_path VARCHAR2(1000);
alter table S_CHINA_BRAND add session_index NUMBER;

select s.*, s.rowid from S_DATA_RESOURCE_TYPES_DETAIL s where s.implemented_import_logic='Y' order by s.id asc;

select s.*, s.rowid from S_CHINA_COURTCASE_PROCESS s where s.pn in ('293afd54e36295513cd57f72bc10ddc8','34253cd281307297798c8da7b3a7152a','39bca78e26bd3540f8f82635bf23f5cd','4fc086dabcae461f67285c9e2b448692') order by s.import_time desc

select s.*, s.rowid from S_DATA_RESOURCE_TYPES_DETAIL s order by s.id asc;

/*1-中国专利全文代码化数据*/  select t.*, t.rowid from S_CHINA_PATENT_TEXTCODE        t order by t.import_time desc; 
/*2-中国专利全文图像数据*/  select t.*, t.rowid from S_CHINA_PATENT_TEXTIMAGE       t order by t.import_time desc; 
/*3-中国专利标准化全文文本数据*/  select t.*, t.rowid from S_CHINA_PATENT_STANDARDFULLTXT t order by t.import_time desc; 
/*4-中国专利标准化全文图像数据*/  select t.*, t.rowid from S_CHINA_PATENT_STAND_TEXTIMAGE t order by t.import_time desc; 
/*5-中国专利公报数据*/  select t.*, t.rowid from S_CHINA_PATENT_GAZETTE         t order by t.import_time desc; 
/*6-中国专利著录项目与文摘数据*/  select t.*, t.rowid from S_CHINA_PATENT_BIBLIOGRAPHIC   t order by t.import_time desc; 
/*10-中国专利法律状态数据*/  select t.*, t.rowid from S_CHINA_PATENT_LAWSTATE        t order by t.import_time desc; 
/*11-中国专利法律状态变更翻译数据*/  select t.*, t.rowid from S_CHINA_PATENT_LAWSTATE_CHANGE t order by t.import_time desc; 
/*13-中国标准化简单引文数据*/  select t.*, t.rowid from S_CHINA_STANDARD_SIMPCITATION  t order by t.import_time desc; 
/*14-专利缴费数据*/  select t.*, t.rowid from S_PATENT_PAYMENT               t order by t.import_time desc; 
/*16-公司代码库*/  select t.*, t.rowid from S_COMPANY_CODE_LIBRARY         t order by t.import_time desc; 
/*17-区域代码库*/  select t.*, t.rowid from S_ZONE_CODE_BASE               t order by t.import_time desc; 
/*50-美国专利全文文本数据*/  select t.*, t.rowid from S_AMERICAN_PATENT_FULLTEXT     t order by t.import_time desc; 
/*51-欧专局专利全文文本数据*/  select t.*, t.rowid from S_EUROPEAN_PATENT_FULLTEXT     t order by t.import_time desc; 
/*52-韩国专利全文代码化数据*/  select t.*, t.rowid from S_KOREAN_PATENT_FULLTEXTCODE   t order by t.import_time desc; 
/*53-瑞士专利全文代码化数据*/  select t.*, t.rowid from S_SWISS_PATENT_FULLTEXTCODE    t order by t.import_time desc; 
/*54-英国专利全文代码化数据*/  select t.*, t.rowid from S_BRITISH_PATENT_FULLTEXTCODE  t order by t.import_time desc; 
/*55-日本专利全文代码化数据*/  select t.*, t.rowid from S_JAPAN_PATENT_FULLTEXTCODE    t order by t.import_time desc; 
/*76-中国专利生物序列数据（DI）*/  select t.*, t.rowid from S_CHINA_PATENT_BIOLOGICALSEQ   t order by t.import_time desc; 
/*82-专利同族数据（DI）*/  select t.*, t.rowid from S_PATENT_FAMILY                t order by t.import_time desc; 
/*83-全球专利引文数据（DI）*/  select t.*, t.rowid from S_GLOBAL_PATENT_CITATION       t order by t.import_time desc; 
/*84-中国专利费用信息数据（DI）*/  select t.*, t.rowid from S_CHINA_PATENT_FEEINFORMATION  t order by t.import_time desc; 
/*85-中国专利通知书数据（DI）*/  select t.*, t.rowid from S_CHINA_PATENT_NOTICES         t order by t.import_time desc; 
/*86-中国法律状态标引库（DI）*/  select t.*, t.rowid from S_CHINA_LAWSTATE_INDEXINGLIB   t order by t.import_time desc; 
/*88-世界法律状态数据*/  select t.*, t.rowid from S_WORLD_LEGAL_STATUS           t order by t.import_time desc; 
/*90-DOCDB数据*/  select t.*, t.rowid from S_DOCDB                        t order by t.import_time desc; 
/*103-比利时专利全文数据*/  select t.*, t.rowid from S_BELGIAN_PATENT_FULLTEXT      t order by t.import_time desc; 
/*104-奥地利专利全文数据*/  select t.*, t.rowid from S_AUSTRIA_PATENT_FULLTEXT      t order by t.import_time desc; 
/*105-西班牙专利全文数据*/  select t.*, t.rowid from S_SPANISH_PATENT_FULLTEXT      t order by t.import_time desc; 
/*106-波兰专利著录项及全文数据*/  select t.*, t.rowid from S_POLAND_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*107-以色列专利著录项及全文数据*/  select t.*, t.rowid from S_ISRAEL_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*108-新加坡专利著录项及全文数据*/  select t.*, t.rowid from S_SINGAPORE_PATENT_DESCRIPTION t order by t.import_time desc; 
/*113-美国外观设计专利数据*/  select t.*, t.rowid from S_AMERICAN_DESIGN_PATENT       t order by t.import_time desc; 
/*115-韩国外观设计专利数据*/  select t.*, t.rowid from S_KOREA_DESIGN_PATENT          t order by t.import_time desc; 
/*121-中国专利全文数据PDF（DI）*/  select t.*, t.rowid from S_CHINA_PATENT_FULLTEXT_PDF    t order by t.import_time desc; 
/*122-国外专利全文数据PDF（DI）*/  select t.*, t.rowid from S_FOREIGN_PATENT_FULLTEXT_PDF  t order by t.import_time desc; 
/*127-俄罗斯专利文摘英文翻译数据*/  select t.*, t.rowid from S_RUSSIAN_PATENT_ABSTRACTS     t order by t.import_time desc; 


/*132-中国商标*/  select t.*, t.rowid from S_CHINA_BRAND                   t order by t.import_time desc; 
/*133-中国商标许可数据*/  select t.*, t.rowid from S_CHINA_BRAND_LICENSE           t order by t.import_time desc; 
/*134-中国商标转让数据*/  select t.*, t.rowid from S_CHINA_BRAND_TRANSFER          t order by t.import_time desc; 
/*136-马德里商标进入中国*/  select t.*, t.rowid from S_MADRID_BRAND_ENTER_CHINA      t order by t.import_time desc; 
/*137-中国驰名商标数据*/  select t.*, t.rowid from S_CHINA_WELLKNOWN_BRAND         t order by t.import_time desc; 
/*138-美国申请商标*/  select t.*, t.rowid from S_AMERICA_APPLY_BRAND           t order by t.import_time desc; 
/*139-美国转让商标*/  select t.*, t.rowid from S_AMERICA_TRANSFER_BRAND        t order by t.import_time desc; 
/*140-美国审判商标*/  select t.*, t.rowid from S_AMERICA_TRIAL_BRAND           t order by t.import_time desc;

 
/*147-社内外知识产权图书题录数据*/  select t.*, t.rowid from S_COMMUNITY_INTELLECTUALRECORD  t order by t.import_time desc; 
/*148-民国书*/  select t.*, t.rowid from S_CHINA_BOOK                    t order by t.import_time desc; 
/*153-中外期刊的著录项目与文摘数据*/  select t.*, t.rowid from S_JOURNAL_PROJECT_ABSTRACT      t order by t.import_time desc; 
/*162-中国法院判例初加工数据*/  select t.*, t.rowid from S_CHINA_COURTCASE_PROCESS       t order by t.import_time desc; 
/*168-中国商标分类数据*/  select t.*, t.rowid from S_CHINA_BRAND_CLASSIFICATION    t order by t.import_time desc; 
/*169-美国商标图形分类数据*/  select t.*, t.rowid from S_AMERICAN_BRAND_GRAPHCLASSIFY  t order by t.import_time desc; 
/*170-美国商标美国分类数据*/  select t.*, t.rowid from S_AMERICAN_BRAND_USCLASSIFY     t order by t.import_time desc; 
/*172-马德里商标购买数据*/  select t.*, t.rowid from S_MADRID_BRAND_PURCHASE     t order by t.import_time desc; 
/*180-中国专利代理知识产权法律法规加工数据*/  select t.*, t.rowid from S_CHINA_PATENT_LAWSPROCESS      t order by t.import_time desc; 
/*183-中国集成电路布图公告及事务数据*/  select t.*, t.rowid from S_CHINA_CIRCUITLAYOUT           t order by t.import_time desc; 
/*184-中国知识产权海关备案数据*/  select t.*, t.rowid from S_CHINA_CUSTOMS_RECORD         t order by t.import_time desc; 
/*186-国外专利生物序列加工成品数据*/  select t.*, t.rowid from S_FOREIGN_PATENT_SEQUENCE      t order by t.import_time desc; 
/*194-中国专利复审数据*/  select t.*, t.rowid from S_CHINA_PATENT_REVIEW          t order by t.import_time desc; 
/*195-中国专利无效数据*/  select t.*, t.rowid from S_CHINA_PATENT_INVALID         t order by t.import_time desc; 
/*196-中国专利的判决书数据*/  select t.*, t.rowid from S_CHINA_PATENT_JUDGMENT        t order by t.import_time desc; 
/*209-中国生物序列深加工数据*/  select t.*, t.rowid from S_CHINA_BIOLOGICAL_PROCESS     t order by t.import_time desc; 
/*210-中国中药专利翻译数据*/  select t.*, t.rowid from S_CHINA_MEDICINE_PATENT_TRANS  t order by t.import_time desc; 
/*211-中国化学药物专利深加工数据*/  select t.*, t.rowid from S_CHINA_PHARMACEUTICAL_PATENT  t order by t.import_time desc; 
/*212-中国中药专利深加工数据*/  select t.*, t.rowid from S_CHINA_MEDICINE_PATENT_HANDLE t order by t.import_time desc; 
/*213-中国专利摘要英文翻译数据*/  select t.*, t.rowid from S_CHINA_PATENT_ABSTRACTS       t order by t.import_time desc; 

/*215-国际知识产权组织专利著录项及全文数据*/  select t.*, t.rowid from S_WIPO_PATENT_DESCRIPTION      t order by t.import_time desc; 
/*216-加拿大专利著录项及全文数据*/  select t.*, t.rowid from S_CANADIAN_PATENT_DESCRIPTION  t order by t.import_time desc; 
/*217-俄罗斯专利著录项及全文数据*/  select t.*, t.rowid from S_RUSSIAN_PATENT_DESCRIPTION   t order by t.import_time desc; 
/*218-澳大利亚专利全文文本数据*/  select t.*, t.rowid from S_AUSTRALIAN_PATENT_FULLTEXT   t order by t.import_time desc; 
/*219-德国专利著录项及全文数据*/  select t.*, t.rowid from S_GERMAN_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*220-法国专利著录项及全文数据*/  select t.*, t.rowid from S_FRENCH_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*221-台湾专利著录项及全文数据*/  select t.*, t.rowid from S_TAIWAN_PATENT_DESCRIPTION    t order by t.import_time desc; 
/*222-香港专利著录项数据*/  select t.*, t.rowid from S_HONGKONG_PATENT_DESCRIPTION  t order by t.import_time desc; 
/*223-澳门专利著录项数据*/  select t.*, t.rowid from S_MACAO_PATENT_DESCRIPTION     t order by t.import_time desc; 
/*224-欧亚组织专利著录项及全文数据*/  select t.*, t.rowid from S_EURASIAN_PATENT_DESCRIPTION  t order by t.import_time desc; 
/*225-日本外观设计专利数据*/  select t.*, t.rowid from S_JAPAN_DESIGN_PATENT          t order by t.import_time desc; 
/*226-德国外观设计专利数据*/  select t.*, t.rowid from S_GERMAN_DESIGN_PATENT         t order by t.import_time desc; 
/*227-法国外观设计专利数据*/  select t.*, t.rowid from S_FRENCH_DESIGN_PATENT         t order by t.import_time desc; 
/*228-俄罗斯外观设计专利数据*/  select t.*, t.rowid from S_RUSSIAN_DESIGN_PATENT        t order by t.import_time desc; 
/*229-日本专利文摘英文翻译数据*/  select t.*, t.rowid from S_JAPAN_PATENT_ABSTRACTS       t order by t.import_time desc; 
/*230-韩国专利文摘英文翻译数据*/  select t.*, t.rowid from S_KOREA_PATENT_ABSTRACTS       t order by t.import_time desc; 

select s.*, s.rowid from S_DATA_RESOURCE_TYPES_DETAIL s order by s.id asc;

update S_DATA_RESOURCE_TYPES_DETAIL s set s.implemented_import_logic = null;


update S_DATA_RESOURCE_TYPES_DETAIL s set s.implemented_import_logic = 'Y' where s.id in (1,2,3,4,5,6,8,9,10,11,13,14,50,51,52,53,54,55,76,77,78,79,103,104,105,106,107,108,121,132,133,134,136,137,138,139,153,162,168,169,170,172,180,186,194,196,209,210,211,212,213,214,215,216,217,218,219,220,223,224,225,226,228)

select s.*, s.rowid from S_DATA_RESOURCE_TYPES_DETAIL s where s.implemented_import_logic is null order by s.id asc;

select count(*) from S_DATA_RESOURCE_TYPES_DETAIL s where s.implemented_import_logic='Y' order by s.id asc;

select * from S_BIOLOGICAL_SEQ;




 from table S_DATA_RESOURCE_TYPES_DETAIL


update S_DATA_RESOURCE_TYPES_DETAIL s set s.chinese_name='' where id = 1












drop user drmsdev cascade;




































































