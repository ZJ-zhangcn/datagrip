--数据宝开关  1-开  0-关
select codename from ldcode where codetype = 'CheckMobile_State' and code='01' for update;

--数据宝校验状态  state：1-通过  2-不通过
select a.* from lcmobileCheckInfo a where contno='5000118240327031'

insert into lcmobileCheckInfo (CONTNO, CUSTOMERNO, CUSTOMERTYPE, NAME, IDCARD, MOBILE, MANAGECOM, REQCODE, REQMESSAGE, REQDATA, SEQNO, STATE, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, STANDBYFLAG1, STANDBYFLAG2)
values ('5000118240327024', '1060092799', 'M', '银保投保九', '152101198311261578', '17503279999', '86310000', '10000', '成功', '{"state":"1"}', 'X023M1J5210224105602547', '1', 'ybt', to_date('24-02-2021', 'dd-mm-yyyy'), '01:19:19', to_date('24-02-2021', 'dd-mm-yyyy'), '01:19:20', '502', null);

select appflag,a.* from lccont a where contno='2024031800000596'

select a.* from lcinsured a where contno='5000118240327024'
select mobile,a.*,rowid from lcaddress a where customerno=(select appntno from lcappnt where contno='2024031800000596')
select mobile,a.*,rowid from lcaddress a where mobile='17503250001'
select a.*,rowid from laagent a where mobile='17503279999'
