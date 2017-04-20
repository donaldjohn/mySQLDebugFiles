alter table S_CHINA_PATENT_TEXTCODE        add 
import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_TEXTCODE        add import_time DATE;
alter table S_CHINA_PATENT_TEXTCODE        add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_TEXTCODE        add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_TEXTCODE        add session_index NUMBER;



alter table S_CHINA_PATENT_TEXTIMAGE       add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_TEXTIMAGE       add import_time DATE;
alter table S_CHINA_PATENT_TEXTIMAGE       add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_TEXTIMAGE       add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_TEXTIMAGE       add session_index NUMBER;



alter table S_CHINA_PATENT_STAND_TEXTIMAGE add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add import_time DATE;
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_STAND_TEXTIMAGE add session_index NUMBER;


alter table S_CHINA_PATENT_GAZETTE         add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_GAZETTE         add import_time DATE;
alter table S_CHINA_PATENT_GAZETTE         add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_GAZETTE         add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_GAZETTE         add session_index NUMBER;


alter table S_CHINA_PATENT_LAWSTATE        add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_LAWSTATE        add import_time DATE;
alter table S_CHINA_PATENT_LAWSTATE        add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_LAWSTATE        add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_LAWSTATE        add session_index NUMBER;


alter table S_CHINA_PATENT_LAWSTATE_CHANGE add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_LAWSTATE_CHANGE add import_time DATE;
alter table S_CHINA_PATENT_LAWSTATE_CHANGE add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_LAWSTATE_CHANGE add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_LAWSTATE_CHANGE add session_index NUMBER;
alter table S_PATENT_PAYMENT               add import_session_id NVARCHAR2(100);
alter table S_PATENT_PAYMENT               add import_time DATE;
alter table S_PATENT_PAYMENT               add archive_inner_path VARCHAR2(1000);
alter table S_PATENT_PAYMENT               add file_path VARCHAR2(1000);
alter table S_PATENT_PAYMENT               add session_index NUMBER;
alter table S_COMPANY_CODE_LIBRARY         add import_session_id NVARCHAR2(100);
alter table S_COMPANY_CODE_LIBRARY         add import_time DATE;
alter table S_COMPANY_CODE_LIBRARY         add archive_inner_path VARCHAR2(1000);
alter table S_COMPANY_CODE_LIBRARY         add file_path VARCHAR2(1000);
alter table S_COMPANY_CODE_LIBRARY         add session_index NUMBER;
alter table S_ZONE_CODE_BASE               add import_session_id NVARCHAR2(100);
alter table S_ZONE_CODE_BASE               add import_time DATE;
alter table S_ZONE_CODE_BASE               add archive_inner_path VARCHAR2(1000);
alter table S_ZONE_CODE_BASE               add file_path VARCHAR2(1000);
alter table S_ZONE_CODE_BASE               add session_index NUMBER;



alter table S_CHINA_PATENT_BIOLOGICALSEQ   add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_BIOLOGICALSEQ   add import_time DATE;
alter table S_CHINA_PATENT_BIOLOGICALSEQ   add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_BIOLOGICALSEQ   add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_BIOLOGICALSEQ   add session_index NUMBER;
alter table S_PATENT_FAMILY                add import_session_id NVARCHAR2(100);
alter table S_PATENT_FAMILY                add import_time DATE;
alter table S_PATENT_FAMILY                add archive_inner_path VARCHAR2(1000);
alter table S_PATENT_FAMILY                add file_path VARCHAR2(1000);
alter table S_PATENT_FAMILY                add session_index NUMBER;
alter table S_GLOBAL_PATENT_CITATION       add import_session_id NVARCHAR2(100);
alter table S_GLOBAL_PATENT_CITATION       add import_time DATE;
alter table S_GLOBAL_PATENT_CITATION       add archive_inner_path VARCHAR2(1000);
alter table S_GLOBAL_PATENT_CITATION       add file_path VARCHAR2(1000);
alter table S_GLOBAL_PATENT_CITATION       add session_index NUMBER;
alter table S_CHINA_PATENT_FEEINFORMATION  add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_FEEINFORMATION  add import_time DATE;
alter table S_CHINA_PATENT_FEEINFORMATION  add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_FEEINFORMATION  add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_FEEINFORMATION  add session_index NUMBER;
alter table S_CHINA_PATENT_NOTICES         add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_NOTICES         add import_time DATE;
alter table S_CHINA_PATENT_NOTICES         add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_NOTICES         add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_NOTICES         add session_index NUMBER;








alter table S_CHINA_LAWSTATE_INDEXINGLIB   add import_session_id NVARCHAR2(100);
alter table S_CHINA_LAWSTATE_INDEXINGLIB   add import_time DATE;
alter table S_CHINA_LAWSTATE_INDEXINGLIB   add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_LAWSTATE_INDEXINGLIB   add file_path VARCHAR2(1000);
alter table S_CHINA_LAWSTATE_INDEXINGLIB   add session_index NUMBER;
alter table S_WORLD_LEGAL_STATUS           add import_session_id NVARCHAR2(100);
alter table S_WORLD_LEGAL_STATUS           add import_time DATE;
alter table S_WORLD_LEGAL_STATUS           add archive_inner_path VARCHAR2(1000);
alter table S_WORLD_LEGAL_STATUS           add file_path VARCHAR2(1000);
alter table S_WORLD_LEGAL_STATUS           add session_index NUMBER;
alter table S_DOCDB                        add import_session_id NVARCHAR2(100);
alter table S_DOCDB                        add import_time DATE;
alter table S_DOCDB                        add archive_inner_path VARCHAR2(1000);
alter table S_DOCDB                        add file_path VARCHAR2(1000);
alter table S_DOCDB                        add session_index NUMBER;
alter table S_CHINA_PATENT_FULLTEXT_PDF    add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_FULLTEXT_PDF    add import_time DATE;
alter table S_CHINA_PATENT_FULLTEXT_PDF    add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_FULLTEXT_PDF    add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_FULLTEXT_PDF    add session_index NUMBER;
alter table S_FOREIGN_PATENT_FULLTEXT_PDF  add import_session_id NVARCHAR2(100);
alter table S_FOREIGN_PATENT_FULLTEXT_PDF  add import_time DATE;
alter table S_FOREIGN_PATENT_FULLTEXT_PDF  add archive_inner_path VARCHAR2(1000);
alter table S_FOREIGN_PATENT_FULLTEXT_PDF  add file_path VARCHAR2(1000);
alter table S_FOREIGN_PATENT_FULLTEXT_PDF  add session_index NUMBER;
alter table S_CHINA_BRAND                   add import_session_id NVARCHAR2(100);
alter table S_CHINA_BRAND                   add import_time DATE;
alter table S_CHINA_BRAND                   add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_BRAND                   add file_path VARCHAR2(1000);
alter table S_CHINA_BRAND                   add session_index NUMBER;
alter table S_CHINA_BRAND_LICENSE           add import_session_id NVARCHAR2(100);
alter table S_CHINA_BRAND_LICENSE           add import_time DATE;
alter table S_CHINA_BRAND_LICENSE           add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_BRAND_LICENSE           add file_path VARCHAR2(1000);
alter table S_CHINA_BRAND_LICENSE           add session_index NUMBER;



















alter table S_CHINA_BRAND_TRANSFER          add import_session_id NVARCHAR2(100);
alter table S_CHINA_BRAND_TRANSFER          add import_time DATE;
alter table S_CHINA_BRAND_TRANSFER          add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_BRAND_TRANSFER          add file_path VARCHAR2(1000);
alter table S_CHINA_BRAND_TRANSFER          add session_index NUMBER;
alter table S_MADRID_BRAND_ENTER_CHINA      add import_session_id NVARCHAR2(100);
alter table S_MADRID_BRAND_ENTER_CHINA      add import_time DATE;
alter table S_MADRID_BRAND_ENTER_CHINA      add archive_inner_path VARCHAR2(1000);
alter table S_MADRID_BRAND_ENTER_CHINA      add file_path VARCHAR2(1000);
alter table S_MADRID_BRAND_ENTER_CHINA      add session_index NUMBER;
alter table S_CHINA_WELLKNOWN_BRAND         add import_session_id NVARCHAR2(100);
alter table S_CHINA_WELLKNOWN_BRAND         add import_time DATE;
alter table S_CHINA_WELLKNOWN_BRAND         add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_WELLKNOWN_BRAND         add file_path VARCHAR2(1000);
alter table S_CHINA_WELLKNOWN_BRAND         add session_index NUMBER;
alter table S_AMERICA_APPLY_BRAND           add import_session_id NVARCHAR2(100);
alter table S_AMERICA_APPLY_BRAND           add import_time DATE;
alter table S_AMERICA_APPLY_BRAND           add archive_inner_path VARCHAR2(1000);
alter table S_AMERICA_APPLY_BRAND           add file_path VARCHAR2(1000);
alter table S_AMERICA_APPLY_BRAND           add session_index NUMBER;
alter table S_AMERICA_TRANSFER_BRAND        add import_session_id NVARCHAR2(100);
alter table S_AMERICA_TRANSFER_BRAND        add import_time DATE;
alter table S_AMERICA_TRANSFER_BRAND        add archive_inner_path VARCHAR2(1000);
alter table S_AMERICA_TRANSFER_BRAND        add file_path VARCHAR2(1000);
alter table S_AMERICA_TRANSFER_BRAND        add session_index NUMBER;
alter table S_AMERICA_TRIAL_BRAND           add import_session_id NVARCHAR2(100);
alter table S_AMERICA_TRIAL_BRAND           add import_time DATE;
alter table S_AMERICA_TRIAL_BRAND           add archive_inner_path VARCHAR2(1000);
alter table S_AMERICA_TRIAL_BRAND           add file_path VARCHAR2(1000);
alter table S_AMERICA_TRIAL_BRAND           add session_index NUMBER;
alter table S_COMMUNITY_INTELLECTUALRECORD  add import_session_id NVARCHAR2(100);
alter table S_COMMUNITY_INTELLECTUALRECORD  add import_time DATE;
alter table S_COMMUNITY_INTELLECTUALRECORD  add archive_inner_path VARCHAR2(1000);
alter table S_COMMUNITY_INTELLECTUALRECORD  add file_path VARCHAR2(1000);
alter table S_COMMUNITY_INTELLECTUALRECORD  add session_index NUMBER;










alter table S_CHINA_BOOK                    add import_session_id NVARCHAR2(100);
alter table S_CHINA_BOOK                    add import_time DATE;
alter table S_CHINA_BOOK                    add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_BOOK                    add file_path VARCHAR2(1000);
alter table S_CHINA_BOOK                    add session_index NUMBER;
alter table S_JOURNAL_PROJECT_ABSTRACT      add import_session_id NVARCHAR2(100);
alter table S_JOURNAL_PROJECT_ABSTRACT      add import_time DATE;
alter table S_JOURNAL_PROJECT_ABSTRACT      add archive_inner_path VARCHAR2(1000);
alter table S_JOURNAL_PROJECT_ABSTRACT      add file_path VARCHAR2(1000);
alter table S_JOURNAL_PROJECT_ABSTRACT      add session_index NUMBER;
alter table S_CHINA_COURTCASE_PROCESS       add import_session_id NVARCHAR2(100);
alter table S_CHINA_COURTCASE_PROCESS       add import_time DATE;
alter table S_CHINA_COURTCASE_PROCESS       add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_COURTCASE_PROCESS       add file_path VARCHAR2(1000);
alter table S_CHINA_COURTCASE_PROCESS       add session_index NUMBER;
alter table S_CHINA_BRAND_CLASSIFICATION    add import_session_id NVARCHAR2(100);
alter table S_CHINA_BRAND_CLASSIFICATION    add import_time DATE;
alter table S_CHINA_BRAND_CLASSIFICATION    add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_BRAND_CLASSIFICATION    add file_path VARCHAR2(1000);
alter table S_CHINA_BRAND_CLASSIFICATION    add session_index NUMBER;
alter table S_AMERICAN_BRAND_GRAPHCLASSIFY  add import_session_id NVARCHAR2(100);
alter table S_AMERICAN_BRAND_GRAPHCLASSIFY  add import_time DATE;
alter table S_AMERICAN_BRAND_GRAPHCLASSIFY  add archive_inner_path VARCHAR2(1000);
alter table S_AMERICAN_BRAND_GRAPHCLASSIFY  add file_path VARCHAR2(1000);
alter table S_AMERICAN_BRAND_GRAPHCLASSIFY  add session_index NUMBER;
alter table S_AMERICAN_BRAND_USCLASSIFY     add import_session_id NVARCHAR2(100);
alter table S_AMERICAN_BRAND_USCLASSIFY     add import_time DATE;
alter table S_AMERICAN_BRAND_USCLASSIFY     add archive_inner_path VARCHAR2(1000);
alter table S_AMERICAN_BRAND_USCLASSIFY     add file_path VARCHAR2(1000);
alter table S_AMERICAN_BRAND_USCLASSIFY     add session_index NUMBER;
alter table S_MADRID_BRAND_PURCHASE         add import_session_id NVARCHAR2(100);
alter table S_MADRID_BRAND_PURCHASE         add import_time DATE;
alter table S_MADRID_BRAND_PURCHASE         add archive_inner_path VARCHAR2(1000);
alter table S_MADRID_BRAND_PURCHASE         add file_path VARCHAR2(1000);
alter table S_MADRID_BRAND_PURCHASE         add session_index NUMBER;
alter table S_CHINA_PATENT_LAWSPROCESS      add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_LAWSPROCESS      add import_time DATE;
alter table S_CHINA_PATENT_LAWSPROCESS      add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_LAWSPROCESS      add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_LAWSPROCESS      add session_index NUMBER;
alter table S_CHINA_CIRCUITLAYOUT           add import_session_id NVARCHAR2(100);
alter table S_CHINA_CIRCUITLAYOUT           add import_time DATE;
alter table S_CHINA_CIRCUITLAYOUT           add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_CIRCUITLAYOUT           add file_path VARCHAR2(1000);
alter table S_CHINA_CIRCUITLAYOUT           add session_index NUMBER;







alter table S_CHINA_CUSTOMS_RECORD         add import_session_id NVARCHAR2(100);
alter table S_CHINA_CUSTOMS_RECORD         add import_time DATE;
alter table S_CHINA_CUSTOMS_RECORD         add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_CUSTOMS_RECORD         add file_path VARCHAR2(1000);
alter table S_CHINA_CUSTOMS_RECORD         add session_index NUMBER;
alter table S_FOREIGN_PATENT_SEQUENCE      add import_session_id NVARCHAR2(100);
alter table S_FOREIGN_PATENT_SEQUENCE      add import_time DATE;
alter table S_FOREIGN_PATENT_SEQUENCE      add archive_inner_path VARCHAR2(1000);
alter table S_FOREIGN_PATENT_SEQUENCE      add file_path VARCHAR2(1000);
alter table S_FOREIGN_PATENT_SEQUENCE      add session_index NUMBER;
alter table S_CHINA_PATENT_REVIEW          add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_REVIEW          add import_time DATE;
alter table S_CHINA_PATENT_REVIEW          add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_REVIEW          add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_REVIEW          add session_index NUMBER;
alter table S_CHINA_PATENT_INVALID         add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_INVALID         add import_time DATE;
alter table S_CHINA_PATENT_INVALID         add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_INVALID         add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_INVALID         add session_index NUMBER;
alter table S_CHINA_PATENT_JUDGMENT        add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_JUDGMENT        add import_time DATE;
alter table S_CHINA_PATENT_JUDGMENT        add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_JUDGMENT        add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_JUDGMENT        add session_index NUMBER;
alter table S_CHINA_BIOLOGICAL_PROCESS     add import_session_id NVARCHAR2(100);
alter table S_CHINA_BIOLOGICAL_PROCESS     add import_time DATE;
alter table S_CHINA_BIOLOGICAL_PROCESS     add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_BIOLOGICAL_PROCESS     add file_path VARCHAR2(1000);
alter table S_CHINA_BIOLOGICAL_PROCESS     add session_index NUMBER;





alter table S_CHINA_MEDICINE_PATENT_TRANS  add import_session_id NVARCHAR2(100);
alter table S_CHINA_MEDICINE_PATENT_TRANS  add import_time DATE;
alter table S_CHINA_MEDICINE_PATENT_TRANS  add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_MEDICINE_PATENT_TRANS  add file_path VARCHAR2(1000);
alter table S_CHINA_MEDICINE_PATENT_TRANS  add session_index NUMBER;
alter table S_CHINA_PHARMACEUTICAL_PATENT  add import_session_id NVARCHAR2(100);
alter table S_CHINA_PHARMACEUTICAL_PATENT  add import_time DATE;
alter table S_CHINA_PHARMACEUTICAL_PATENT  add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PHARMACEUTICAL_PATENT  add file_path VARCHAR2(1000);
alter table S_CHINA_PHARMACEUTICAL_PATENT  add session_index NUMBER;
alter table S_CHINA_MEDICINE_PATENT_HANDLE add import_session_id NVARCHAR2(100);
alter table S_CHINA_MEDICINE_PATENT_HANDLE add import_time DATE;
alter table S_CHINA_MEDICINE_PATENT_HANDLE add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_MEDICINE_PATENT_HANDLE add file_path VARCHAR2(1000);
alter table S_CHINA_MEDICINE_PATENT_HANDLE add session_index NUMBER;
alter table S_CHINA_PATENT_STANDARDFULLTXT add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_STANDARDFULLTXT add import_time DATE;
alter table S_CHINA_PATENT_STANDARDFULLTXT add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_STANDARDFULLTXT add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_STANDARDFULLTXT add session_index NUMBER;
alter table S_CHINA_PATENT_BIBLIOGRAPHIC   add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_BIBLIOGRAPHIC   add import_time DATE;
alter table S_CHINA_PATENT_BIBLIOGRAPHIC   add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_BIBLIOGRAPHIC   add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_BIBLIOGRAPHIC   add session_index NUMBER;
alter table S_CHINA_STANDARD_SIMPCITATION  add import_session_id NVARCHAR2(100);
alter table S_CHINA_STANDARD_SIMPCITATION  add import_time DATE;
alter table S_CHINA_STANDARD_SIMPCITATION  add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_STANDARD_SIMPCITATION  add file_path VARCHAR2(1000);
alter table S_CHINA_STANDARD_SIMPCITATION  add session_index NUMBER;
alter table S_AMERICAN_PATENT_FULLTEXT     add import_session_id NVARCHAR2(100);
alter table S_AMERICAN_PATENT_FULLTEXT     add import_time DATE;
alter table S_AMERICAN_PATENT_FULLTEXT     add archive_inner_path VARCHAR2(1000);
alter table S_AMERICAN_PATENT_FULLTEXT     add file_path VARCHAR2(1000);
alter table S_AMERICAN_PATENT_FULLTEXT     add session_index NUMBER;
alter table S_EUROPEAN_PATENT_FULLTEXT     add import_session_id NVARCHAR2(100);
alter table S_EUROPEAN_PATENT_FULLTEXT     add import_time DATE;
alter table S_EUROPEAN_PATENT_FULLTEXT     add archive_inner_path VARCHAR2(1000);
alter table S_EUROPEAN_PATENT_FULLTEXT     add file_path VARCHAR2(1000);
alter table S_EUROPEAN_PATENT_FULLTEXT     add session_index NUMBER;















alter table S_KOREAN_PATENT_FULLTEXTCODE   add import_session_id NVARCHAR2(100);
alter table S_KOREAN_PATENT_FULLTEXTCODE   add import_time DATE;
alter table S_KOREAN_PATENT_FULLTEXTCODE   add archive_inner_path VARCHAR2(1000);
alter table S_KOREAN_PATENT_FULLTEXTCODE   add file_path VARCHAR2(1000);
alter table S_KOREAN_PATENT_FULLTEXTCODE   add session_index NUMBER;
alter table S_SWISS_PATENT_FULLTEXTCODE    add import_session_id NVARCHAR2(100);
alter table S_SWISS_PATENT_FULLTEXTCODE    add import_time DATE;
alter table S_SWISS_PATENT_FULLTEXTCODE    add archive_inner_path VARCHAR2(1000);
alter table S_SWISS_PATENT_FULLTEXTCODE    add file_path VARCHAR2(1000);
alter table S_SWISS_PATENT_FULLTEXTCODE    add session_index NUMBER;
alter table S_BRITISH_PATENT_FULLTEXTCODE  add import_session_id NVARCHAR2(100);
alter table S_BRITISH_PATENT_FULLTEXTCODE  add import_time DATE;
alter table S_BRITISH_PATENT_FULLTEXTCODE  add archive_inner_path VARCHAR2(1000);
alter table S_BRITISH_PATENT_FULLTEXTCODE  add file_path VARCHAR2(1000);
alter table S_BRITISH_PATENT_FULLTEXTCODE  add session_index NUMBER;
alter table S_JAPAN_PATENT_FULLTEXTCODE    add import_session_id NVARCHAR2(100);
alter table S_JAPAN_PATENT_FULLTEXTCODE    add import_time DATE;
alter table S_JAPAN_PATENT_FULLTEXTCODE    add archive_inner_path VARCHAR2(1000);
alter table S_JAPAN_PATENT_FULLTEXTCODE    add file_path VARCHAR2(1000);
alter table S_JAPAN_PATENT_FULLTEXTCODE    add session_index NUMBER;






alter table S_BELGIAN_PATENT_FULLTEXT      add import_session_id NVARCHAR2(100);
alter table S_BELGIAN_PATENT_FULLTEXT      add import_time DATE;
alter table S_BELGIAN_PATENT_FULLTEXT      add archive_inner_path VARCHAR2(1000);
alter table S_BELGIAN_PATENT_FULLTEXT      add file_path VARCHAR2(1000);
alter table S_BELGIAN_PATENT_FULLTEXT      add session_index NUMBER;
alter table S_AUSTRIA_PATENT_FULLTEXT      add import_session_id NVARCHAR2(100);
alter table S_AUSTRIA_PATENT_FULLTEXT      add import_time DATE;
alter table S_AUSTRIA_PATENT_FULLTEXT      add archive_inner_path VARCHAR2(1000);
alter table S_AUSTRIA_PATENT_FULLTEXT      add file_path VARCHAR2(1000);
alter table S_AUSTRIA_PATENT_FULLTEXT      add session_index NUMBER;
alter table S_SPANISH_PATENT_FULLTEXT      add import_session_id NVARCHAR2(100);
alter table S_SPANISH_PATENT_FULLTEXT      add import_time DATE;
alter table S_SPANISH_PATENT_FULLTEXT      add archive_inner_path VARCHAR2(1000);
alter table S_SPANISH_PATENT_FULLTEXT      add file_path VARCHAR2(1000);
alter table S_SPANISH_PATENT_FULLTEXT      add session_index NUMBER;
alter table S_POLAND_PATENT_DESCRIPTION    add import_session_id NVARCHAR2(100);
alter table S_POLAND_PATENT_DESCRIPTION    add import_time DATE;
alter table S_POLAND_PATENT_DESCRIPTION    add archive_inner_path VARCHAR2(1000);
alter table S_POLAND_PATENT_DESCRIPTION    add file_path VARCHAR2(1000);
alter table S_POLAND_PATENT_DESCRIPTION    add session_index NUMBER;
alter table S_ISRAEL_PATENT_DESCRIPTION    add import_session_id NVARCHAR2(100);
alter table S_ISRAEL_PATENT_DESCRIPTION    add import_time DATE;
alter table S_ISRAEL_PATENT_DESCRIPTION    add archive_inner_path VARCHAR2(1000);
alter table S_ISRAEL_PATENT_DESCRIPTION    add file_path VARCHAR2(1000);
alter table S_ISRAEL_PATENT_DESCRIPTION    add session_index NUMBER;





alter table S_SINGAPORE_PATENT_DESCRIPTION add import_session_id NVARCHAR2(100);
alter table S_SINGAPORE_PATENT_DESCRIPTION add import_time DATE;
alter table S_SINGAPORE_PATENT_DESCRIPTION add archive_inner_path VARCHAR2(1000);
alter table S_SINGAPORE_PATENT_DESCRIPTION add file_path VARCHAR2(1000);
alter table S_SINGAPORE_PATENT_DESCRIPTION add session_index NUMBER;
alter table S_AMERICAN_DESIGN_PATENT       add import_session_id NVARCHAR2(100);
alter table S_AMERICAN_DESIGN_PATENT       add import_time DATE;
alter table S_AMERICAN_DESIGN_PATENT       add archive_inner_path VARCHAR2(1000);
alter table S_AMERICAN_DESIGN_PATENT       add file_path VARCHAR2(1000);
alter table S_AMERICAN_DESIGN_PATENT       add session_index NUMBER;
alter table S_KOREA_DESIGN_PATENT          add import_session_id NVARCHAR2(100);
alter table S_KOREA_DESIGN_PATENT          add import_time DATE;
alter table S_KOREA_DESIGN_PATENT          add archive_inner_path VARCHAR2(1000);
alter table S_KOREA_DESIGN_PATENT          add file_path VARCHAR2(1000);
alter table S_KOREA_DESIGN_PATENT          add session_index NUMBER;
alter table S_RUSSIAN_PATENT_ABSTRACTS     add import_session_id NVARCHAR2(100);
alter table S_RUSSIAN_PATENT_ABSTRACTS     add import_time DATE;
alter table S_RUSSIAN_PATENT_ABSTRACTS     add archive_inner_path VARCHAR2(1000);
alter table S_RUSSIAN_PATENT_ABSTRACTS     add file_path VARCHAR2(1000);
alter table S_RUSSIAN_PATENT_ABSTRACTS     add session_index NUMBER;
alter table S_CHINA_PATENT_ABSTRACTS       add import_session_id NVARCHAR2(100);
alter table S_CHINA_PATENT_ABSTRACTS       add import_time DATE;
alter table S_CHINA_PATENT_ABSTRACTS       add archive_inner_path VARCHAR2(1000);
alter table S_CHINA_PATENT_ABSTRACTS       add file_path VARCHAR2(1000);
alter table S_CHINA_PATENT_ABSTRACTS       add session_index NUMBER;
alter table S_WIPO_PATENT_DESCRIPTION      add import_session_id NVARCHAR2(100);
alter table S_WIPO_PATENT_DESCRIPTION      add import_time DATE;
alter table S_WIPO_PATENT_DESCRIPTION      add archive_inner_path VARCHAR2(1000);
alter table S_WIPO_PATENT_DESCRIPTION      add file_path VARCHAR2(1000);
alter table S_WIPO_PATENT_DESCRIPTION      add session_index NUMBER;





alter table S_CANADIAN_PATENT_DESCRIPTION  add import_session_id NVARCHAR2(100);
alter table S_CANADIAN_PATENT_DESCRIPTION  add import_time DATE;
alter table S_CANADIAN_PATENT_DESCRIPTION  add archive_inner_path VARCHAR2(1000);
alter table S_CANADIAN_PATENT_DESCRIPTION  add file_path VARCHAR2(1000);
alter table S_CANADIAN_PATENT_DESCRIPTION  add session_index NUMBER;
alter table S_RUSSIAN_PATENT_DESCRIPTION   add import_session_id NVARCHAR2(100);
alter table S_RUSSIAN_PATENT_DESCRIPTION   add import_time DATE;
alter table S_RUSSIAN_PATENT_DESCRIPTION   add archive_inner_path VARCHAR2(1000);
alter table S_RUSSIAN_PATENT_DESCRIPTION   add file_path VARCHAR2(1000);
alter table S_RUSSIAN_PATENT_DESCRIPTION   add session_index NUMBER;
alter table S_AUSTRALIAN_PATENT_FULLTEXT   add import_session_id NVARCHAR2(100);
alter table S_AUSTRALIAN_PATENT_FULLTEXT   add import_time DATE;
alter table S_AUSTRALIAN_PATENT_FULLTEXT   add archive_inner_path VARCHAR2(1000);
alter table S_AUSTRALIAN_PATENT_FULLTEXT   add file_path VARCHAR2(1000);
alter table S_AUSTRALIAN_PATENT_FULLTEXT   add session_index NUMBER;
alter table S_GERMAN_PATENT_DESCRIPTION    add import_session_id NVARCHAR2(100);
alter table S_GERMAN_PATENT_DESCRIPTION    add import_time DATE;
alter table S_GERMAN_PATENT_DESCRIPTION    add archive_inner_path VARCHAR2(1000);
alter table S_GERMAN_PATENT_DESCRIPTION    add file_path VARCHAR2(1000);
alter table S_GERMAN_PATENT_DESCRIPTION    add session_index NUMBER;
alter table S_FRENCH_PATENT_DESCRIPTION    add import_session_id NVARCHAR2(100);
alter table S_FRENCH_PATENT_DESCRIPTION    add import_time DATE;
alter table S_FRENCH_PATENT_DESCRIPTION    add archive_inner_path VARCHAR2(1000);
alter table S_FRENCH_PATENT_DESCRIPTION    add file_path VARCHAR2(1000);
alter table S_FRENCH_PATENT_DESCRIPTION    add session_index NUMBER;
alter table S_TAIWAN_PATENT_DESCRIPTION    add import_session_id NVARCHAR2(100);
alter table S_TAIWAN_PATENT_DESCRIPTION    add import_time DATE;
alter table S_TAIWAN_PATENT_DESCRIPTION    add archive_inner_path VARCHAR2(1000);
alter table S_TAIWAN_PATENT_DESCRIPTION    add file_path VARCHAR2(1000);
alter table S_TAIWAN_PATENT_DESCRIPTION    add session_index NUMBER;
alter table S_HONGKONG_PATENT_DESCRIPTION  add import_session_id NVARCHAR2(100);
alter table S_HONGKONG_PATENT_DESCRIPTION  add import_time DATE;
alter table S_HONGKONG_PATENT_DESCRIPTION  add archive_inner_path VARCHAR2(1000);
alter table S_HONGKONG_PATENT_DESCRIPTION  add file_path VARCHAR2(1000);
alter table S_HONGKONG_PATENT_DESCRIPTION  add session_index NUMBER;
alter table S_MACAO_PATENT_DESCRIPTION     add import_session_id NVARCHAR2(100);
alter table S_MACAO_PATENT_DESCRIPTION     add import_time DATE;
alter table S_MACAO_PATENT_DESCRIPTION     add archive_inner_path VARCHAR2(1000);
alter table S_MACAO_PATENT_DESCRIPTION     add file_path VARCHAR2(1000);
alter table S_MACAO_PATENT_DESCRIPTION     add session_index NUMBER;
alter table S_EURASIAN_PATENT_DESCRIPTION  add import_session_id NVARCHAR2(100);
alter table S_EURASIAN_PATENT_DESCRIPTION  add import_time DATE;
alter table S_EURASIAN_PATENT_DESCRIPTION  add archive_inner_path VARCHAR2(1000);
alter table S_EURASIAN_PATENT_DESCRIPTION  add file_path VARCHAR2(1000);
alter table S_EURASIAN_PATENT_DESCRIPTION  add session_index NUMBER;
alter table S_JAPAN_DESIGN_PATENT          add import_session_id NVARCHAR2(100);
alter table S_JAPAN_DESIGN_PATENT          add import_time DATE;
alter table S_JAPAN_DESIGN_PATENT          add archive_inner_path VARCHAR2(1000);
alter table S_JAPAN_DESIGN_PATENT          add file_path VARCHAR2(1000);
alter table S_JAPAN_DESIGN_PATENT          add session_index NUMBER;
alter table S_GERMAN_DESIGN_PATENT         add import_session_id NVARCHAR2(100);
alter table S_GERMAN_DESIGN_PATENT         add import_time DATE;
alter table S_GERMAN_DESIGN_PATENT         add archive_inner_path VARCHAR2(1000);
alter table S_GERMAN_DESIGN_PATENT         add file_path VARCHAR2(1000);
alter table S_GERMAN_DESIGN_PATENT         add session_index NUMBER;
alter table S_FRENCH_DESIGN_PATENT         add import_session_id NVARCHAR2(100);
alter table S_FRENCH_DESIGN_PATENT         add import_time DATE;
alter table S_FRENCH_DESIGN_PATENT         add archive_inner_path VARCHAR2(1000);
alter table S_FRENCH_DESIGN_PATENT         add file_path VARCHAR2(1000);
alter table S_FRENCH_DESIGN_PATENT         add session_index NUMBER;
alter table S_RUSSIAN_DESIGN_PATENT        add import_session_id NVARCHAR2(100);
alter table S_RUSSIAN_DESIGN_PATENT        add import_time DATE;
alter table S_RUSSIAN_DESIGN_PATENT        add archive_inner_path VARCHAR2(1000);
alter table S_RUSSIAN_DESIGN_PATENT        add file_path VARCHAR2(1000);
alter table S_RUSSIAN_DESIGN_PATENT        add session_index NUMBER;
alter table S_JAPAN_PATENT_ABSTRACTS       add import_session_id NVARCHAR2(100);
alter table S_JAPAN_PATENT_ABSTRACTS       add import_time DATE;
alter table S_JAPAN_PATENT_ABSTRACTS       add archive_inner_path VARCHAR2(1000);
alter table S_JAPAN_PATENT_ABSTRACTS       add file_path VARCHAR2(1000);
alter table S_JAPAN_PATENT_ABSTRACTS       add session_index NUMBER;
alter table S_KOREA_PATENT_ABSTRACTS       add import_session_id NVARCHAR2(100);
alter table S_KOREA_PATENT_ABSTRACTS       add import_time DATE;
alter table S_KOREA_PATENT_ABSTRACTS       add archive_inner_path VARCHAR2(1000);
alter table S_KOREA_PATENT_ABSTRACTS       add file_path VARCHAR2(1000);
alter table S_KOREA_PATENT_ABSTRACTS       add session_index NUMBER;









































