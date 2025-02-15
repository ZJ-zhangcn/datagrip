select a.*,rowid from lcmobilecheckinfo a where customerno in ('1060095575', '1060095576','','');

insert into lcmobilecheckinfo (CONTNO, CUSTOMERNO, CUSTOMERTYPE, NAME, IDCARD, MOBILE, MANAGECOM, REQCODE, REQMESSAGE, REQDATA, SEQNO, STATE, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, STANDBYFLAG1, STANDBYFLAG2)
values ('5000118241250047', '1060095576', 'I', '银保投保三三', '152123200601101175', '17512279999', '86010101', '10000', '成功', '{"state":"2"}', '8YDS9W1D990208131726978', '2', 'ZHHL_GXTB', to_date('07-02-2021', 'dd-mm-yyyy'), '20:30:28', to_date('07-02-2021', 'dd-mm-yyyy'), '20:30:27', '000', null);


select a.*,rowid from lcappnt a where appntno='1060094710';
select a.*,rowid from lcappnt a where contno='5000118241250047';
select a.*,rowid from lcinsured a where insuredno='1060094744';
select a.*,rowid from lcinsured a where contno='5000118241250047';
select a.*,rowid from lcappnt a where idno='310101199007111025'

select mobile,a.*,rowid from lcaddress a where customerno in ('1001735690', '')
/*
update lcaddress set POSTALADDRESS='上海市上海市黄浦区林校路街道义和庄北路4号' where customerno in ('1060094710', '1060094744')
*/


select * from ldcode where codetype = 'appjd_mobile' and code='01' for update ;
select * from ldcode where codetype = 'salechannels' for update ;
select codename from ldcode where codetype = 'appjd_ProblemState' and code='01' for update;
select * from ldcode where codetype = 'CheckMobile_State' and code='01' for update;
