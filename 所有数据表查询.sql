----1   中国专利全文代码化数据
select * from S_CHINA_PATENT_TEXTCODE doc;
----2   中国专利全文图像数据
select * from S_CHINA_PATENT_TEXTIMAGE doc;
----3   中国专利标准化全文文本数据
select * from S_CHINA_PATENT_STANDARDFULLTXT doc;
----4   中国专利标准化全文图像数据
select * from S_CHINA_PATENT_STAND_TEXTIMAGE doc;
----5   中国专利公报数据
select * from S_CHINA_PATENT_GAZETTE doc;
----6   中国专利著录项目与文摘数据
select * from S_CHINA_PATENT_BIBLIOGRAPHIC doc;
----10   中国专利法律状态数据
select * from S_CHINA_PATENT_LAWSTATE doc;
----11   中国专利法律状态变更翻译数据
select * from S_CHINA_PATENT_LAWSTATE_CHANGE doc;
----13   中国标准化简单引文数据
select * from S_CHINA_STANDARD_SIMPCITATION doc;
----14   专利缴费数据
select * from S_PATENT_PAYMENT doc;
----14.1   专利缴费数据DI
select * from S_PATENT_PAYMENT_DI doc;
----16   公司代码库
select * from S_COMPANY_CODE_LIBRARY doc;
----17   区域代码库
select * from S_ZONE_CODE_BASE doc;
----50   美国专利全文文本数据（标准化）
select * from S_AMERICAN_PATENT_FULLTEXT doc;
----51   欧专局专利全文文本数据（标准化）
select * from S_EUROPEAN_PATENT_FULLTEXT doc;
----52   韩国专利全文代码化数据（标准化）
select * from S_KOREAN_PATENT_FULLTEXTCODE doc;
----53   瑞士专利全文代码化数据（标准化）
select * from S_SWISS_PATENT_FULLTEXTCODE doc;
----54   英国专利全文代码化数据（标准化）
select * from S_BRITISH_PATENT_FULLTEXTCODE doc;
----55   日本专利全文代码化数据（标准化）
select * from S_JAPAN_PATENT_FULLTEXTCODE doc order by doc.import_time desc;
----76   中国专利生物序列数据（DI）
select * from S_CHINA_PATENT_BIOLOGICALSEQ doc;
----82   专利同族数据（DI）
select * from S_PATENT_FAMILY doc;
----83   全球专利引文数据（DI）
select * from S_GLOBAL_PATENT_CITATION doc;
----84   中国专利费用信息数据（DI）
select * from S_CHINA_PATENT_FEEINFORMATION doc;
----85   中国专利通知书数据（DI）
select * from S_CHINA_PATENT_NOTICES doc;
----86   中国法律状态标引库（DI）
select * from S_CHINA_LAWSTATE_INDEXINGLIB doc;
----88   世界法律状态数据
select * from S_WORLD_LEGAL_STATUS doc;
----90   DOCDB数据
select * from S_DOCDB doc;
----103   比利时专利全文数据（BE）（标准化）
select * from S_BELGIAN_PATENT_FULLTEXT doc;
----104   奥地利专利全文数据（AT）（标准化）
select * from S_AUSTRIA_PATENT_FULLTEXT doc;
----105   西班牙专利全文数据（ES）（标准化）
select * from S_SPANISH_PATENT_FULLTEXT doc;
----106   波兰专利著录项及全文数据（PL）（标准化）
select * from S_POLAND_PATENT_DESCRIPTION doc;
----107   以色列专利著录项及全文数据（IL）（标准化）
select * from S_ISRAEL_PATENT_DESCRIPTION doc;
----108   新加坡专利著录项及全文数据（SG）（标准化）
select * from S_SINGAPORE_PATENT_DESCRIPTION doc;
----113   美国外观设计专利数据（DI）
select * from S_AMERICAN_DESIGN_PATENT doc;
----115   韩国外观设计专利数据（DI）
select * from S_KOREA_DESIGN_PATENT doc;
----121   中国专利全文数据PDF（DI）
select * from S_CHINA_PATENT_FULLTEXT_PDF doc;
----122   国外专利全文数据PDF（DI）
select * from S_FOREIGN_PATENT_FULLTEXT_PDF doc;
----127   俄罗斯专利文摘英文翻译数据（DI）
select * from S_RUSSIAN_PATENT_ABSTRACTS doc;
----132   中国商标
select * from S_CHINA_BRAND doc;
----133   中国商标许可数据
select * from S_CHINA_BRAND_LICENSE doc;
----134   中国商标转让数据
select * from S_CHINA_BRAND_TRANSFER doc;
----136   马德里商标进入中国
select * from S_MADRID_BRAND_ENTER_CHINA doc;
----137   中国驰名商标数据
select * from S_CHINA_WELLKNOWN_BRAND doc;
----138   美国申请商标
select * from S_AMERICA_APPLY_BRAND doc;
----139   美国转让商标
select * from S_AMERICA_TRANSFER_BRAND doc;
----140   美国审判商标
select * from S_AMERICA_TRIAL_BRAND doc;
----147   社内外知识产权图书题录数据
select * from S_COMMUNITY_INTELLECTUALRECORD doc;
----148   民国书
select * from S_CHINA_BOOK doc;
----153   中外期刊的著录项目与文摘数据
select * from S_JOURNAL_PROJECT_ABSTRACT doc;
----162   中国法院判例初加工数据
select * from S_CHINA_COURTCASE_PROCESS doc;
----168   中国商标分类数据
select * from S_CHINA_BRAND_CLASSIFICATION doc;
----169   美国商标图形分类数据
select * from S_AMERICAN_BRAND_GRAPHCLASSIFY doc;
----170   美国商标美国分类数据
select * from S_AMERICAN_BRAND_USCLASSIFY doc;
----172   马德里商标购买数据
select * from S_MADRID_BRAND_PURCHASE doc;
----180   中国专利代理知识产权法律法规加工数据
select * from S_CHINA_PATENT_LAWSPROCESS doc;
----183   中国集成电路布图公告及事务数据
select * from S_CHINA_CIRCUITLAYOUT doc;
----184   中国知识产权海关备案数据
select * from S_CHINA_CUSTOMS_RECORD doc;
----186   国外专利生物序列加工成品数据
select * from S_FOREIGN_PATENT_SEQUENCE doc;
----194   中国专利复审数据
select * from S_CHINA_PATENT_REVIEW doc;
----195   中国专利无效数据
select * from S_CHINA_PATENT_INVALID doc;
----196   中国专利的判决书数据
select * from S_CHINA_PATENT_JUDGMENT doc;
----209   中国生物序列深加工数据-智能
select * from S_CHINA_BIOLOGICAL_PROCESS doc;
----209.1   中国生物序列深加工数据-中文
select * from S_T_BIOLOGICAL_CN doc;
----209.2   中国生物序列深加工数据-翻译
select * from S_T_BIOLOGICAL_FY doc;
----210   中国中药专利翻译数据
select * from S_T_MEDICINE_TRANS_T1 doc;
----211   中国化学药物专利深加工数据
select * from S_T_PHARMACEUTICAL_T1 doc;
----212   中国中药专利深加工数据
select * from S_T_MEDICINE_HANDLE_T1 doc;
----213   中国专利摘要英文翻译数据（标准化）
select * from S_CHINA_PATENT_ABSTRACTS doc;
----214   DOCDB数据（标准化）
select * from S_DOCDB doc;
----215   国际知识产权组织专利著录项及全文数据（WIPO)（标准化）
select * from S_WIPO_PATENT_DESCRIPTION doc;
----216   加拿大专利著录项及全文数据（CA）（标准化）
select * from S_CANADIAN_PATENT_DESCRIPTION doc;
----217   俄罗斯专利著录项及全文数据（RU）（标准化）
select * from S_RUSSIAN_PATENT_DESCRIPTION doc;
----218   澳大利亚专利全文文本数据（AU）（标准化）
select * from S_AUSTRALIAN_PATENT_FULLTEXT doc;
----219   德国专利著录项及全文数据（DE）（标准化）
select * from S_GERMAN_PATENT_DESCRIPTION doc;
----220   法国专利著录项及全文数据（FR）（标准化）
select * from S_FRENCH_PATENT_DESCRIPTION doc;
----221   台湾专利著录项及全文数据（TW）（标准化）
select * from S_TAIWAN_PATENT_DESCRIPTION doc;
----222   香港专利著录项数据（HK）（标准化）
select * from S_HONGKONG_PATENT_DESCRIPTION doc;
----223   澳门专利著录项数据（MO）（标准化）
select * from S_MACAO_PATENT_DESCRIPTION doc;
----224   欧亚组织专利著录项及全文数据（EA）（标准化）
select * from S_EURASIAN_PATENT_DESCRIPTION doc;
----225   日本外观设计专利数据（标准化）
select * from S_JAPAN_DESIGN_PATENT doc;
----226   德国外观设计专利数据（标准化）
select * from S_GERMAN_DESIGN_PATENT doc;
----227   法国外观设计专利数据（标准化）
select * from S_FRENCH_DESIGN_PATENT doc;
----228   俄罗斯外观设计专利数据（标准化）
select * from S_RUSSIAN_DESIGN_PATENT doc;
----229   日本专利文摘英文翻译数据（PAJ)（标准化）
select * from S_JAPAN_PATENT_ABSTRACTS doc;
----230   韩国专利文摘英文翻译数据(KPA)（标准化）
select * from S_KOREA_PATENT_ABSTRACTS doc;
----231   世界专利法律状态（INPADOC）（标准化）
select * from S_WORLD_PATENT_LAWSTATUS doc;
----232   日本引文(STD_JP_CIT)（标准化）
select * from S_STD_JP_CIT doc;
----233   韩国引文(STD_KR_CIT)（标准化）
select * from S_STD_KR_CIT doc;
----234   韩国法律状态数据(STD_KR_PRS)（标准化）
select * from S_STD_KR_PRS doc;
----240   中国专利法律状态（STD_CN_PRS）（标准化）
select * from S_STD_CN_PRS doc;
