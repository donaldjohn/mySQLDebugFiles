select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t;














create table S_STD_CN_PRS
(
  id                    VARCHAR2(100) not null,
  app_number            VARCHAR2(200),
  pub_date              DATE,
  law_state             VARCHAR2(200),
  law_state_information VARCHAR2(4000),
  import_session_id     VARCHAR2(100),
  import_time           DATE,
  file_path             VARCHAR2(1000),
  archive_inner_path    VARCHAR2(1000),
  session_index         NUMBER,
  doc_file_name         VARCHAR2(500)
);
comment on column S_STD_CN_PRS.id
  is '主键';
comment on column S_STD_CN_PRS.app_number
  is '专利申请号';
comment on column S_STD_CN_PRS.pub_date
  is '法律状态公告日';
comment on column S_STD_CN_PRS.law_state
  is '法律状态';
comment on column S_STD_CN_PRS.law_state_information
  is '法律状态信息';
alter table S_STD_CN_PRS
  add primary key (ID);  
























select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t where upper(t.table_name) = 'S_STD_CN_PRS';























alter table S_CHINA_BRAND_TRANSFER modify nameinfo_name VARCHAR2(1000);
alter table S_CHINA_BRAND_TRANSFER modify transferinfo_shrr_name VARCHAR2(4000);






alter table s_china_brand_transfer modify nameinfo_name varchar2(1000);

alter table s_China_Brand_Transfer modify transferinfo_shrr_name varchar2(4000);















delete from S_DOCDB t where t.file_path = '\\10.33.79.4\vol71_0\std_zip\DOCDB\20160524\WO\20101118\20101118-1-001.ZIP'




select count(*) from S_CHINA_PATENT_TEXTCODE doc;


select * from s_index_file_info inf where inf.data_res = '中国标准化简单引文数据' and inf.batch is not null;
select * from s_index_file_detail dtl where dtl.data_res = '中国标准化简单引文数据' and dtl.batch is not null
;












alter table s_index_file_info drop column application_num;


select * from s_data_resource_types_detail dtl where dtl.id in (13, 132, 138, 162, 172);


select * from S_CHINA_STANDARD_SIMPCITATION s 



select * from S_CHINA_STANDARD_SIMPCITATION s where s.ori_app_number like '%CN201310744084%';
select * from S_CHINA_BOOK b order by b.import_time desc;
select * from import_session s where s.data_res_type like '%无效%';
select * from import_session s where s.data_res_type like '%复审%';
delete from import_session s where s.data_res_type like '%无效%';
delete from import_session s where s.data_res_type like '%复审%';
commit;

select * from import_session s
where
exists (
select 1 from s_china_patent_review r
where s.session_id = r.import_session_id
)



select * from s_import_bath b where b.res_type = '中国商标许可数据' order by b.start_time desc;



select distinct s.data_res_type 
from 
import_session s 
where s.zip_or_dir_path like '\\192.168.3.75\di_data\ZipData\MARK_CN_ZIP_20160708%';


delete from import_session s where s.data_res_type = '中国商标许可数据';
commit;



select * from import_session s where s.session_id= 'bb8b666d-2a28-4c94-8143-6b933817ee50';

select * from import_session s where s.data_res_type = '中国商标许可数据' order by ;
中国商标
中国商标转让数据






delete from S_T_MEDICINE_TRANS_T1 where file_path = 'W:\210-中国中药专利翻译数据ok\中药翻译201602.mdb';

delete from S_T_MEDICINE_TRANS_T2 where file_path = 'W:\210-中国中药专利翻译数据ok\中药翻译201602.mdb';


select (select count(1) from S_T_MEDICINE_TRANS_T1) as cnt1, (select count(1) from S_T_MEDICINE_TRANS_T2) cnt2 from dual;


select (select count(1) from S_T_PHARMACEUTICAL_T1) as cnt1, (select count(1) from S_T_PHARMACEUTICAL_T2), (select count(1) from S_T_PHARMACEUTICAL_T3) cnt3 from dual
union
select (select count(1) from S_T_MEDICINE_HANDLE_T1) as cnt1, (select count(1) from S_T_MEDICINE_HANDLE_T2), (select count(1) from S_T_MEDICINE_HANDLE_T3) cnt3 from dual;


alter table S_JOURNAL_PROJECT_ABSTRACT add ARTICLE_INFO_KEYWORDS_ALL_L clob;
update S_JOURNAL_PROJECT_ABSTRACT set ARTICLE_INFO_KEYWORDS_ALL_L = ARTICLE_INFO_KEYWORDS_ALL;
commit;

alter table S_JOURNAL_PROJECT_ABSTRACT rename column ARTICLE_INFO_KEYWORDS_ALL to ARTICLE_INFO_KEYWORDS_ALL_O;
alter table S_JOURNAL_PROJECT_ABSTRACT rename column ARTICLE_INFO_KEYWORDS_ALL_L to ARTICLE_INFO_KEYWORDS_ALL;

alter table S_JOURNAL_PROJECT_ABSTRACT drop column ARTICLE_INFO_KEYWORDS_ALL_O; 

select dbms_lob.substr(j.article_info_keywords_all, 4000), j.article_info_keywords_all_o from S_JOURNAL_PROJECT_ABSTRACT j;

select * from s_index_file_info;

select * from s_index_file_info;
select * from S_CHINA_PATENT_STANDARDFULLTXT;
select * from S_DOCDB;
update S_CHINA_PATENT_STANDARDFULLTXT t set doc_File_Name = substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1); 
commit;
update S_CHINA_PATENT_STANDARDFULLTXT t set doc_File_Name = substr(t.archive_inner_path, instr(t.archive_inner_path, '/', -1, 1) + 1);
commit;
select * from S_CHINA_PATENT_STANDARDFULLTXT;
select translate(',01234,2342,2,', 'b0123456789', ' ') from dual;
select translate('abcbbaadef','ba','#@') from dual;
select * from s_data_resource_types_detail;






alter table S_INDEX_FILE_INFO add pub_kind varchar2(20);

update S_INDEX_FILE_INFO i set pub_kind = substr(i.file_path, instr(i.file_path, '-', -1, 2) + 1,  instr(i.file_path, '-', -1, 1) - instr(i.file_path, '-', -1, 2) -1);



alter table S_INDEX_FILE_INFO add pub_type varchar2(200);
update S_INDEX_FILE_INFO i set pub_type = substr(i.file_path, instr(i.file_path, '\', -1,3) + 1,  instr(i.file_path, '\', -1,2) - instr(i.file_path, '\', -1, 3) -1);



alter table S_INDEX_FILE_INFO add index_file_name varchar2(200);
update S_INDEX_FILE_INFO i set index_file_name = substr(i.file_path, instr(i.file_path, '\', -1, 1)+1);



select * from s_index_file_detail d ;


select SOUNDEX('hello') from dual;
select instr('abcdabcabc', 'a', -1, 2) from dual;


select count(*) from S_INDEX_FILE_DETAIL;



select * from S_INDEX_FILE_DETAIL;


select t.date_publication, (t.file_path, length(t.file_path) - length('20110824\INDEX-CN-20110824-S-001.XML') + 1, 8) as parentDir from S_INDEX_FILE_INFO t;







update s_Index_File_Info t set t.self_check_successed = 'N';
create index indexDetilFilePath on S_INDEX_FILE_DETAIL(index_file_path);
create index indexInfoFilePath on S_INDEX_FILE_INFO(file_path);
select null + 100 from dual;
select * from S_Index_File_Info i;
select * from  S_Index_File_Detail b;

select * from  S_Index_File_Detail b where b.index_file_path = 'W:\003 索引\INDEX-CN-20101117-A-001.XML';




select * from S_Index_File_Detail b where b.index_info_id in (select f.id from  S_Index_File_Info f w);


delete from  S_Index_File_Info f where f.file_path = '{filePath}';
delete from S_Index_File_Detail d where d.index_file_path='{filePath}';

alter table S_Index_File_Detail add archive_inner_path varchar2(4000);


alter table S_Index_File_Info add doclist_Count varchar2(1000);






rename S_Index_File_Info to S_Index_File_Detail;


select * from S_Index_File_Detail;

select * from S_Index_File_Info;

alter table S_Index_File_Detail add index_info_ID varchar2(100);

alter table S_Index_File_Info add fully_imported varchar2(100);
alter table S_Index_File_Info add validated_Success varchar2(100);




create table S_Index_File_Info
(
  id               varchar2(100) not null,
  date_exchange    varchar2(100),
  date_produced    varchar2(100),
  date_publication varchar2(100),
  pat_cnt          varchar2(100),
  data_res         varchar2(100),
  file_Path  varchar2(4000),
  import_time      timestamp
)
;

alter table S_Index_File_Info
add constraint indexInfoPrimaryK primary key (id);


alter table S_Index_File_Info
  add constraint indexInfoPrimaryK primary key (ID)









create prim

rename S_IDX_FILE_INFO to S_Index_FILE_INFO;

select * from S_Index_FILE_INFO;



select to_date('2017-01-17', '')

select sysdate from dual;

























select * from S_CHINA_PATENT_STANDARDFULLTXT s;
select * from s_data_resource_types_detail t order by t.id asc;

select * from import_session t where t.data_res_type='DOCDB数据（标准化）';

update import_session t set tablename = 'S_DOCDB' where t.data_res_type='DOCDB数据（标准化）';

W:\186 国外专利生物序列数据-供DI应用ok\ipphdata20160509-all\data\1462753576161-0.xml
Z:\样例数据\186 国外专利生物序列数据-供DI应用ok\ipphdata20160509-all\data\1462753575954-0.xml
select * from   S_FOREIGN_PATENT_SEQUENCE f where f.file_path = 'W:\186 国外专利生物序列数据-供DI应用ok\ipphdata20160509-all\data\1462753576161-0.xml';
select * from   S_BIOLOGICAL_SEQ b where b.s_foreign_patent_seq_id in (select f.id from   S_FOREIGN_PATENT_SEQUENCE f where f.file_path = 'W:\186 国外专利生物序列数据-供DI应用ok\ipphdata20160509-all\data\1462753576161-0.xml');


delete from  S_FOREIGN_PATENT_SEQUENCE f where f.file_path = '{file_Path}';
delete from S_BIOLOGICAL_SEQ b where b.s_foreign_patent_seq_id in (select f.id from   S_FOREIGN_PATENT_SEQUENCE f where f.file_path = '{file_Path}');


select * from S_CHINA_PATENT_TEXTCODE t where t.file_path = 'W:\001-中国专利代码化数据ok\FULL TEXT FOR INDUSTRIAL DESIGN\19851110-001.ZIP'

delete from S_CHINA_PATENT_TEXTCODE t where t.file_path = 'W:\001-中国专利代码化数据ok\FULL TEXT FOR INDUSTRIAL DESIGN\19851110-001.ZIP'











e4a1f189-2c98-480a-9778-3f201ffa2419


select * from S_T_BIOLOGICAL_FY b ;

W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-02月翻译完的数据(1333件)201511\201510444655.ST25.txt


select * from S_T_BIOLOGICAL_FY b where b.file_path = 'W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月翻译完的数据(747件)201510\201510511169.ST25.txt';
select *  from S_T_BIOLOGICAL_INFO_FY i where i.bio_id in (select b.id from S_T_BIOLOGICAL_FY b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月翻译完的数据(747件)201510\201510511169.ST25.txt');
select *  from S_T_BIOLOGICAL_PRIORITY_FY p where p.bio_id in (select b.id from S_T_BIOLOGICAL_FY b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月翻译完的数据(747件)201510\201510511169.ST25.txt');
select *  from S_T_BIOLOGICAL_FEATURE_FY f where f.bio_id in (select b.id from S_T_BIOLOGICAL_FY b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月翻译完的数据(747件)201510\201510511169.ST25.txt');


select b.id from S_T_BIOLOGICAL_FY b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月翻译完的数据(747件)201510\201510511169.ST25.txt'

select * from S_T_BIOLOGICAL_FY b where b.id='074130b6-e50d-49b2-8e4a-a24cf646a38f';
select *  from S_T_BIOLOGICAL_FEATURE_FY f where f.bio_id in (select id from S_T_BIOLOGICAL_FY);

select *  from S_T_BIOLOGICAL_FEATURE_FY f where f.bio_id = '074130b6-e50d-49b2-8e4a-a24cf646a38f'


select * from S_T_BIOLOGICAL_CN b where b.file_path = 'W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月标引完的数据(747件)201510\201280069608.ST25.txt';
select *  from S_T_BIOLOGICAL_INFO_CN i where i.bio_id in (select b.id from S_T_BIOLOGICAL_CN b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月标引完的数据(747件)201510\201280069608.ST25.txt');
select *  from S_T_BIOLOGICAL_PRIORITY_CN p where p.bio_id in (select b.id from S_T_BIOLOGICAL_CN b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月标引完的数据(747件)201510\201280069608.ST25.txt');
select *  from S_T_BIOLOGICAL_FEATURE_CN f where f.bio_id in (select b.id from S_T_BIOLOGICAL_CN b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月标引完的数据(747件)201510\201280069608.ST25.txt');

select * from S_T_BIOLOGICAL_CN b where b.id = 'e4a1f189-2c98-480a-9778-3f201ffa2419';

where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月标引完的数据(747件)201510\201280069608.ST25.txt')
 
 

delete from S_T_BIOLOGICAL_CN b where b.file_path = 'W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月标引完的数据(747件)201510\201280069608.ST25.txt';
delete from S_T_BIOLOGICAL_INFO_CN i where i.bio_id in (select b.id from S_T_BIOLOGICAL_CN b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月标引完的数据(747件)201510\201280069608.ST25.txt');
delete from S_T_BIOLOGICAL_PRIORITY_CN p where p.bio_id in (select b.id from S_T_BIOLOGICAL_CN b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月标引完的数据(747件)201510\201280069608.ST25.txt');
delete from S_T_BIOLOGICAL_FEATURE_CN f where f.bio_id in (select b.id from S_T_BIOLOGICAL_CN b where b.file_path='W:\209-中国生物序列深加工数据ok\已入库\2016年完成Part1\2016-01月标引完的数据(747件)201510\201280069608.ST25.txt');



select * from import_session t where t.data_res_type='中国专利标准化全文文本数据';
delete from s_China_Patent_Textimage t where t.file_path = '{filePath}';

select * from s_China_Patent_Textimage t where t.file_path = 'W:\002-中国专利全文图像数据ok\FM\2016\20160706-001.zip';

delete from s_China_Patent_Textimage t where t.file_path = 'W:\002-中国专利全文图像数据ok\FM\2016\20160706-001.zip';

select * from s_import_bath b where b.res_type='马德里商标购买数据';
delete from s_import_bath b where b.res_type='马德里商标购买数据';
select * from import_session t where t.data_res_type = '马德里商标购买数据';
delete from import_session t where t.data_res_type = '马德里商标购买数据';
select * from S_MADRID_BRAND_PURCHASE t where t.file_path = '';
select count(*) from S_MADRID_BRAND_PURCHASE;
truncate table S_MADRID_BRAND_PURCHASE;



select b.* from s_import_bath b where b.res_type = '中国专利全文代码化数据';

/**001**/
select * from s_import_bath b where b.res_type='中国专利全文代码化数据';
delete from s_import_bath b where b.res_type='中国专利全文代码化数据';
select * from import_session t where t.data_res_type = '中国专利全文代码化数据';
delete from import_session t where t.data_res_type = '中国专利全文代码化数据';
select * from S_CHINA_PATENT_TEXTCODE;
select count(*) from S_CHINA_PATENT_TEXTCODE;
truncate table S_CHINA_PATENT_TEXTCODE;

/********清空表数据**********/
truncate table S_CHINA_MEDICINE_PATENT_TRANS;
/**中国中药专利翻译数据**/
delete from s_import_bath b where b.res_type='中国中药专利翻译数据';
select * from import_session t where t.data_res_type = '中国中药专利翻译数据';
/******************/






create index S_CHINA_PATENT_TEXTCODEISI  on S_CHINA_PATENT_TEXTCODE(Import_Session_Id);
create index S_CHINA_PATENT_TEXTIMAGEISI  on S_CHINA_PATENT_TEXTIMAGE(Import_Session_Id);
create index S_CHINA_PATENT_STANDARDFULLTXTISI  on S_CHINA_PATENT_STANDARDFULLTXT(Import_Session_Id);
create index S_CHINA_PATENT_STAND_TEXTIMAGEISI  on S_CHINA_PATENT_STAND_TEXTIMAGE(Import_Session_Id);
create index S_CHINA_PATENT_GAZETTEISI  on S_CHINA_PATENT_GAZETTE(Import_Session_Id);
create index S_CHINA_PATENT_BIBLIOGRAPHICISI  on S_CHINA_PATENT_BIBLIOGRAPHIC(Import_Session_Id);
create index S_CHINA_PATENT_LAWSTATEISI  on S_CHINA_PATENT_LAWSTATE(Import_Session_Id);
create index S_CHINA_PATENT_LAWSTATE_CHANGEISI  on S_CHINA_PATENT_LAWSTATE_CHANGE(Import_Session_Id);
create index S_CHINA_STANDARD_SIMPCITATIONISI  on S_CHINA_STANDARD_SIMPCITATION(Import_Session_Id);
create index S_PATENT_PAYMENTISI  on S_PATENT_PAYMENT(Import_Session_Id);
create index S_COMPANY_CODE_LIBRARYISI  on S_COMPANY_CODE_LIBRARY(Import_Session_Id);
create index S_ZONE_CODE_BASEISI  on S_ZONE_CODE_BASE(Import_Session_Id);
create index S_AMERICAN_PATENT_FULLTEXTISI  on S_AMERICAN_PATENT_FULLTEXT(Import_Session_Id);
create index S_EUROPEAN_PATENT_FULLTEXTISI  on S_EUROPEAN_PATENT_FULLTEXT(Import_Session_Id);
create index S_KOREAN_PATENT_FULLTEXTCODEISI  on S_KOREAN_PATENT_FULLTEXTCODE(Import_Session_Id);
create index S_SWISS_PATENT_FULLTEXTCODEISI  on S_SWISS_PATENT_FULLTEXTCODE(Import_Session_Id);
create index S_BRITISH_PATENT_FULLTEXTCODEISI  on S_BRITISH_PATENT_FULLTEXTCODE(Import_Session_Id);
create index S_JAPAN_PATENT_FULLTEXTCODEISI  on S_JAPAN_PATENT_FULLTEXTCODE(Import_Session_Id);
create index S_CHINA_PATENT_BIOLOGICALSEQISI  on S_CHINA_PATENT_BIOLOGICALSEQ(Import_Session_Id);
create index S_PATENT_FAMILYISI  on S_PATENT_FAMILY(Import_Session_Id);
create index S_GLOBAL_PATENT_CITATIONISI  on S_GLOBAL_PATENT_CITATION(Import_Session_Id);
create index S_CHINA_PATENT_FEEINFORMATIONISI  on S_CHINA_PATENT_FEEINFORMATION(Import_Session_Id);
create index S_CHINA_PATENT_NOTICESISI  on S_CHINA_PATENT_NOTICES(Import_Session_Id);
create index S_CHINA_LAWSTATE_INDEXINGLIBISI  on S_CHINA_LAWSTATE_INDEXINGLIB(Import_Session_Id);
create index S_WORLD_LEGAL_STATUSISI  on S_WORLD_LEGAL_STATUS(Import_Session_Id);
create index S_DOCDBISI  on S_DOCDB(Import_Session_Id);
create index S_BELGIAN_PATENT_FULLTEXTISI  on S_BELGIAN_PATENT_FULLTEXT(Import_Session_Id);
create index S_AUSTRIA_PATENT_FULLTEXTISI  on S_AUSTRIA_PATENT_FULLTEXT(Import_Session_Id);
create index S_SPANISH_PATENT_FULLTEXTISI  on S_SPANISH_PATENT_FULLTEXT(Import_Session_Id);
create index S_POLAND_PATENT_DESCRIPTIONISI  on S_POLAND_PATENT_DESCRIPTION(Import_Session_Id);
create index S_ISRAEL_PATENT_DESCRIPTIONISI  on S_ISRAEL_PATENT_DESCRIPTION(Import_Session_Id);
create index S_SINGAPORE_PATENT_DESCRIPTIONISI  on S_SINGAPORE_PATENT_DESCRIPTION(Import_Session_Id);
create index S_AMERICAN_DESIGN_PATENTISI  on S_AMERICAN_DESIGN_PATENT(Import_Session_Id);
create index S_KOREA_DESIGN_PATENTISI  on S_KOREA_DESIGN_PATENT(Import_Session_Id);
create index S_CHINA_PATENT_FULLTEXT_PDFISI  on S_CHINA_PATENT_FULLTEXT_PDF(Import_Session_Id);
create index S_FOREIGN_PATENT_FULLTEXT_PDFISI  on S_FOREIGN_PATENT_FULLTEXT_PDF(Import_Session_Id);
create index S_RUSSIAN_PATENT_ABSTRACTSISI  on S_RUSSIAN_PATENT_ABSTRACTS(Import_Session_Id);
create index S_CHINA_BRANDISI  on S_CHINA_BRAND(Import_Session_Id);
create index S_CHINA_BRAND_LICENSEISI  on S_CHINA_BRAND_LICENSE(Import_Session_Id);
create index S_CHINA_BRAND_TRANSFERISI  on S_CHINA_BRAND_TRANSFER(Import_Session_Id);
create index S_MADRID_BRAND_ENTER_CHINAISI  on S_MADRID_BRAND_ENTER_CHINA(Import_Session_Id);
create index S_CHINA_WELLKNOWN_BRANDISI  on S_CHINA_WELLKNOWN_BRAND(Import_Session_Id);
create index S_AMERICA_APPLY_BRANDISI  on S_AMERICA_APPLY_BRAND(Import_Session_Id);
create index S_AMERICA_TRANSFER_BRANDISI  on S_AMERICA_TRANSFER_BRAND(Import_Session_Id);
create index S_AMERICA_TRIAL_BRANDISI  on S_AMERICA_TRIAL_BRAND(Import_Session_Id);
create index S_COMMUNITY_INTELLECTUALRECORDISI  on S_COMMUNITY_INTELLECTUALRECORD(Import_Session_Id);
create index S_CHINA_BOOKISI  on S_CHINA_BOOK(Import_Session_Id);
create index S_JOURNAL_PROJECT_ABSTRACTISI  on S_JOURNAL_PROJECT_ABSTRACT(Import_Session_Id);
create index S_CHINA_COURTCASE_PROCESSISI  on S_CHINA_COURTCASE_PROCESS(Import_Session_Id);
create index S_CHINA_BRAND_CLASSIFICATIONISI  on S_CHINA_BRAND_CLASSIFICATION(Import_Session_Id);
create index S_AMERICAN_BRAND_GRAPHCLASSIFYISI  on S_AMERICAN_BRAND_GRAPHCLASSIFY(Import_Session_Id);
create index S_AMERICAN_BRAND_USCLASSIFYISI  on S_AMERICAN_BRAND_USCLASSIFY(Import_Session_Id);
create index S_MADRID_BRAND_PURCHASEISI  on S_MADRID_BRAND_PURCHASE(Import_Session_Id);
create index S_CHINA_PATENT_LAWSPROCESSISI  on S_CHINA_PATENT_LAWSPROCESS(Import_Session_Id);
create index S_CHINA_CIRCUITLAYOUTISI  on S_CHINA_CIRCUITLAYOUT(Import_Session_Id);
create index S_CHINA_CUSTOMS_RECORDISI  on S_CHINA_CUSTOMS_RECORD(Import_Session_Id);
create index S_FOREIGN_PATENT_SEQUENCEISI  on S_FOREIGN_PATENT_SEQUENCE(Import_Session_Id);
create index S_CHINA_PATENT_REVIEWISI  on S_CHINA_PATENT_REVIEW(Import_Session_Id);
create index S_CHINA_PATENT_INVALIDISI  on S_CHINA_PATENT_INVALID(Import_Session_Id);
create index S_CHINA_PATENT_JUDGMENTISI  on S_CHINA_PATENT_JUDGMENT(Import_Session_Id);
create index S_CHINA_BIOLOGICAL_PROCESSISI  on S_CHINA_BIOLOGICAL_PROCESS(Import_Session_Id);
create index S_T_BIOLOGICAL_CNISI  on S_T_BIOLOGICAL_CN(Import_Session_Id);
create index S_T_BIOLOGICAL_FYISI  on S_T_BIOLOGICAL_FY(Import_Session_Id);
create index S_CHINA_MEDICINE_PATENT_TRANSISI  on S_CHINA_MEDICINE_PATENT_TRANS(Import_Session_Id);
create index S_CHINA_PHARMACEUTICAL_PATENTISI  on S_CHINA_PHARMACEUTICAL_PATENT(Import_Session_Id);
create index S_CHINA_MEDICINE_PATENT_HANDLEISI  on S_CHINA_MEDICINE_PATENT_HANDLE(Import_Session_Id);
create index S_CHINA_PATENT_ABSTRACTSISI  on S_CHINA_PATENT_ABSTRACTS(Import_Session_Id);
create index S_DOCDBISI  on S_DOCDB(Import_Session_Id);
create index S_WIPO_PATENT_DESCRIPTIONISI  on S_WIPO_PATENT_DESCRIPTION(Import_Session_Id);
create index S_CANADIAN_PATENT_DESCRIPTIONISI  on S_CANADIAN_PATENT_DESCRIPTION(Import_Session_Id);
create index S_RUSSIAN_PATENT_DESCRIPTIONISI  on S_RUSSIAN_PATENT_DESCRIPTION(Import_Session_Id);
create index S_AUSTRALIAN_PATENT_FULLTEXTISI  on S_AUSTRALIAN_PATENT_FULLTEXT(Import_Session_Id);
create index S_GERMAN_PATENT_DESCRIPTIONISI  on S_GERMAN_PATENT_DESCRIPTION(Import_Session_Id);
create index S_FRENCH_PATENT_DESCRIPTIONISI  on S_FRENCH_PATENT_DESCRIPTION(Import_Session_Id);
create index S_TAIWAN_PATENT_DESCRIPTIONISI  on S_TAIWAN_PATENT_DESCRIPTION(Import_Session_Id);
create index S_HONGKONG_PATENT_DESCRIPTIONISI  on S_HONGKONG_PATENT_DESCRIPTION(Import_Session_Id);
create index S_MACAO_PATENT_DESCRIPTIONISI  on S_MACAO_PATENT_DESCRIPTION(Import_Session_Id);
create index S_EURASIAN_PATENT_DESCRIPTIONISI  on S_EURASIAN_PATENT_DESCRIPTION(Import_Session_Id);
create index S_JAPAN_DESIGN_PATENTISI  on S_JAPAN_DESIGN_PATENT(Import_Session_Id);
create index S_GERMAN_DESIGN_PATENTISI  on S_GERMAN_DESIGN_PATENT(Import_Session_Id);
create index S_FRENCH_DESIGN_PATENTISI  on S_FRENCH_DESIGN_PATENT(Import_Session_Id);
create index S_RUSSIAN_DESIGN_PATENTISI  on S_RUSSIAN_DESIGN_PATENT(Import_Session_Id);
create index S_JAPAN_PATENT_ABSTRACTSISI  on S_JAPAN_PATENT_ABSTRACTS(Import_Session_Id);
create index S_KOREA_PATENT_ABSTRACTSISI  on S_KOREA_PATENT_ABSTRACTS(Import_Session_Id);
create index S_WORLD_PATENT_LAWSTATUSISI  on S_WORLD_PATENT_LAWSTATUS(Import_Session_Id);
create index S_STD_JP_CITISI  on S_STD_JP_CIT(Import_Session_Id);
create index S_STD_KR_CITISI  on S_STD_KR_CIT(Import_Session_Id);
create index S_STD_KR_PRSISI  on S_STD_KR_PRS(Import_Session_Id);





















select * from s_import_bath t where t.id = '7befb307-52b3-4403-9b12-57532cd82d42'


7befb307-52b3-4403-9b12-57532cd82d42








select t.*, t.rowid from import_session t  order by t.start_time desc;
b764d997-41e2-4be6-b5ad-ad0553698531
5428a13d-6e13-4c41-a0b7-469890c8f635
select * from import_error t where t.session_id = 'b764d997-41e2-4be6-b5ad-ad0553698531';
5428a13d-6e13-4c41-a0b7-469890c8f635

delete from import_session t where t.session_id = '134e1033-6564-4684-80ba-0496c813dcb5'


134e1033-6564-4684-80ba-0496c813dcb5
select t.*, t.rowid from S_CHINA_PATENT_TEXTCODE t where t.file_path like  '%20160706-001.ZIP';

delete from S_CHINA_PATENT_TEXTCODE t where t.import_session_id = '7d261c5e-73bc-4463-9965-a4abd84ef417';

select t.*, t.rowid from s_data_resource_types_detail t order by t.id asc;

create index S_CHINA_PATENT_TEXTCODEISI  on S_CHINA_PATENT_TEXTCODE(Import_Session_Id)

create index ImportSessionIDIndex on Import_Session(session_id);

create index ImportSessionPathIndex on Import_Session(zip_or_dir_path);



select t.session_id, t.zip_or_dir_path from Import_Session t;


select t.* from import_session t where t.tablename is null;


delete from  import_session t where t.tablename is null;





select * from S_CHINA_MEDICINE_PATENT_TRANS t; 
select * from S_CHINA_MEDICINE_PATENT_HANDLE t;

select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t;

select * from S_CHINA_PATENT_REVIEW t;

select t.sequence_file_path, t.* from S_T_BIOLOGICAL_CN t;

select * from S_AMERICA_APPLY_BRAND t;

select t.sequence_file_path, t.* from S_T_BIOLOGICAL_CN t;

select * from S_CHINA_MEDICINE_PATENT_TRANS t;

table S_CHINA_MEDICINE_PATENT_TRANS;

select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t where t.hasexporter = 'Y';

select * from S_CHINA_BRAND t order by t.import_time desc;

create index sCnBrandMarkCNID on S_CHINA_BRAND(Mark_Cn_Id);

select t.path_file, t.path_jpg, t.path_jpg_sf from S_CHINA_BRAND t where '1' = t.path_jpg_sf;

select * from S_CHINA_BRAND where MARK_CN_ID in ('CN00000013503824', 'CN00000015868609');

select t.mark_cn_id from s_china_brand t;

select * from S_CHINA_BRAND where MARK_CN_ID='CN00000013503824';

select t.f_oneaddress, t.* from w_sjzyztsxxx t where t.f_datanum = '600';
select * from w_sjzyztsxxx t where t.f_dataname like '%中国商标%';
select * from s_china_brand;
select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t where t.hasexporter = 'Y';
select * from s_import_bath t order by t.start_time desc;
select t2.username,t2.sid,t2.serial#,t2.logon_time
from v$locked_object t1,v$session t2
where t1.session_id=t2.sid order by t2.logon_time;

select sql_text from v$session a,v$sqltext_with_newlines b
  where DECODE(a.sql_hash_value, 0, prev_hash_value, sql_hash_value)=b.hash_value
  and a.sid='242' order by piece;

select t.import_time,  t.* from S_JOURNAL_PROJECT_ABSTRACT t order by t.import_time desc;

truncate table S_JOURNAL_PROJECT_ABSTRACT;

select * from v$_lock;


select * from s_import_bath t where t.id = '4b08b716-03cb-40eb-bd60-ddb40539b5a6';
select * from s_import_bath t where t.id = '59599c96-32ea-4a1c-bb63-fbf5834c8678';

select * from S_T_BIOLOGICAL_FEATURE_CN;




select c.COLUMN_NAME from user_tab_columns c where c.TABLE_NAME='S_T_BIOLOGICAL_CN';
select c.COLUMN_NAME from user_tab_columns c where c.TABLE_NAME='S_T_BIOLOGICAL_PRIORITY_CN';
select c.COLUMN_NAME from user_tab_columns c where c.TABLE_NAME='S_T_BIOLOGICAL_INFO_CN';
select t.archive_inner_path, t.file_path from S_MADRID_BRAND_PURCHASE t where t.VIENNAGR_VIECLAI is not null;
select t.viennagr_vieclai, t.viennagr_viecla3, t.* from S_MADRID_BRAND_PURCHASE t;
truncate table S_MADRID_BRAND_PURCHASE;


select * from S_T_BIOLOGICAL_CN;
select * from S_T_BIOLOGICAL_PRIORITY_CN;
select * from S_T_BIOLOGICAL_INFO_CN;
select * from S_T_BIOLOGICAL_FEATURE_CN;


select t.current_application_number, t.information_for_seq_id_no, t.name_key, t.location, t.other_info from S_T_BIOLOGICAL_FEATURE_CN t order by t.current_application_number asc,to_number(t.information_for_seq_id_no) asc;

truncate table S_T_BIOLOGICAL_CN;
truncate table S_T_BIOLOGICAL_PRIORITY_CN;
truncate table S_T_BIOLOGICAL_INFO_CN;
truncate table S_T_BIOLOGICAL_FEATURE_CN;


select * from S_T_BIOLOGICAL_FY;
select * from S_T_BIOLOGICAL_PRIORITY_FY;
select * from S_T_BIOLOGICAL_INFO_FY;
select * from S_T_BIOLOGICAL_FEATURE_FY;
select t.current_application_number, t.information_for_seq_id_no, t.name_key, t.location, t.other_info from S_T_BIOLOGICAL_FEATURE_FY t order by t.current_application_number asc,to_number(t.information_for_seq_id_no) asc;




truncate table S_T_BIOLOGICAL_FY;
truncate table S_T_BIOLOGICAL_PRIORITY_FY;
truncate table S_T_BIOLOGICAL_INFO_FY;
truncate table S_T_BIOLOGICAL_FEATURE_FY;






alter table S_T_BIOLOGICAL_FEATURE_FY add bio_id varchar2(100);
alter table S_T_BIOLOGICAL_FEATURE_FY add bio_info varchar2(100);

alter table S_T_BIOLOGICAL_FEATURE_CN add bio_info_seq_no varchar2(100);
alter table S_T_BIOLOGICAL_FEATURE_FY add bio_info_seq_no varchar2(100);


-- Create table
create table "S_T_BIOLOGICAL_FEATURE_CN"
(
  id                         VARCHAR2(100) not null,
  current_application_number VARCHAR2(200),
  information_for_seq_id_no  VARCHAR2(200),
  feature                    VARCHAR2(4000),
  name_key                   VARCHAR2(4000),
  location                   VARCHAR2(4000),
  other_info                 VARCHAR2(4000)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table "S_T_BIOLOGICAL_FEATURE_CN"
  add constraint PRI_FUR_CN primary key (ID);
  
  
  
  -- Create table
create table "S_T_BIOLOGICAL_FEATURE_FY"
(
  id                         VARCHAR2(100) not null,
  current_application_number VARCHAR2(200),
  information_for_seq_id_no  VARCHAR2(200),
  feature                    VARCHAR2(4000),
  name_key                   VARCHAR2(4000),
  location                   VARCHAR2(4000),
  other_info                 VARCHAR2(4000)
);

alter table "S_T_BIOLOGICAL_FEATURE_FY"
  add constraint PRI_FUR_FY primary key (ID);


drop table "S_T_BIOLOGICAL _FEATURE_CN";
drop table "S_T_BIOLOGICAL _FEATURE_FY";






select * from S_T_BIOLOGICAL_INFO_CN t;

select t.import_time, t.* from s_madrid_brand_purchase t order by t.import_time desc;

select count(*) from s_madrid_brand_purchase t order by t.import_time desc;

truncate table s_madrid_brand_purchase;

select * from s_data_resource_types_detail t where t.implemented_import_logic = 'Y' order by ID asc;

select t.*, t.rowid from S_CHINA_PATENT_STANDARDFULLTXT t;

select distinct t.ori_pub_kind from S_CHINA_PATENT_STANDARDFULLTXT t where t.ori_pub_date= to_date('20150114', 'yyyyMMdd');

truncate table S_CHINA_PATENT_STANDARDFULLTXT;

select t.*, t.rowid from S_CHINA_MEDICINE_PATENT_TRANS t;

select count(*) from  S_CHINA_MEDICINE_PATENT_TRANS t;

truncate table S_CHINA_MEDICINE_PATENT_TRANS;

select c.COLUMN_NAME from user_tab_columns c where c.TABLE_NAME='S_T_BIOLOGICAL_FEATURE_CN';

select t.id as 序号, t.chinese_name as 资源类型, t.table_name as 表名,  t.rowid from s_data_resource_types_detail t where t.implemented_import_logic='Y' order by t.id asc;

select * from s_china_brand;

truncate table s_china_brand;
















select * from S_CHINA_PATENT_FULLTEXT_PDF;

select to_char(substr(t.abstract_en, 1, 3000)),to_char(substr(t.abstract_zh, 1, 3000)), t.* from S_DOCDB t;


truncate table S_DOCDB;


select count(*) from S_DOCDB;



create table S_DOCDB
(
  id                        VARCHAR2(100) not null,
  sta_pub_country           VARCHAR2(200),
  sta_pub_number            VARCHAR2(200),
  sta_pub_kind              VARCHAR2(200),
  sta_pub_date              DATE,

  docdb_pub_country         VARCHAR2(200),
  docdb_pub_number          VARCHAR2(200),
  docdb_pub_kind            VARCHAR2(200),
  docdb_pub_date            DATE,

  epodc_pub_number          VARCHAR2(200),

  ori_pub_country           VARCHAR2(200),
  ori_pub_number            VARCHAR2(200),
  ori_pub_kind              VARCHAR2(200),
  ori_pub_date              DATE,

  sta_app_country           VARCHAR2(200),
  sta_app_number            VARCHAR2(200),
  sta_app_kind              VARCHAR2(200),
  sta_app_date              DATE,


  docdb_app_country         VARCHAR2(200),
  docdb_app_number          VARCHAR2(200),
  docdb_app_kind            VARCHAR2(200),
  docdb_app_date            DATE,

  epodc_app_number          VARCHAR2(200),

  ori_app_number            VARCHAR2(200),
  ori_app_country           VARCHAR2(200),
  ori_app_kind              VARCHAR2(200),
  ori_app_date              DATE,

  classificationipcrdetails CLOB,

  inventiontitle_en         VARCHAR2(3000),
  inventiontitle_zh         VARCHAR2(3000),

  abstract_en               CLOB,
  abstract_zh               CLOB,

  path_xml                  VARCHAR2(200),
  exist_xml                 VARCHAR2(1),

  import_session_id         NVARCHAR2(100),
  import_time               DATE,
  archive_inner_path        VARCHAR2(1000),
  file_path                 VARCHAR2(1000),
  session_index             NUMBER
)





alter table S_DOCDB
  add primary key (ID)
  using index 
  tablespace USERS
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




























drop table S_DOCDB;


truncate table S_DOCDB;


select t.*, t.rowid from S_DOCDB t;





select t.*, t.rowid from  S_T_BIOLOGICAL_CN   t  ;
select t.*, t.rowid from  S_T_BIOLOGICAL_INFO_CN  t  ;
select t.*, t.rowid from  S_T_BIOLOGICAL_PRIORITY_CN  t  ;

select t.*, t.rowid from  S_T_BIOLOGICAL_FY   t  ;
select t.*, t.rowid from  S_T_BIOLOGICAL_INFO_FY  t  ;
select t.*, t.rowid from  S_T_BIOLOGICAL_PRIORITY_FY  t  ;


truncate table S_T_BIOLOGICAL_CN       ;
truncate table S_T_BIOLOGICAL_INFO_CN      ;
truncate table S_T_BIOLOGICAL_PRIORITY_CN    ;
truncate table S_T_BIOLOGICAL_FY       ;
truncate table S_T_BIOLOGICAL_INFO_FY      ;
truncate table S_T_BIOLOGICAL_PRIORITY_FY    ;

select t.*, t.rowid from S_DATA_RESOURCE_TYPES_DETAIL t order by ID;

select t.file_path, t.archive_inner_path,to_char(substr(t.disclaimgr, 1, 2000)), t.* from S_MADRID_BRAND_PURCHASE t where DBMS_LOB.getlength(t.disclaimgr) <> 0;




  drop table S_T_BIOLOGICAL_CN;
  drop table S_T_BIOLOGICAL_INFO_CN;
  drop table S_T_BIOLOGICAL_PRIORITY_CN;
  alter table S_T_BIOLOGICAL_CN add id varchar2(100);
  alter table S_T_BIOLOGICAL_CN
  add constraint priBioCN primary key (ID);
 



alter table S_T_BIOLOGICAL_CN       add import_session_id NVARCHAR2(100);
alter table S_T_BIOLOGICAL_CN       add import_time DATE;
alter table S_T_BIOLOGICAL_CN       add archive_inner_path VARCHAR2(1000);
alter table S_T_BIOLOGICAL_CN       add file_path VARCHAR2(1000);
alter table S_T_BIOLOGICAL_CN       add session_index NUMBER;



alter table S_T_BIOLOGICAL_FY       add import_session_id NVARCHAR2(100);
alter table S_T_BIOLOGICAL_FY       add import_time DATE;
alter table S_T_BIOLOGICAL_FY       add archive_inner_path VARCHAR2(1000);
alter table S_T_BIOLOGICAL_FY       add file_path VARCHAR2(1000);
alter table S_T_BIOLOGICAL_FY       add session_index NUMBER;







  select t.*, t.rowid from s_data_resource_types_detail t where t.implemented_import_logic = 'Y' order by t.id asc;
  alter table S_T_BIOLOGICAL_CN add Bio_ID varchar2(100);
  
  
  
  
  
  CREATE TABLE S_T_BIOLOGICAL_CN 
   (
  ID varchar(100),
  PROJECT_NAME VARCHAR2(200 BYTE), 
  APPLICANT_NAME VARCHAR2(2000 BYTE), 
  TITLE_OF_INVENTION VARCHAR2(4000 BYTE), 
  APPLICATION_FILE_REFERENCE VARCHAR2(200 BYTE), 
  CURRENT_APPLICATION_NUMBER VARCHAR2(200 BYTE), 
  CURRENT_FILING_DATE VARCHAR2(200 BYTE), 
  SEQUENCE_FILE_NAME VARCHAR2(200 BYTE), 
  NUMBER_OF_SEQUENCES VARCHAR2(200 BYTE), 
  SOFTWARE VARCHAR2(200 BYTE), 
  PROJECT_PATH VARCHAR2(200 BYTE), 
  SEQUENCE_FILE_PATH VARCHAR2(200 BYTE), 
  BATCHID VARCHAR2(100 BYTE),
  import_session_id         NVARCHAR2(100),
  import_time               DATE,
  archive_inner_path        VARCHAR2(1000),
  file_path                 VARCHAR2(1000),
  session_index             NUMBER
   ) ;





  alter table S_T_BIOLOGICAL_INFO_CN
  add constraint priBioInfoCN primary key (ID);
  alter table S_T_BIOLOGICAL_INFO_CN add Bio_ID varchar2(100);






  CREATE TABLE S_T_BIOLOGICAL_INFO_CN
   (
  ID varchar(100),
  CURRENT_APPLICATION_NUMBER VARCHAR2(200 BYTE), 
  INFORMATION_FOR_SEQ_ID_NO VARCHAR2(200 BYTE), 
  LENGTH VARCHAR2(200 BYTE), 
  TYPE VARCHAR2(200 BYTE), 
  ORGANISM VARCHAR2(200 BYTE), 
  FEATURE VARCHAR2(200 BYTE), 
  NAME_KEY VARCHAR2(200 BYTE), 
  LOCATION VARCHAR2(200 BYTE), 
  OTHER_INFORMATION VARCHAR2(4000 BYTE), 
  SEQUENCE_DESCRIPTION CLOB, 
  BATCHID VARCHAR2(100 BYTE)
   ) ;


  alter table S_T_BIOLOGICAL_PRIORITY_CN
  add constraint priBioPriCN primary key (ID);
  alter table S_T_BIOLOGICAL_PRIORITY_CN add Bio_ID varchar2(100);



  CREATE TABLE S_T_BIOLOGICAL_PRIORITY_CN 
   (  
  ID varchar(100),
  CURRENT_APPLICATION_NUMBER VARCHAR2(200 BYTE), 
  PRIOR_APPLICATION_NUMBER VARCHAR2(200 BYTE), 
  PRIOR_APPLICATION_FILING_DATE VARCHAR2(200 BYTE), 
  BATCHID VARCHAR2(100 BYTE)
   ) ;

alter table S_T_BIOLOGICAL_INFO_FY drop column bio_id;


  alter table S_T_BIOLOGICAL_FY
  add constraint priBioFY primary key (ID);
  alter table S_T_BIOLOGICAL_FY add id varchar2(100);
  alter table S_T_BIOLOGICAL_FY add Bio_ID varchar2(100);
  CREATE TABLE S_T_BIOLOGICAL_FY 
   (
    ID varchar2(100),
    PROJECT_NAME VARCHAR2(200 BYTE), 
    APPLICANT_NAME VARCHAR2(2000 BYTE), 
    TITLE_OF_INVENTION VARCHAR2(4000 BYTE), 
    APPLICATION_FILE_REFERENCE VARCHAR2(200 BYTE), 
    CURRENT_APPLICATION_NUMBER VARCHAR2(200 BYTE), 
    CURRENT_FILING_DATE VARCHAR2(200 BYTE), 
    SEQUENCE_FILE_NAME VARCHAR2(200 BYTE), 
    NUMBER_OF_SEQUENCES VARCHAR2(200 BYTE), 
    SOFTWARE VARCHAR2(200 BYTE), 
    PROJECT_PATH VARCHAR2(200 BYTE), 
    SEQUENCE_FILE_PATH VARCHAR2(200 BYTE), 
    BATCHID VARCHAR2(100 BYTE),
    import_session_id         NVARCHAR2(100),
    import_time               DATE,
    archive_inner_path        VARCHAR2(1000),
    file_path                 VARCHAR2(1000),
    session_index             NUMBER
   ) ;


  alter table S_T_BIOLOGICAL_INFO_FY
  add constraint priBioInfoFY primary key (ID);
  alter table S_T_BIOLOGICAL_INFO_FY add Bio_ID varchar2(100);


  CREATE TABLE S_T_BIOLOGICAL_INFO_FY 
   (  
    ID varchar(100),   
    CURRENT_APPLICATION_NUMBER VARCHAR2(200 BYTE), 
    INFORMATION_FOR_SEQ_ID_NO VARCHAR2(200 BYTE), 
    LENGTH VARCHAR2(200 BYTE), 
    TYPE VARCHAR2(200 BYTE), 
    ORGANISM VARCHAR2(200 BYTE), 
    FEATURE VARCHAR2(200 BYTE), 
    NAME_KEY VARCHAR2(200 BYTE), 
    LOCATION VARCHAR2(200 BYTE), 
    OTHER_INFORMATION VARCHAR2(4000 BYTE), 
    SEQUENCE_DESCRIPTION CLOB, 
    BATCHID VARCHAR2(100 BYTE)
   ) ;


  alter table S_T_BIOLOGICAL_PRIORITY_FY
  add constraint priBioPriFY primary key (ID);
  alter table S_T_BIOLOGICAL_PRIORITY_FY add Bio_ID varchar2(100);



  alter table S_T_BIOLOGICAL_PRIORITY_FY add column Bio_ID varchar2(100);
  CREATE TABLE S_T_BIOLOGICAL_PRIORITY_FY 
   (  
    ID varchar(100),   
    CURRENT_APPLICATION_NUMBER VARCHAR2(200 BYTE), 
    PRIOR_APPLICATION_NUMBER VARCHAR2(200 BYTE), 
    PRIOR_APPLICATION_FILING_DATE VARCHAR2(200 BYTE), 
    BATCHID VARCHAR2(100 BYTE)
   ) ;



































select t.cn_decision_number, to_char(substr(t.cn_accessory, 1, 1000)),  t.* from S_CHINA_PATENT_REVIEW t where dbms_lob.getlength(t.cn_accessory) <> 0;

truncate table S_CHINA_PATENT_REVIEW;

select * from S_CHINA_BIOLOGICAL_PROCESS;

select * from S_CHINA_BOOK;

select * from S_DOCDB;
truncate table S_DOCDB;


select * from S_CHINA_PATENT_LAWSTATE_CHANGE t order by t.import_time desc;

select t.*, t.rowid from s_data_resource_types_detail t;




S_CHINA_PATENT_TEXTIMAGE

select * from S_CHINA_PATENT_TEXTIMAGE t;

select distinct t.file_path from S_CHINA_PATENT_TEXTIMAGE t where t.pub_date is null order by t.file_path;

select distinct t.pub_date from S_CHINA_PATENT_TEXTIMAGE t where t.file_path = 'W:\002-中国专利全文图像数据ok\FM\2016\20160706-002.zip';

truncate table S_CHINA_PATENT_TEXTIMAGE;



S_SINGAPORE_PATENT_DESCRIPTION


S_CHINA_PATENT_JUDGMENT
select * from S_CHINA_PATENT_JUDGMENT t where t.import_time is not null
select * from S_CHINA_PATENT_JUDGMENT t;


S_CHINA_PATENT_REVIEW
truncate table S_CHINA_PATENT_REVIEW;
select * from S_CHINA_PATENT_REVIEW t
select * from S_CHINA_PATENT_REVIEW t where t.application_country is not null;
select * from S_CHINA_PATENT_REVIEW t where DBMS_Lob.getlength(t.cn_accessory) = 0;


S_JOURNAL_PROJECT_ABSTRACT
truncate table S_JOURNAL_PROJECT_ABSTRACT;
select * from S_JOURNAL_PROJECT_ABSTRACT t;

ISSUE_6_1579543\IPPHDB_ISSUE_20160715_ISSUE_001.zip

S_MADRID_BRAND_PURCHASE

truncate table S_MADRID_BRAND_PURCHASE;

select * from S_MADRID_BRAND_PURCHASE t where DBMS_lob.getlength(t.colclagr) > 0;

select to_char(substr(t.colclagr, 1, 2000)), t.archive_inner_path, t.file_path from S_MADRID_BRAND_PURCHASE t where DBMS_lob.getlength(t.colclagr) > 0;


S_CHINA_COURTCASE_PROCESS
truncate table S_CHINA_COURTCASE_PROCESS;
select * from S_CHINA_COURTCASE_PROCESS t where DBMS_lob.getlength(t.c_Pt_Ns) > 0;


S_AMERICAN_BRAND_USCLASSIFY
truncate table S_AMERICAN_BRAND_USCLASSIFY;
select * from S_AMERICAN_BRAND_USCLASSIFY t;





S_MADRID_BRAND_ENTER_CHINA
truncate table S_MADRID_BRAND_ENTER_CHINA;
select * from S_MADRID_BRAND_ENTER_CHINA t where t.dateinfo_reg_date is not null;



S_AMERICA_TRANSFER_BRAND
truncate table S_AMERICA_TRANSFER_BRAND;
select * from S_AMERICA_TRANSFER_BRAND;

select * from s_data_resource_types_detail t where t.implemented_import_logic = 'Y';


select count(*) from s_data_resource_types_detail t where t.implemented_import_logic = 'Y';



truncate table S_STD_KR_PRS;
select * from S_STD_KR_PRS;
select to_char(substr(t.legalevent_details, 1, 3000)), t.* from S_STD_KR_PRS t where rownum < 10000;


select t.path_xml, count(*) from S_STD_KR_PRS t group by t.path_xml;
//S_AMERICA_APPLY_BRAND
truncate table S_AMERICA_APPLY_BRAND;
select to_char(substr(t.type_code_gs, 1, 4000)),to_char(substr((t.type_code_dm), 1, 4000)),  t.* from S_AMERICA_APPLY_BRAND t;




select f.id, f.Doclist_pno, f.doclist_pns, g.count from (select t.s_foreign_patent_seq_id, count(*) as count from S_BIOLOGICAL_SEQ t group by t.s_foreign_patent_seq_id) g left join s_Foreign_Patent_Sequence f on g.s_foreign_patent_seq_id = f.id

select count(*) from S_CHINA_BRAND_CLASSIFICATION t;

S_AMERICA_APPLY_BRAND 



select * from S_CHINA_BRAND_CLASSIFICATION t where dbms_lob.getlength(t.zhushi_en) >0;


truncate table S_CHINA_BRAND_CLASSIFICATION;


select t.id, t.chinese_name, t.table_name from s_data_resource_types_detail t;

/*3*/  select t.*, t.rowid from S_CHINA_PATENT_STANDARDFULLTXT t order by t.import_time desc; 

S_AMERICA_APPLY_BRAND

select * from S_AMERICA_APPLY_BRAND t  order by t.import_time desc;

truncate table S_AMERICA_APPLY_BRAND;

select * from s_China_Brand t where DBMS_lob.getlength(t.service_list) <> 0 order by t.import_time desc;

truncate table s_China_Brand;

select * from s_China_Brand t order by t.import_time desc;


select * from S_JOURNAL_PROJECT_ABSTRACT t order by t.import_time desc;

select * from S_MADRID_BRAND_PURCHASE t where DBMS_lob.getlength(t.sengrp) <> 0 order by t.import_time desc;

select * from S_MADRID_BRAND_PURCHASE t order by t.import_time desc;

truncate table S_JOURNAL_PROJECT_ABSTRACT;

truncate table S_AMERICA_TRANSFER_BRAND;

select * from S_China_CourtCase_Process t order by t.import_time desc;


alter table S_CHINA_COURTCASE_PROCESS modify c_legalnumber_superiors clob;

truncate table S_CHINA_COURTCASE_PROCESS;

update S_CHINA_COURTCASE_PROCESS t set t.c_legalnumber_superiors = null;

select * from S_China_CourtCase_Process t where DBMS_LOB.GETLENGTH(t.c_legalnumber_superiors) <> 0;

select t.c_legalnumber_superiors, t.* from S_China_CourtCase_Process t order by t.import_time desc;

/**186 S_FOREIGN_PATENT_SEQUENCE S_BIOLOGICAL_SEQ **/
select * from S_FOREIGN_PATENT_SEQUENCE   t where t.mark_cn_id = 'CN00000306523616';
select * from S_FOREIGN_PATENT_SEQUENCE t order by t.import_time desc;
select * from S_ISRAEL_PATENT_DESCRIPTION  t;
truncate table S_FOREIGN_PATENT_SEQUENCE;
truncate table S_BIOLOGICAL_SEQ;

select * from S_STD_KR_PRS;

select * from S_ISRAEL_PATENT_DESCRIPTION 

select * from s_china_brand t order by t.import_time desc;

truncate table s_china_brand;

CN00000306523616

/**133**/
select * from S_CHINA_BRAND_LICENSE   t where t.mark_cn_id = 'CN00000306523616';
select * from S_CHINA_BRAND_LICENSE t order by t.import_time desc;
select * from S_CHINA_LICENSE_PROCESSINFO t where t.mark_cn_id = 'CN00000012055106';
truncate table S_CHINA_BRAND_LICENSE;
truncate table S_CHINA_LICENSE_PROCESSINFO;
/**134 S_CHINA_BRAND_TRANSFER **/

select * from S_CHINA_BRAND_TRANSFER   t where t.mark_cn_id = 'CN00000306523616';
select * from S_CHINA_BRAND_TRANSFER t order by t.import_time desc;
select * from S_CHINA_BRAND_TRANS_INFO t where t.mark_cn_id = 'CN00000012055106';
select * from S_CHINA_BRAND_TRANS_INFO t where t.zhggrq is not null;
truncate table S_CHINA_BRAND_TRANSFER;
truncate table S_CHINA_BRAND_TRANS_INFO;


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
select * from import_session t order by t.start_time desc;
select * from s_Import_Bath t  order by t.start_time desc;

























select count(*) from s_data_resource_types_detail t where t.implemented_import_logic = 'Y'; 


/*186*/
select * from S_FOREIGN_PATENT_SEQUENCE t;

select * from import_session t where t.data_res_type='国外专利生物序列加工成品数据' order by t.start_time desc;

select * from s_Import_Bath t where t.res_type = '国外专利生物序列加工成品数据' order by t.start_time desc;



select distinct t.s_foreign_patent_seq_id from S_BIOLOGICAL_SEQ t;




delete from S_FOREIGN_PATENT_SEQUENCE t;
delete from  import_session t where t.data_res_type='国外专利生物序列加工成品数据';
delete from  s_Import_Bath t where t.res_type = '国外专利生物序列加工成品数据';
delete from S_BIOLOGICAL_SEQ t;

select t.id, count(*) as IdCount from S_BIOLOGICAL_SEQ t group by t.id having count(*) =2 ;





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




































































