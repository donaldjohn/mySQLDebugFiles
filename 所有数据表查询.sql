----1   �й�ר��ȫ�Ĵ��뻯����
select * from S_CHINA_PATENT_TEXTCODE doc;
----2   �й�ר��ȫ��ͼ������
select * from S_CHINA_PATENT_TEXTIMAGE doc;
----3   �й�ר����׼��ȫ���ı�����
select * from S_CHINA_PATENT_STANDARDFULLTXT doc;
----4   �й�ר����׼��ȫ��ͼ������
select * from S_CHINA_PATENT_STAND_TEXTIMAGE doc;
----5   �й�ר����������
select * from S_CHINA_PATENT_GAZETTE doc;
----6   �й�ר����¼��Ŀ����ժ����
select * from S_CHINA_PATENT_BIBLIOGRAPHIC doc;
----10   �й�ר������״̬����
select * from S_CHINA_PATENT_LAWSTATE doc;
----11   �й�ר������״̬�����������
select * from S_CHINA_PATENT_LAWSTATE_CHANGE doc;
----13   �й���׼������������
select * from S_CHINA_STANDARD_SIMPCITATION doc;
----14   ר���ɷ�����
select * from S_PATENT_PAYMENT doc;
----14.1   ר���ɷ�����DI
select * from S_PATENT_PAYMENT_DI doc;
----16   ��˾�����
select * from S_COMPANY_CODE_LIBRARY doc;
----17   ��������
select * from S_ZONE_CODE_BASE doc;
----50   ����ר��ȫ���ı����ݣ���׼����
select * from S_AMERICAN_PATENT_FULLTEXT doc;
----51   ŷר��ר��ȫ���ı����ݣ���׼����
select * from S_EUROPEAN_PATENT_FULLTEXT doc;
----52   ����ר��ȫ�Ĵ��뻯���ݣ���׼����
select * from S_KOREAN_PATENT_FULLTEXTCODE doc;
----53   ��ʿר��ȫ�Ĵ��뻯���ݣ���׼����
select * from S_SWISS_PATENT_FULLTEXTCODE doc;
----54   Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼����
select * from S_BRITISH_PATENT_FULLTEXTCODE doc;
----55   �ձ�ר��ȫ�Ĵ��뻯���ݣ���׼����
select * from S_JAPAN_PATENT_FULLTEXTCODE doc order by doc.import_time desc;
----76   �й�ר�������������ݣ�DI��
select * from S_CHINA_PATENT_BIOLOGICALSEQ doc;
----82   ר��ͬ�����ݣ�DI��
select * from S_PATENT_FAMILY doc;
----83   ȫ��ר���������ݣ�DI��
select * from S_GLOBAL_PATENT_CITATION doc;
----84   �й�ר��������Ϣ���ݣ�DI��
select * from S_CHINA_PATENT_FEEINFORMATION doc;
----85   �й�ר��֪ͨ�����ݣ�DI��
select * from S_CHINA_PATENT_NOTICES doc;
----86   �й�����״̬�����⣨DI��
select * from S_CHINA_LAWSTATE_INDEXINGLIB doc;
----88   ���編��״̬����
select * from S_WORLD_LEGAL_STATUS doc;
----90   DOCDB����
select * from S_DOCDB doc;
----103   ����ʱר��ȫ�����ݣ�BE������׼����
select * from S_BELGIAN_PATENT_FULLTEXT doc;
----104   �µ���ר��ȫ�����ݣ�AT������׼����
select * from S_AUSTRIA_PATENT_FULLTEXT doc;
----105   ������ר��ȫ�����ݣ�ES������׼����
select * from S_SPANISH_PATENT_FULLTEXT doc;
----106   ����ר����¼�ȫ�����ݣ�PL������׼����
select * from S_POLAND_PATENT_DESCRIPTION doc;
----107   ��ɫ��ר����¼�ȫ�����ݣ�IL������׼����
select * from S_ISRAEL_PATENT_DESCRIPTION doc;
----108   �¼���ר����¼�ȫ�����ݣ�SG������׼����
select * from S_SINGAPORE_PATENT_DESCRIPTION doc;
----113   ����������ר�����ݣ�DI��
select * from S_AMERICAN_DESIGN_PATENT doc;
----115   ����������ר�����ݣ�DI��
select * from S_KOREA_DESIGN_PATENT doc;
----121   �й�ר��ȫ������PDF��DI��
select * from S_CHINA_PATENT_FULLTEXT_PDF doc;
----122   ����ר��ȫ������PDF��DI��
select * from S_FOREIGN_PATENT_FULLTEXT_PDF doc;
----127   ����˹ר����ժӢ�ķ������ݣ�DI��
select * from S_RUSSIAN_PATENT_ABSTRACTS doc;
----132   �й��̱�
select * from S_CHINA_BRAND doc;
----133   �й��̱��������
select * from S_CHINA_BRAND_LICENSE doc;
----134   �й��̱�ת������
select * from S_CHINA_BRAND_TRANSFER doc;
----136   ������̱�����й�
select * from S_MADRID_BRAND_ENTER_CHINA doc;
----137   �й������̱�����
select * from S_CHINA_WELLKNOWN_BRAND doc;
----138   ���������̱�
select * from S_AMERICA_APPLY_BRAND doc;
----139   ����ת���̱�
select * from S_AMERICA_TRANSFER_BRAND doc;
----140   ���������̱�
select * from S_AMERICA_TRIAL_BRAND doc;
----147   ������֪ʶ��Ȩͼ����¼����
select * from S_COMMUNITY_INTELLECTUALRECORD doc;
----148   �����
select * from S_CHINA_BOOK doc;
----153   �����ڿ�����¼��Ŀ����ժ����
select * from S_JOURNAL_PROJECT_ABSTRACT doc;
----162   �й���Ժ�������ӹ�����
select * from S_CHINA_COURTCASE_PROCESS doc;
----168   �й��̱��������
select * from S_CHINA_BRAND_CLASSIFICATION doc;
----169   �����̱�ͼ�η�������
select * from S_AMERICAN_BRAND_GRAPHCLASSIFY doc;
----170   �����̱�������������
select * from S_AMERICAN_BRAND_USCLASSIFY doc;
----172   ������̱깺������
select * from S_MADRID_BRAND_PURCHASE doc;
----180   �й�ר������֪ʶ��Ȩ���ɷ���ӹ�����
select * from S_CHINA_PATENT_LAWSPROCESS doc;
----183   �й����ɵ�·��ͼ���漰��������
select * from S_CHINA_CIRCUITLAYOUT doc;
----184   �й�֪ʶ��Ȩ���ر�������
select * from S_CHINA_CUSTOMS_RECORD doc;
----186   ����ר���������мӹ���Ʒ����
select * from S_FOREIGN_PATENT_SEQUENCE doc;
----194   �й�ר����������
select * from S_CHINA_PATENT_REVIEW doc;
----195   �й�ר����Ч����
select * from S_CHINA_PATENT_INVALID doc;
----196   �й�ר�����о�������
select * from S_CHINA_PATENT_JUDGMENT doc;
----209   �й�����������ӹ�����-����
select * from S_CHINA_BIOLOGICAL_PROCESS doc;
----209.1   �й�����������ӹ�����-����
select * from S_T_BIOLOGICAL_CN doc;
----209.2   �й�����������ӹ�����-����
select * from S_T_BIOLOGICAL_FY doc;
----210   �й���ҩר����������
select * from S_T_MEDICINE_TRANS_T1 doc;
----211   �й���ѧҩ��ר����ӹ�����
select * from S_T_PHARMACEUTICAL_T1 doc;
----212   �й���ҩר����ӹ�����
select * from S_T_MEDICINE_HANDLE_T1 doc;
----213   �й�ר��ժҪӢ�ķ������ݣ���׼����
select * from S_CHINA_PATENT_ABSTRACTS doc;
----214   DOCDB���ݣ���׼����
select * from S_DOCDB doc;
----215   ����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼����
select * from S_WIPO_PATENT_DESCRIPTION doc;
----216   ���ô�ר����¼�ȫ�����ݣ�CA������׼����
select * from S_CANADIAN_PATENT_DESCRIPTION doc;
----217   ����˹ר����¼�ȫ�����ݣ�RU������׼����
select * from S_RUSSIAN_PATENT_DESCRIPTION doc;
----218   �Ĵ�����ר��ȫ���ı����ݣ�AU������׼����
select * from S_AUSTRALIAN_PATENT_FULLTEXT doc;
----219   �¹�ר����¼�ȫ�����ݣ�DE������׼����
select * from S_GERMAN_PATENT_DESCRIPTION doc;
----220   ����ר����¼�ȫ�����ݣ�FR������׼����
select * from S_FRENCH_PATENT_DESCRIPTION doc;
----221   ̨��ר����¼�ȫ�����ݣ�TW������׼����
select * from S_TAIWAN_PATENT_DESCRIPTION doc;
----222   ���ר����¼�����ݣ�HK������׼����
select * from S_HONGKONG_PATENT_DESCRIPTION doc;
----223   ����ר����¼�����ݣ�MO������׼����
select * from S_MACAO_PATENT_DESCRIPTION doc;
----224   ŷ����֯ר����¼�ȫ�����ݣ�EA������׼����
select * from S_EURASIAN_PATENT_DESCRIPTION doc;
----225   �ձ�������ר�����ݣ���׼����
select * from S_JAPAN_DESIGN_PATENT doc;
----226   �¹�������ר�����ݣ���׼����
select * from S_GERMAN_DESIGN_PATENT doc;
----227   ����������ר�����ݣ���׼����
select * from S_FRENCH_DESIGN_PATENT doc;
----228   ����˹������ר�����ݣ���׼����
select * from S_RUSSIAN_DESIGN_PATENT doc;
----229   �ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼����
select * from S_JAPAN_PATENT_ABSTRACTS doc;
----230   ����ר����ժӢ�ķ�������(KPA)����׼����
select * from S_KOREA_PATENT_ABSTRACTS doc;
----231   ����ר������״̬��INPADOC������׼����
select * from S_WORLD_PATENT_LAWSTATUS doc;
----232   �ձ�����(STD_JP_CIT)����׼����
select * from S_STD_JP_CIT doc;
----233   ��������(STD_KR_CIT)����׼����
select * from S_STD_KR_CIT doc;
----234   ��������״̬����(STD_KR_PRS)����׼����
select * from S_STD_KR_PRS doc;
----240   �й�ר������״̬��STD_CN_PRS������׼����
select * from S_STD_CN_PRS doc;
