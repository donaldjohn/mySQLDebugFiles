select count(*) from import_session t where t.data_res_type = '�й�ר��ȫ�Ĵ��뻯����' and t.completed = 'Y';
 

\\192.168.3.77\vol17\�й�ר��ȫ�Ĵ��뻯����\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION GRANT\20070411-001.ZIP

select * from import_session t where t.zip_or_dir_path='\\192.168.3.77\vol17\�й�ר��ȫ�Ĵ��뻯����\cn_fulltext_xml_tif\FULL TEXT FOR INVENTION GRANT\20070411-001.ZIP';

select * from import_session t where t.data_res_type = '�й�ר��ȫ�Ĵ��뻯����' and t.completed = 'N';


/**001
select * from s_import_bath b where b.res_type='�й�ר��ȫ�Ĵ��뻯����';
delete from s_import_bath b where b.res_type='�й�ר��ȫ�Ĵ��뻯����';
select * from import_session t where t.data_res_type = '�й�ר��ȫ�Ĵ��뻯����';
delete from import_session t where t.data_res_type = '�й�ר��ȫ�Ĵ��뻯����';
truncate table S_CHINA_PATENT_TEXTCODE;
**/



select b.* from s_import_bath b where b.res_type = '�й�ר��ȫ�Ĵ��뻯����';



select * from v$session where username='DRMS'
