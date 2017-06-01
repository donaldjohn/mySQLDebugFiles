

---过滤专利
select
'select '''||dtl.chinese_name||''' res, lst.expr||'','' from mv_patent_sub_par_list lst where lst.id = '||dtl.id||';'
from s_data_resource_types_detail dtl where dtl.id in (3,4,6,10,13,14,50,51,52,53,54,55,103,104,105,106,107,108,213,214,215,216,217,218,219,220,221,222,223,224,229,231,232,233,234)
order by dtl.id asc;
---过滤非专利
select
'select '''||dtl.chinese_name||''' res, lst.expr||'',''  from mv_np_sub_par_lst lst where lst.id = '||dtl.id||';'
from s_data_resource_types_detail dtl where dtl.id in (132,133,134,136,137,138,139,153,162,172,180)
order by dtl.id asc


----专利
select '中国专利标准化全文文本数据' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 3;
select '中国专利标准化全文图像数据' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 4;
select '中国专利著录项目与文摘数据' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 6;
select '中国专利法律状态数据' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 10;
select '中国标准化简单引文数据' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 13;
select '专利缴费数据' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 14;
select '美国专利全文文本数据（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 50;
select '欧专局专利全文文本数据（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 51;
select '韩国专利全文代码化数据（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 52;
select '瑞士专利全文代码化数据（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 53;
select '英国专利全文代码化数据（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 54;
select '日本专利全文代码化数据（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 55;
select '比利时专利全文数据（BE）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 103;
select '奥地利专利全文数据（AT）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 104;
select '西班牙专利全文数据（ES）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 105;
select '波兰专利著录项及全文数据（PL）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 106;
select '以色列专利著录项及全文数据（IL）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 107;
select '新加坡专利著录项及全文数据（SG）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 108;
select '中国专利摘要英文翻译数据（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 213;
select 'DOCDB数据（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 214;
select '国际知识产权组织专利著录项及全文数据（WIPO)（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 215;
select '加拿大专利著录项及全文数据（CA）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 216;
select '俄罗斯专利著录项及全文数据（RU）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 217;
select '澳大利亚专利全文文本数据（AU）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 218;
select '德国专利著录项及全文数据（DE）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 219;
select '法国专利著录项及全文数据（FR）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 220;
select '台湾专利著录项及全文数据（TW）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 221;
select '香港专利著录项数据（HK）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 222;
select '澳门专利著录项数据（MO）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 223;
select '欧亚组织专利著录项及全文数据（EA）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 224;
select '日本专利文摘英文翻译数据（PAJ)（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 229;
select '世界专利法律状态（INPADOC）（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 231;
select '日本引文(STD_JP_CIT)（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 232;
select '韩国引文(STD_KR_CIT)（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 233;
select '韩国法律状态数据(STD_KR_PRS)（标准化）' res, lst.expr||',' from mv_patent_sub_par_list lst where lst.id = 234;



----非专利
select '中国商标' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 132;
select '中国商标许可数据' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 133;
select '中国商标转让数据' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 134;
select '马德里商标进入中国' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 136;
select '中国驰名商标数据' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 137;
select '美国申请商标' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 138;
select '美国转让商标' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 139;
select '中外期刊的著录项目与文摘数据' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 153;
select '中国法院判例初加工数据' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 162;
select '马德里商标购买数据' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 172;
select '中国专利代理知识产权法律法规加工数据' res, lst.expr||','  from mv_np_sub_par_lst lst where lst.id = 180;















select lst.id, lst.res, lst.expr from mv_patent_sub_par_list lst where lst.id = 3;

select  from mv_patent_sub_par_list where id = 3;

select * from mv_np_sub_par_lst;


/**专利数据子查询定义**/
rename  mv_patent_sub_par_list to mv_pat_sub_par_list;

create materialized view mv_patent_sub_par_list
refresh force on demand
as
(
select 3 as id, '中国专利标准化全文文本数据' as res, '      SUBPARTITION spar_3_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '中国专利标准化全文文本数据' group by ixdtl.batch union
select 4 as id, '中国专利标准化全文图像数据' as res, '      SUBPARTITION spar_4_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '中国专利标准化全文图像数据' group by ixdtl.batch union
select 6 as id, '中国专利著录项目与文摘数据' as res, '      SUBPARTITION spar_6_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '中国专利著录项目与文摘数据' group by ixdtl.batch union
select 10 as id, '中国专利法律状态数据' as res, '      SUBPARTITION spar_10_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '中国专利法律状态数据' group by ixdtl.batch union
select 13 as id, '中国标准化简单引文数据' as res, '      SUBPARTITION spar_13_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '中国标准化简单引文数据' group by ixdtl.batch union
select 14 as id, '专利缴费数据' as res, '      SUBPARTITION spar_14_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '专利缴费数据' group by ixdtl.batch union
select 50 as id, '美国专利全文文本数据（标准化）' as res, '      SUBPARTITION spar_50_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '美国专利全文文本数据（标准化）' group by ixdtl.batch union
select 51 as id, '欧专局专利全文文本数据（标准化）' as res, '      SUBPARTITION spar_51_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '欧专局专利全文文本数据（标准化）' group by ixdtl.batch union
select 52 as id, '韩国专利全文代码化数据（标准化）' as res, '      SUBPARTITION spar_52_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '韩国专利全文代码化数据（标准化）' group by ixdtl.batch union
select 53 as id, '瑞士专利全文代码化数据（标准化）' as res, '      SUBPARTITION spar_53_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '瑞士专利全文代码化数据（标准化）' group by ixdtl.batch union
select 54 as id, '英国专利全文代码化数据（标准化）' as res, '      SUBPARTITION spar_54_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '英国专利全文代码化数据（标准化）' group by ixdtl.batch union
select 55 as id, '日本专利全文代码化数据（标准化）' as res, '      SUBPARTITION spar_55_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '日本专利全文代码化数据（标准化）' group by ixdtl.batch union
select 103 as id, '比利时专利全文数据（BE）（标准化）' as res, '      SUBPARTITION spar_103_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '比利时专利全文数据（BE）（标准化）' group by ixdtl.batch union
select 104 as id, '奥地利专利全文数据（AT）（标准化）' as res, '      SUBPARTITION spar_104_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '奥地利专利全文数据（AT）（标准化）' group by ixdtl.batch union
select 105 as id, '西班牙专利全文数据（ES）（标准化）' as res, '      SUBPARTITION spar_105_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '西班牙专利全文数据（ES）（标准化）' group by ixdtl.batch union
select 106 as id, '波兰专利著录项及全文数据（PL）（标准化）' as res, '      SUBPARTITION spar_106_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '波兰专利著录项及全文数据（PL）（标准化）' group by ixdtl.batch union
select 107 as id, '以色列专利著录项及全文数据（IL）（标准化）' as res, '      SUBPARTITION spar_107_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '以色列专利著录项及全文数据（IL）（标准化）' group by ixdtl.batch union
select 108 as id, '新加坡专利著录项及全文数据（SG）（标准化）' as res, '      SUBPARTITION spar_108_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '新加坡专利著录项及全文数据（SG）（标准化）' group by ixdtl.batch union
select 213 as id, '中国专利摘要英文翻译数据（标准化）' as res, '      SUBPARTITION spar_213_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '中国专利摘要英文翻译数据（标准化）' group by ixdtl.batch union
select 214 as id, 'DOCDB数据（标准化）' as res, '      SUBPARTITION spar_214_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = 'DOCDB数据（标准化）' group by ixdtl.batch union
select 215 as id, '国际知识产权组织专利著录项及全文数据（WIPO)（标准化）' as res, '      SUBPARTITION spar_215_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '国际知识产权组织专利著录项及全文数据（WIPO)（标准化）' group by ixdtl.batch union
select 216 as id, '加拿大专利著录项及全文数据（CA）（标准化）' as res, '      SUBPARTITION spar_216_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '加拿大专利著录项及全文数据（CA）（标准化）' group by ixdtl.batch union
select 217 as id, '俄罗斯专利著录项及全文数据（RU）（标准化）' as res, '      SUBPARTITION spar_217_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '俄罗斯专利著录项及全文数据（RU）（标准化）' group by ixdtl.batch union
select 218 as id, '澳大利亚专利全文文本数据（AU）（标准化）' as res, '      SUBPARTITION spar_218_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '澳大利亚专利全文文本数据（AU）（标准化）' group by ixdtl.batch union
select 219 as id, '德国专利著录项及全文数据（DE）（标准化）' as res, '      SUBPARTITION spar_219_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '德国专利著录项及全文数据（DE）（标准化）' group by ixdtl.batch union
select 220 as id, '法国专利著录项及全文数据（FR）（标准化）' as res, '      SUBPARTITION spar_220_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '法国专利著录项及全文数据（FR）（标准化）' group by ixdtl.batch union
select 221 as id, '台湾专利著录项及全文数据（TW）（标准化）' as res, '      SUBPARTITION spar_221_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '台湾专利著录项及全文数据（TW）（标准化）' group by ixdtl.batch union
select 222 as id, '香港专利著录项数据（HK）（标准化）' as res, '      SUBPARTITION spar_222_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '香港专利著录项数据（HK）（标准化）' group by ixdtl.batch union
select 223 as id, '澳门专利著录项数据（MO）（标准化）' as res, '      SUBPARTITION spar_223_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '澳门专利著录项数据（MO）（标准化）' group by ixdtl.batch union
select 224 as id, '欧亚组织专利著录项及全文数据（EA）（标准化）' as res, '      SUBPARTITION spar_224_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '欧亚组织专利著录项及全文数据（EA）（标准化）' group by ixdtl.batch union
select 229 as id, '日本专利文摘英文翻译数据（PAJ)（标准化）' as res, '      SUBPARTITION spar_229_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '日本专利文摘英文翻译数据（PAJ)（标准化）' group by ixdtl.batch union
select 231 as id, '世界专利法律状态（INPADOC）（标准化）' as res, '      SUBPARTITION spar_231_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '世界专利法律状态（INPADOC）（标准化）' group by ixdtl.batch union
select 232 as id, '日本引文(STD_JP_CIT)（标准化）' as res, '      SUBPARTITION spar_232_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '日本引文(STD_JP_CIT)（标准化）' group by ixdtl.batch union
select 233 as id, '韩国引文(STD_KR_CIT)（标准化）' as res, '      SUBPARTITION spar_233_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '韩国引文(STD_KR_CIT)（标准化）' group by ixdtl.batch union
select 234 as id, '韩国法律状态数据(STD_KR_PRS)（标准化）' as res, '      SUBPARTITION spar_234_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_index_file_detail ixdtl where ixdtl.data_res = '韩国法律状态数据(STD_KR_PRS)（标准化）' group by ixdtl.batch
)
;
create materialized view mv_np_sub_par_lst
refresh force on demand
as
(
select 132 as id, '中国商标' as res, '      SUBPARTITION spar_132_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '中国商标' group by ixdtl.batch union
select 133 as id, '中国商标许可数据' as res, '      SUBPARTITION spar_133_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '中国商标许可数据' group by ixdtl.batch union
select 134 as id, '中国商标转让数据' as res, '      SUBPARTITION spar_134_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '中国商标转让数据' group by ixdtl.batch union
select 136 as id, '马德里商标进入中国' as res, '      SUBPARTITION spar_136_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '马德里商标进入中国' group by ixdtl.batch union
select 137 as id, '中国驰名商标数据' as res, '      SUBPARTITION spar_137_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '中国驰名商标数据' group by ixdtl.batch union
select 138 as id, '美国申请商标' as res, '      SUBPARTITION spar_138_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '美国申请商标' group by ixdtl.batch union
select 139 as id, '美国转让商标' as res, '      SUBPARTITION spar_139_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '美国转让商标' group by ixdtl.batch union
select 153 as id, '中外期刊的著录项目与文摘数据' as res, '      SUBPARTITION spar_153_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '中外期刊的著录项目与文摘数据' group by ixdtl.batch union
select 162 as id, '中国法院判例初加工数据' as res, '      SUBPARTITION spar_162_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '中国法院判例初加工数据' group by ixdtl.batch union
select 172 as id, '马德里商标购买数据' as res, '      SUBPARTITION spar_172_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '马德里商标购买数据' group by ixdtl.batch union
select 180 as id, '中国专利代理知识产权法律法规加工数据' as res, '      SUBPARTITION spar_180_'||ixdtl.batch||' VALUES ('''||ixdtl.batch||''')' expr  from s_np_index_file_detail ixdtl where ixdtl.data_res = '中国专利代理知识产权法律法规加工数据' group by ixdtl.batch
)
;
