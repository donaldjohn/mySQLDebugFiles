

---����ר��
select
'select '''||dtl.chinese_name||''' res, lst.expr||'','' from mv_patent_sub_par_list lst where lst.id = '||dtl.id||';'
from s_data_resource_types_detail dtl where dtl.id in (3,4,6,10,13,14,50,51,52,53,54,55,103,104,105,106,107,108,213,214,215,216,217,218,219,220,221,222,223,224,229,231,232,233,234)
order by dtl.id asc;
---���˷�ר��
select
'select '''||dtl.chinese_name||''' res, lst.expr||'',''  from mv_np_sub_par_lst lst where lst.id = '||dtl.id||';'
from s_data_resource_types_detail dtl where dtl.id in (132,133,134,136,137,138,139,153,162,172,180)
order by dtl.id asc


----ר��
select '�й�ר����׼��ȫ���ı�����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 3;
select '�й�ר����׼��ȫ��ͼ������' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 4;
select '�й�ר����¼��Ŀ����ժ����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 6;
select '�й�ר������״̬����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 10;
select '�й���׼������������' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 13;
select 'ר���ɷ�����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 14;
select '����ר��ȫ���ı����ݣ���׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 50;
select 'ŷר��ר��ȫ���ı����ݣ���׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 51;
select '����ר��ȫ�Ĵ��뻯���ݣ���׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 52;
select '��ʿר��ȫ�Ĵ��뻯���ݣ���׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 53;
select 'Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 54;
select '�ձ�ר��ȫ�Ĵ��뻯���ݣ���׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 55;
select '����ʱר��ȫ�����ݣ�BE������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 103;
select '�µ���ר��ȫ�����ݣ�AT������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 104;
select '������ר��ȫ�����ݣ�ES������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 105;
select '����ר����¼�ȫ�����ݣ�PL������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 106;
select '��ɫ��ר����¼�ȫ�����ݣ�IL������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 107;
select '�¼���ר����¼�ȫ�����ݣ�SG������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 108;
select '�й�ר��ժҪӢ�ķ������ݣ���׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 213;
select 'DOCDB���ݣ���׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 214;
select '����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 215;
select '���ô�ר����¼�ȫ�����ݣ�CA������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 216;
select '����˹ר����¼�ȫ�����ݣ�RU������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 217;
select '�Ĵ�����ר��ȫ���ı����ݣ�AU������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 218;
select '�¹�ר����¼�ȫ�����ݣ�DE������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 219;
select '����ר����¼�ȫ�����ݣ�FR������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 220;
select '̨��ר����¼�ȫ�����ݣ�TW������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 221;
select '���ר����¼�����ݣ�HK������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 222;
select '����ר����¼�����ݣ�MO������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 223;
select 'ŷ����֯ר����¼�ȫ�����ݣ�EA������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 224;
select '�ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 229;
select '����ר������״̬��INPADOC������׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 231;
select '�ձ�����(STD_JP_CIT)����׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 232;
select '��������(STD_KR_CIT)����׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 233;
select '��������״̬����(STD_KR_PRS)����׼����' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 234;



----��ר��
select '�й��̱�' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 132;
select '�й��̱��������' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 133;
select '�й��̱�ת������' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 134;
select '������̱�����й�' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 136;
select '�й������̱�����' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 137;
select '���������̱�' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 138;
select '����ת���̱�' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 139;
select '�����ڿ�����¼��Ŀ����ժ����' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 153;
select '�й���Ժ�������ӹ�����' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 162;
select '������̱깺������' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 172;
select '�й�ר������֪ʶ��Ȩ���ɷ���ӹ�����' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 180;















select lst.id, lst.res, lst.expr from mv_patent_sub_par_list lst where lst.id = 3;

select  from mv_patent_sub_par_list where id = 3;

select * from mv_np_sub_par_lst;


/**ר�������Ӳ�ѯ����**/
rename  mv_patent_sub_par_list to mv_pat_sub_par_list;

create materialized view mv_patent_sub_par_list
refresh force on demand
as
(
select 3 as id, '�й�ר����׼��ȫ���ı�����' as res, '      SUBPARTITION spar_3_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�й�ר����׼��ȫ���ı�����' group by ixdtl.batch union
select 4 as id, '�й�ר����׼��ȫ��ͼ������' as res, '      SUBPARTITION spar_4_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�й�ר����׼��ȫ��ͼ������' group by ixdtl.batch union
select 6 as id, '�й�ר����¼��Ŀ����ժ����' as res, '      SUBPARTITION spar_6_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�й�ר����¼��Ŀ����ժ����' group by ixdtl.batch union
select 10 as id, '�й�ר������״̬����' as res, '      SUBPARTITION spar_10_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�й�ר������״̬����' group by ixdtl.batch union
select 13 as id, '�й���׼������������' as res, '      SUBPARTITION spar_13_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�й���׼������������' group by ixdtl.batch union
select 14 as id, 'ר���ɷ�����' as res, '      SUBPARTITION spar_14_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = 'ר���ɷ�����' group by ixdtl.batch union
select 50 as id, '����ר��ȫ���ı����ݣ���׼����' as res, '      SUBPARTITION spar_50_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '����ר��ȫ���ı����ݣ���׼����' group by ixdtl.batch union
select 51 as id, 'ŷר��ר��ȫ���ı����ݣ���׼����' as res, '      SUBPARTITION spar_51_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = 'ŷר��ר��ȫ���ı����ݣ���׼����' group by ixdtl.batch union
select 52 as id, '����ר��ȫ�Ĵ��뻯���ݣ���׼����' as res, '      SUBPARTITION spar_52_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '����ר��ȫ�Ĵ��뻯���ݣ���׼����' group by ixdtl.batch union
select 53 as id, '��ʿר��ȫ�Ĵ��뻯���ݣ���׼����' as res, '      SUBPARTITION spar_53_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '��ʿר��ȫ�Ĵ��뻯���ݣ���׼����' group by ixdtl.batch union
select 54 as id, 'Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼����' as res, '      SUBPARTITION spar_54_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = 'Ӣ��ר��ȫ�Ĵ��뻯���ݣ���׼����' group by ixdtl.batch union
select 55 as id, '�ձ�ר��ȫ�Ĵ��뻯���ݣ���׼����' as res, '      SUBPARTITION spar_55_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�ձ�ר��ȫ�Ĵ��뻯���ݣ���׼����' group by ixdtl.batch union
select 103 as id, '����ʱר��ȫ�����ݣ�BE������׼����' as res, '      SUBPARTITION spar_103_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '����ʱר��ȫ�����ݣ�BE������׼����' group by ixdtl.batch union
select 104 as id, '�µ���ר��ȫ�����ݣ�AT������׼����' as res, '      SUBPARTITION spar_104_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�µ���ר��ȫ�����ݣ�AT������׼����' group by ixdtl.batch union
select 105 as id, '������ר��ȫ�����ݣ�ES������׼����' as res, '      SUBPARTITION spar_105_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '������ר��ȫ�����ݣ�ES������׼����' group by ixdtl.batch union
select 106 as id, '����ר����¼�ȫ�����ݣ�PL������׼����' as res, '      SUBPARTITION spar_106_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '����ר����¼�ȫ�����ݣ�PL������׼����' group by ixdtl.batch union
select 107 as id, '��ɫ��ר����¼�ȫ�����ݣ�IL������׼����' as res, '      SUBPARTITION spar_107_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '��ɫ��ר����¼�ȫ�����ݣ�IL������׼����' group by ixdtl.batch union
select 108 as id, '�¼���ר����¼�ȫ�����ݣ�SG������׼����' as res, '      SUBPARTITION spar_108_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�¼���ר����¼�ȫ�����ݣ�SG������׼����' group by ixdtl.batch union
select 213 as id, '�й�ר��ժҪӢ�ķ������ݣ���׼����' as res, '      SUBPARTITION spar_213_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�й�ר��ժҪӢ�ķ������ݣ���׼����' group by ixdtl.batch union
select 214 as id, 'DOCDB���ݣ���׼����' as res, '      SUBPARTITION spar_214_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = 'DOCDB���ݣ���׼����' group by ixdtl.batch union
select 215 as id, '����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼����' as res, '      SUBPARTITION spar_215_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '����֪ʶ��Ȩ��֯ר����¼�ȫ�����ݣ�WIPO)����׼����' group by ixdtl.batch union
select 216 as id, '���ô�ר����¼�ȫ�����ݣ�CA������׼����' as res, '      SUBPARTITION spar_216_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '���ô�ר����¼�ȫ�����ݣ�CA������׼����' group by ixdtl.batch union
select 217 as id, '����˹ר����¼�ȫ�����ݣ�RU������׼����' as res, '      SUBPARTITION spar_217_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '����˹ר����¼�ȫ�����ݣ�RU������׼����' group by ixdtl.batch union
select 218 as id, '�Ĵ�����ר��ȫ���ı����ݣ�AU������׼����' as res, '      SUBPARTITION spar_218_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�Ĵ�����ר��ȫ���ı����ݣ�AU������׼����' group by ixdtl.batch union
select 219 as id, '�¹�ר����¼�ȫ�����ݣ�DE������׼����' as res, '      SUBPARTITION spar_219_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�¹�ר����¼�ȫ�����ݣ�DE������׼����' group by ixdtl.batch union
select 220 as id, '����ר����¼�ȫ�����ݣ�FR������׼����' as res, '      SUBPARTITION spar_220_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '����ר����¼�ȫ�����ݣ�FR������׼����' group by ixdtl.batch union
select 221 as id, '̨��ר����¼�ȫ�����ݣ�TW������׼����' as res, '      SUBPARTITION spar_221_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '̨��ר����¼�ȫ�����ݣ�TW������׼����' group by ixdtl.batch union
select 222 as id, '���ר����¼�����ݣ�HK������׼����' as res, '      SUBPARTITION spar_222_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '���ר����¼�����ݣ�HK������׼����' group by ixdtl.batch union
select 223 as id, '����ר����¼�����ݣ�MO������׼����' as res, '      SUBPARTITION spar_223_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '����ר����¼�����ݣ�MO������׼����' group by ixdtl.batch union
select 224 as id, 'ŷ����֯ר����¼�ȫ�����ݣ�EA������׼����' as res, '      SUBPARTITION spar_224_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = 'ŷ����֯ר����¼�ȫ�����ݣ�EA������׼����' group by ixdtl.batch union
select 229 as id, '�ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼����' as res, '      SUBPARTITION spar_229_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�ձ�ר����ժӢ�ķ������ݣ�PAJ)����׼����' group by ixdtl.batch union
select 231 as id, '����ר������״̬��INPADOC������׼����' as res, '      SUBPARTITION spar_231_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '����ר������״̬��INPADOC������׼����' group by ixdtl.batch union
select 232 as id, '�ձ�����(STD_JP_CIT)����׼����' as res, '      SUBPARTITION spar_232_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '�ձ�����(STD_JP_CIT)����׼����' group by ixdtl.batch union
select 233 as id, '��������(STD_KR_CIT)����׼����' as res, '      SUBPARTITION spar_233_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '��������(STD_KR_CIT)����׼����' group by ixdtl.batch union
select 234 as id, '��������״̬����(STD_KR_PRS)����׼����' as res, '      SUBPARTITION spar_234_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '��������״̬����(STD_KR_PRS)����׼����' group by ixdtl.batch
)
;
create materialized view mv_np_sub_par_lst
refresh force on demand
as
(
select 132 as id, '�й��̱�' as res, '      SUBPARTITION spar_132_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '�й��̱�' group by ixdtl.batch union
select 133 as id, '�й��̱��������' as res, '      SUBPARTITION spar_133_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '�й��̱��������' group by ixdtl.batch union
select 134 as id, '�й��̱�ת������' as res, '      SUBPARTITION spar_134_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '�й��̱�ת������' group by ixdtl.batch union
select 136 as id, '������̱�����й�' as res, '      SUBPARTITION spar_136_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '������̱�����й�' group by ixdtl.batch union
select 137 as id, '�й������̱�����' as res, '      SUBPARTITION spar_137_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '�й������̱�����' group by ixdtl.batch union
select 138 as id, '���������̱�' as res, '      SUBPARTITION spar_138_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '���������̱�' group by ixdtl.batch union
select 139 as id, '����ת���̱�' as res, '      SUBPARTITION spar_139_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '����ת���̱�' group by ixdtl.batch union
select 153 as id, '�����ڿ�����¼��Ŀ����ժ����' as res, '      SUBPARTITION spar_153_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '�����ڿ�����¼��Ŀ����ժ����' group by ixdtl.batch union
select 162 as id, '�й���Ժ�������ӹ�����' as res, '      SUBPARTITION spar_162_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '�й���Ժ�������ӹ�����' group by ixdtl.batch union
select 172 as id, '������̱깺������' as res, '      SUBPARTITION spar_172_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '������̱깺������' group by ixdtl.batch union
select 180 as id, '�й�ר������֪ʶ��Ȩ���ɷ���ӹ�����' as res, '      SUBPARTITION spar_180_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '�й�ר������֪ʶ��Ȩ���ɷ���ӹ�����' group by ixdtl.batch
)
;
