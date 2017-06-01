/**214·ÖÎö**/
select count(1) from import_session_bk@to55;
select count(1) from import_session s where s.tablename = upper('s_docdb') and s.completed = 'Y' and not exists (select 1 from s_docdb db where db.import_session_id = s.session_id);
begin
insert into import_session_bk@to55 select * from import_session s where s.tablename = upper('s_docdb') and s.completed = 'Y' and not exists (select 1 from s_docdb db where db.import_session_id = s.session_id);
delete from import_session s where s.tablename = upper('s_docdb') and s.completed = 'Y' and not exists (select 1 from s_docdb db where db.import_session_id = s.session_id);
commit;
end;


select * from import_session s where s.tablename = upper('s_docdb') and s.completed = 'Y' and not exists (select 1 from s_docdb db where db.import_session_id = s.session_id);
select * from s_docdb;


