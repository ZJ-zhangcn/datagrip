select * from lcSubmittedsleep where (MODULE='BQMQ' or MODULE='MQYF' or MODULE='MQHL');
select a.*,rowid from lcSubmittedsleep a where contno='2024092500001486';
select a.*,rowid from LCedorSleep a where module = 'GXBQ'
select a.*,rowid from LCedorSleep a where contno='2024092500001486';
/*
delete from lcSubmittedsleep where contno='2024073100000856';
delete from LCedorSleep where contno='2024073100000856';
*/

select sysvarvalue from ldsysvar where sysvar='BatIPHost' for update;

select a.*,rowid from ldtask a where taskdescribe like '%Ë¯Ãß%' --000194
select a.*,rowid from ldtask a where taskdescribe like '%Ê§Ð§%' --000194
select a.*,rowid from ldtask a where taskdescribe like '%ºìÀû%' --000124  000126
select a.*,rowid from ldtask a where taskdescribe like '%Éú´æ%' --000029  000030  000102

select a.* from ldtaskplan a where taskcode='000608' order by TASKPLANCODE desc

select a.*,rowid from lccontstate a where contno='2024072900000366'

select (feefinatype || '--' || (select codename from ldcode a where codetype = 'feefinatype' and code=a.feefinatype)) feefinatype,a.*,rowid from LJABonusGet a 
where otherno='2024081600000116' order by bonusyear desc;
/*
update LJABonusGet set getdate=date'2060-07-20',ENTERACCDATE=date'2060-07-20',CONFDATE=date'2060-07-20',makeDATE=date'2060-07-20',modifyDATE=date'2060-07-20' where otherno='2024071900000256' and bonusyear=('2060'-1)
*/

select a.*,rowid from ljsgetdraw a where contno='7402121100324005'

select sendflag,PRTNOTESTATE,a.*,rowid from ljaget a where otherno in ('7402121100325017', '7402121100325018','2024083000000556') order by shoulddate desc;
select a.*,rowid from ljaget a where actugetno='86000020300370000380'

select a.*,rowid from ljagetdraw a where contno='2024083000000556' order by getdate desc;
select FEEOPERATIONTYPE,FEEFINATYPE,contno,GETDUTYCODE,ACTUGETNO,getdate,getmoney,appntno,insuredno,riskcode,makedate,GETNOTICENO from ljagetdraw a where contno='2024073100000856' order by a.getdate desc;
/*
update ljagetdraw set makedate=getdate,modifydate=getdate where contno='2024072200000486'
*/

SELECT SYSVARVALUE FROM LDSYSVAR WHERE SYSVAR = 'SleepSFTPServer'--/home/wnnb/UPLOAD/SMBD/

select a.*,rowid from lysendtobank a where polno='7402121100324015'

select a.*,rowid from lobonuspol a where contno='2024083000000376' order by makedate;


select A_YFMakedate(2024073100000856) from dual
select a.*,rowid from ljagetdraw a where contno='2024073100000856'

select count(1) from ldworkcalendar where caldate between date'2027-10-01'  and date'2027-10-07' and datetype='Y'
select * from ldworkcalendar where caldate between date'2027-10-01'  and date'2027-10-05'  for update;
select * from ldworkcalendar where caldate between date'2063-08-01'  and date'2064-09-20' and datetype='Y' for update;

insert into ldworkcalendar (CALSN, YEAR, CALDATE, DATETYPE, AMBEGIN, AMEND, AMWORKTIME, PMBEGIN, PMEND, PMWORKTIME, WORKTIME, OPERATECOM, OPERATOR, MAKEDATE, MAKETIME, MODIFYOPERATOR, MODIFYDATE, MODIFYTIME)
values ('000001000000027585', '2044', to_date('01-09-2031', 'dd-mm-yyyy'), 'Y', '09:00:00', '12:00:00', '10800', '13:00:00', '18:00:00', '18000', '28800', '86', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00');

insert into ldworkcalendar (CALSN, YEAR, CALDATE, DATETYPE, AMBEGIN, AMEND, AMWORKTIME, PMBEGIN, PMEND, PMWORKTIME, WORKTIME, OPERATECOM, OPERATOR, MAKEDATE, MAKETIME, MODIFYOPERATOR, MODIFYDATE, MODIFYTIME)
values ('000001000000027586', '2044', to_date('02-09-2031', 'dd-mm-yyyy'), 'Y', '09:00:00', '12:00:00', '10800', '13:00:00', '18:00:00', '18000', '28800', '86', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00');

insert into ldworkcalendar (CALSN, YEAR, CALDATE, DATETYPE, AMBEGIN, AMEND, AMWORKTIME, PMBEGIN, PMEND, PMWORKTIME, WORKTIME, OPERATECOM, OPERATOR, MAKEDATE, MAKETIME, MODIFYOPERATOR, MODIFYDATE, MODIFYTIME)
values ('000001000000027587', '2044', to_date('03-09-2031', 'dd-mm-yyyy'), 'Y', '09:00:00', '12:00:00', '10800', '13:00:00', '18:00:00', '18000', '28800', '86', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00');

insert into ldworkcalendar (CALSN, YEAR, CALDATE, DATETYPE, AMBEGIN, AMEND, AMWORKTIME, PMBEGIN, PMEND, PMWORKTIME, WORKTIME, OPERATECOM, OPERATOR, MAKEDATE, MAKETIME, MODIFYOPERATOR, MODIFYDATE, MODIFYTIME)
values ('000001000000027588', '2044', to_date('04-09-2031', 'dd-mm-yyyy'), 'Y', '09:00:00', '12:00:00', '10800', '13:00:00', '18:00:00', '18000', '28800', '86', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00');

insert into ldworkcalendar (CALSN, YEAR, CALDATE, DATETYPE, AMBEGIN, AMEND, AMWORKTIME, PMBEGIN, PMEND, PMWORKTIME, WORKTIME, OPERATECOM, OPERATOR, MAKEDATE, MAKETIME, MODIFYOPERATOR, MODIFYDATE, MODIFYTIME)
values ('000001000000027589', '2044', to_date('05-09-2031', 'dd-mm-yyyy'), 'Y', '09:00:00', '12:00:00', '10800', '13:00:00', '18:00:00', '18000', '28800', '86', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00', 'SYS', to_date('01-07-2043', 'dd-mm-yyyy'), '12:00:00');

