UCMLCBS

select  substr(processno,0,2) from pub_process where ucml_post_fk in( select ucml_postoid from ucml_contact  where ucml_useroid =


select * from ucml_contact 


PUB_PROCESS_FK in(select pub_processoid from pub_process where substr(processno,3,2) <> 'CB' and substr(processno,0,2)  =


select pub_processoid, substr(processno,3,2) from pub_process where substr(processno,3,2) <> 'CB' and substr(processno,0,2)  = '10'

select * from pub_process where substr(processno,3,2)<> 'CB' or substr(processno,3,2) = null )

select * from pub_process where substr(processno,3,2)<> 'CB'


select p.rowid, p.* from pub_process p;
