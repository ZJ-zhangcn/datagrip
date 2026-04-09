--g
select a.appntname,a.appntbirthday,a.idtype,a.idno,b.mobile,idstdate,idexpdate,b.* from lcappnt a,lcaddress b
where a.appntno=b.customerno and a.addressno=b.addressno and a.contno in ('2026013000000156','');--2024082800000386

select /*idstdate,idexpdate,*/a.* from lcappnt a where contno='2025042700000406';

--官微退保险种
select a.* from ldcode1 a where codetype = 'wechatctlimit' and code1='1066009';

insert into ldcode1 (CODETYPE, CODE, CODE1, CODENAME, CODEALIAS, COMCODE, OTHERSIGN)
values ('wechatctlimit', '0000', '1066009', '上海人寿特种药品费用医疗保险', '微信申请自助退保限定渠道和险种', '1', '');
select appflag,contno,enddate,a.* from lcpol a where prtno='5000118331130024';
select cvalidate,getpoldate,customgetpoldate,a.* from lccont a where prtno='5000118331130024';



select idexpdate from ldperson a where customerno=(select appntno from lcappnt where prtno='5000118331129012');
select idexpdate,idstdate from lcappnt where prtno='5000118331129012';
select idexpdate,idstdate from lcinsured where prtno='5000118331129012';