select flowID,activitychinesename,activityid,count(activityid) as result,endtime from
(
select flowID,activitychinesename,activityid,to_char(SYS_CREATED,'yyyy-MM-dd') as endtime from taskticket where resolutioncode=1
)
group by flowID,activityid,activitychinesename,activityid,endtime 
order by endtime


































select * from View_FlowInstanceDate;
desc View_FlowInstanceDate;
select * from View_BD_ToDoList;






SELECT 
View_BD_ToDoList.View_BD_ToDoListOID,
View_BD_ToDoList.PUBTYPE,
View_BD_ToDoList.RegionNO,
View_BD_ToDoList.PACKGENO,
View_BD_ToDoList.TotalPage,
View_BD_ToDoList.TotalImageCount,
View_BD_ToDoList.IsFast,
View_BD_ToDoList.pagecount,
View_BD_ToDoList.IsSecond,
View_BD_ToDoList.IsErr,
View_BD_ToDoList.ActivityChineseName,
View_BD_ToDoList.UCML_UserOID,
alUCML_UserOID.EmployeeName AS EmployeeName 
FROM 
View_BD_ToDoList 
LEFT OUTER JOIN 
UCML_User alUCML_UserOID 
ON 
View_BD_ToDoList.UCML_UserOID= alUCML_UserOID.UCML_UserOID

select u.ucml_useroid, u.usr_login, u.employeename from UCML_User u;

select * from  FLOWINSTANCE;

select * from JK_BD_HISTORY_INFO;

select * from JK_BD_STATE_INFO;


SELECT 
BUSINESSFLOWID,
COUNT(1) RESULT FROM 
(select 
*
from
FLOWINSTANCE 
where 
flowstatus=0 
and 
BUSINESSFLOWID 
LIKE 
'FLow_BD_%_VER10'
) 
GROUP BY  
BUSINESSFLOWID 
HAVING 
BUSINESSFLOWID 
LIKE 'FLow_BD_%_VER10'  
ORDER BY 
BUSINESSFLOWID


select 
f.businessflowid, f.*
from
FLOWINSTANCE f
where 
flowstatus=0 
and 
BUSINESSFLOWID 
LIKE 
'FLow_BD_%_VER10'



select * from UCML_SYSCONFIG;



select t.*, t.codevalue_fk, t.rowid from UCML_SYSCONFIG t

000779b9-0000-0000-0000-0000190ef481
COMMON
select * from CodeValue c where c.Codetableid = 'UCML_SysConfigType';


select t.*, t.codevalue_fk, t.rowid from UCML_SYSCONFIG t


select * from CodeValue c where c.codevalueoid='000779b9-0000-0000-0000-0000190ef481';

000779b9-0000-0000-0000-0000190ef481

select t.itemvalue0 from UCML_SYSCONFIG t where t.groupname='RealTimeMonitor'  and t.itemname = 'MAX';


select t.itemvalue0 from UCML_SYSCONFIG t where t.groupname='办登配置'  and t.itemname = '办登加工周期';





select * from BM_Activity a where a.publicgroup = 'TEST组长';



select BM_ActivityOID,activityName,Startdate,PUBLICGROUPKEY, ucml_user_fk from BM_Activity a    
where 
PUBLICGROUPKEY like '%0005d407-0000-0000-0000-0000a0ff6fa5%' 
and
a.startdate = '2016-4-14';



select a.rowid,  BM_ActivityOID,activityName,Startdate, enddate, PUBLICGROUPKEY, ucml_user_fk from BM_Activity a


select * from T_PUB_FEEDBACK;

//增件撤件
select * from 
T_PUB_INFO_SINGLE s 
left join 
T_PUB_LIST l
on 
s.an = l.an
and
s.pubtype = l.pubtype
and
s.pubdate = l.pubdate
where 
s.sendok = 1 
and
l.issingle = 1




select *  from
T_PUB_LIST l
where l.issingle = 1



select * from UCML_CONTACT where ucml_useroid='ERREDITCB';
select u.boolean1, u.rowid from UCML_CONTACT u where ucml_useroid='000cc138-0000-0000-0000-0000986d1463';


select * from UCML_CONTACT where ucml_useroid='YUCHULICB';

select u.boolean1, u.rowid from UCML_CONTACT u where ucml_useroid='0012478a-0000-0000-0000-0000986e7230';





select * from UCML_User;


select * from BD_PROCESS_SETING;



select pub_processoid from pub_process where  substr(processno,2,2) = 'CB'

select * from pub_process;



select substr(processno,3,2),  p.*,   p.processno from pub_process p;



select 
* 
from 
UCML_User 
where 
UCML_User.UCML_UserOID
IN 
(
select  
ucml_useroid 
from 
ucml_contact 
where  
ucml_postoid 
in
( 
select  
ucml_post_fk  
from 
PUB_PROCESS 
where 
substr(processno,3,2)='CB' 
and 
substr(processno,0,2)='11' 
) 
 )






select * from pub_process











