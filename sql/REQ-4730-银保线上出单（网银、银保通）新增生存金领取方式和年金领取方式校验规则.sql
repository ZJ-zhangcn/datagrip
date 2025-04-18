select * from ldcode where codetype = 'ybtgetliveRisk' and code='1133005';--生存金配置为累积生息

INSERT INTO LISDATA.LDCODE (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN) VALUES ('ybtgetliveRisk', '1133005', '上海人寿稳赢添添鸿运版养老年金保险（分红型）', null, '1', '生存金领取方式为转入万能账户的产品');

select * from ldcode where CODETYPE='DutyGetMode' and code='1133005';--年金配置为月领

INSERT INTO LISDATA.LDCODE (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN) VALUES ('DutyGetMode', '1133005', '年金领取方式', null, '2', null);

select * from ldcode where CODETYPE='BonusGet' and code='1133005';--红利配置为自动转账

INSERT INTO LISDATA.LDCODE (CODETYPE, CODE, CODENAME, CODEALIAS, COMCODE, OTHERSIGN) VALUES ('BonusGet', '1133005', '红利领取方式', null, '0', null);

select * from ldcode where codetype='getlocation'
select * from ldcode where codetype = 'annuitygetmode'
select * from ldcode where codetype='bonusgetmode'

select getform,(select codename from ldcode where codetype='getlocation' and code=a.getform) 生存金领取方式,bonusgetmode,(select codename from ldcode where codetype='bonusgetmode' and code=a.bonusgetmode) 红利领取方式,riskcode,contno,prtno from lcpol a
where contno in ('2025041700002596','','','') order by a.contno;

select contno,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       (select codename from ldcode where codetype = 'annuitygetmode' and code = (select distinct annuitygetmode from lcduty where contno=a.contno)) 年金领取方式,
       gettodate,
       getstartdate,
       getenddate,LiveGetType,polno,summoney
  from lcget a
 where contno = '2025041700002776';


SELECT * FROM  ldcode1 where codetype='annuitygetmodedf'
select * from  LMRiskParamsDef where paramstype='bonusgetmode'
SELECT * FROM lmriskapp lm where exists(select 1 from lmdutygetalive a,lmdutygetrela b, lmriskduty c  where c.riskcode=lm.riskcode and a.getdutycode=b.getdutycode and b.dutycode=c.dutycode)

select *
from ldriskrule a
where salechnl = '03'
  and not exists (SELECT 1 FROM ldcode1 where codetype = 'annuitygetmodedf' and code = a.riskcode)
  and not exists (SELECT 1 FROM LMRiskParamsDef where paramstype = 'bonusgetmode' and riskcode = a.riskcode)
  and not exists (SELECT 1
                  FROM lmriskapp lm
                  where exists(select 1
                               from lmdutygetalive a,
                                    lmdutygetrela b,
                                    lmriskduty c
                               where c.riskcode = lm.riskcode
                                 and a.getdutycode=b.getdutycode and b.dutycode=c.dutycode) and riskcode=a.riskcode)