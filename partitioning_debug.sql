

insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='澳门专利著录项数据（MO）（标准化）'; 
commit;



insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='欧亚组织专利著录项及全文数据（EA）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='波兰专利著录项及全文数据（PL）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='澳大利亚专利全文文本数据（AU）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='比利时专利全文数据（BE）（标准化）';
commit;





insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='以色列专利著录项及全文数据（IL）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='新加坡专利著录项及全文数据（SG）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='日本引文(STD_JP_CIT)（标准化）';
commit;


insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='西班牙专利全文数据（ES）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='香港专利著录项数据（HK）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='奥地利专利全文数据（AT）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='台湾专利著录项及全文数据（TW）（标准化）';
commit;





insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='瑞士专利全文代码化数据（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='德国专利著录项及全文数据（DE）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='俄罗斯专利著录项及全文数据（RU）（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='英国专利全文代码化数据（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='加拿大专利著录项及全文数据（CA）（标准化）';
commit;

insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='中国标准化简单引文数据';
commit;


insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='法国专利著录项及全文数据（FR）（标准化）';
commit;


insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='韩国引文(STD_KR_CIT)（标准化）' ;
commit;

insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='国际知识产权组织专利著录项及全文数据（WIPO)（标准化）';
commit;



insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='欧专局专利全文文本数据（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='韩国专利全文代码化数据（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='日本专利文摘英文翻译数据（PAJ)（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='中国专利著录项目与文摘数据';
commit;

insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='美国专利全文文本数据（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='中国专利标准化全文文本数据';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='日本专利全文代码化数据（标准化）';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='韩国法律状态数据(STD_KR_PRS)（标准化）';
commit;

insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）';
commit;


/**231 按子分区字段逐批次分区**/

insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160416';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160412';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160414';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160504';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160409';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160601';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160706';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160410';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20161109';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20161019';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160511';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160817';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160413';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160824';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160525';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160921';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20161005';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160804';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20161130';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160608';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160831';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160622';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20161026';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160928';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160629';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160727';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20161123';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20161012';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20161102';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160720';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160713';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160420';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160729';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160907';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160417';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160419';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160411';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160427';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160415';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160914';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160518';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160418';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160810';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20161116';
commit;
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160615';
commit;


/**两亿条 未入库**/
insert into s_index_file_detail select * from s_index_file_detail_origin ori where ori.data_res='世界专利法律状态（INPADOC）（标准化）' and ori.batch = '20160408';commit;
















