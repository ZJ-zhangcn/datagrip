-- id: req-4730
-- 标题: 银保线上出单（网银、银保通）新增生存金领取方式和年金领取方式校验规则

select * from ldcode where codetype='getlocation';

--0-自动转账授权  1-累积生息  3-转入万能账户
select * from ldcode where codetype = 'ybtgetliveRisk' and code='1303013';
--生存金配置为累积生息

/*
insert into ldcode (codetype, code, codename, codealias, comcode, othersign) values ('ybtgetliveRisk', '1133006', '上海人寿稳赢逸生年金保险（分红型）', null, '1', '生存金领取方式为转入万能账户的产品');
*/
select * from ldcode where codetype = 'annuitygetmode';

--0-为空  1-一次性领取  2-月领  3-年领  99-其他
select * from ldcode where codetype='DutyGetMode' and code='1303013';
--年金配置为月领

/*
insert into ldcode (codetype, code, codename, codealias, comcode, othersign) values ('DutyGetMode', '1033039', '年金领取方式', null, '3', null);
*/
select * from ldcode where codetype='bonusgetmode';

--0-自动转账  1-累积生息  2-抵交保险费
select * from ldcode where codetype='BonusGet' and code='1303013';
--红利配置为自动转账

/*
insert into ldcode (codetype, code, codename, codealias, comcode, othersign) values ('BonusGet', '1133006', '红利领取方式', null, '1', null);
*/
select getform,(select codename from ldcode where codetype='getlocation' and code=a.getform) 生存金领取方式,bonusgetmode,(select codename from ldcode where codetype='bonusgetmode' and code=a.bonusgetmode) 红利领取方式,riskcode,contno,prtno from lcpol a
where contno in ('2024010200001386','','','') order by a.contno;

select contno,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       (select codename from ldcode where codetype = 'annuitygetmode' and code = (select distinct annuitygetmode from lcduty where contno=a.contno)) 年金领取方式,
       gettodate,
       getstartdate,
       getenddate,livegettype,polno,summoney
  from lcget a
 where contno = '2024010200001386';

select * from  ldcode1 where codetype='annuitygetmodedf'

select * from  lmriskparamsdef where paramstype='bonusgetmode'

select * from lmriskapp lm where exists(select 1 from lmdutygetalive a,lmdutygetrela b, lmriskduty c  where c.riskcode=lm.riskcode and a.getdutycode=b.getdutycode and b.dutycode=c.dutycode)

select *
from ldriskrule a
where salechnl = '03'
  and not exists (select 1 from ldcode1 where codetype = 'annuitygetmodedf' and code = a.riskcode)
  and not exists (select 1 from lmriskparamsdef where paramstype = 'bonusgetmode' and riskcode = a.riskcode)
  and not exists (select 1
                  from lmriskapp lm
                  where exists(select 1
                               from lmdutygetalive a,
                                    lmdutygetrela b,
                                    lmriskduty c
                               where c.riskcode = lm.riskcode
                                 and a.getdutycode=b.getdutycode and b.dutycode=c.dutycode) and riskcode=a.riskcode)


--银保通配置（银保数据库）
select bak1 /*是否为生存金产品*/,bak2 /*生存金是否配置*/,bak3 /*是否为红利领取产品*/,bak4 /*红利是否配置*/,standbyflag /*是否为年金产品*/,a.* from lmduty a where riskcode='1133005';