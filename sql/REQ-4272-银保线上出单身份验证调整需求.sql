--壹帐通校验通过   中保信身份验证通过修改zbxidentresult=10201  30452
select a.* from lcidCardCheckInfo a where contno='2024091200000516';
/*
update lcidcardcheckinfo set resultstatus='000000',resultdesc='通过',zbxidentresult='10201' where contno='2024071700000326'
update lcidcardcheckinfo set resultstatus='000000',resultdesc='通过',zbxidentresult='10201' where Name='投保二' and IDNO='152123200601100359'
*/

insert into lcidCardCheckInfo (CONTNO, CUSTOMERNO, CUSTOMERTYPE, NAME, IDTYPE, IDNO, MANAGECOM, RESULTSTATUS, RESULTDESC, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, BANKCARDNO, POLAPPLYDATEDATE, ZBXIDENTDATE, ZBXIDENTTIME, ZBXIDENTRESULT, YZTIDENTDATE, YZTIDENTTIME, IDENTCANAL, MODIFIERNAME, STANDBYFLAG1, STANDBYFLAG2, STANDBYFLAG3)
values ('2024092500000386', '1001735259', 'M', '浦发受益', '0', '210104198301100045', '86310000', null, null, 'E007', to_date('10-09-2024', 'dd-mm-yyyy'), '09:33:57', to_date('10-09-2024', 'dd-mm-yyyy'), '09:33:57', '12345678', to_date('10-09-2024', 'dd-mm-yyyy'), to_date('10-09-2024', 'dd-mm-yyyy'), '09:33:57', '30452', null, null, 'E007', null, null, null, null);
select a.* from lcbnf a where contno='2024092500000386'

select appflag,a.* from lcpol a where contno='2024071700000326'

select a.* from lcidCardCheckInfo a where idno='210104198301100045';