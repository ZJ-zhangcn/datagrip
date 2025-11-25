/*
update lccont set getpoldate=signdate,customgetpoldate=signdate where prtno='5000118351009475'
update lccont set getpoldate=signdate,customgetpoldate=signdate where contno in ('2025111000001186','','','')
update lccont set getpoldate=null,customgetpoldate=null where contno in ('2024122500000216','','','')
*/
--
select a.* from lccontstate a where contno='2024051100000126';
--
select a.* from lcconthangupstate a where contno='2024032500000126';
--险种配置表
select STARTDATE,enddate,a.* from lmriskapp a where riskcode='1033032';
select STARTDATE,a.* from lmriskapp a where riskname like '%盛世安欣%';
select * from LMRiskParamsDef  where riskcode='1033029' order by PARAMSTYPE,ParamsCode;
--H：健康险  S：重疾险  R：年金险  U：万能险
select a.* from ldcode a where codetype like '%kindcode%';
select kindcode,a.* from lmriskapp a where riskcode='1016010';
select a.* from lmriskpay a where riskcode='1133005';
--险种支持的保全项
select a.* from lmriskedoritem a where riskcode='1036007';
select a.* from lmriskedoritem a where edorcode='NP';
--算法表
select a.* from lmcalmode a where riskcode='1136003';
--险种支持的销售渠道
select salechnl,a.* from ldriskrule a where riskcode in ('1111003','') order by a.riskcode,a.SALECHNL;

INSERT INTO LDRISKRULE (RISKCODE,SALECHNL,COMGROUP,STARTPOLAPPLYDATE,ENDPOLAPPLYDATE,STARTSCANDATE,STARTSCANTIME,ENDSCANDATE,ENDSCANTIME,OPERATOR,MAKEDATE,MAKETIME,MODIFYDATE,MODIFYTIME) VALUES ('1116002','02','86',TIMESTAMP '2025-06-01 00:00:00.000000',NULL,TIMESTAMP '2025-06-01 00:00:00.000000','0       ',NULL,NULL,'1',TIMESTAMP '2025-06-07 00:00:00.000000','0       ',TIMESTAMP '2025-06-07 00:00:00.000000','0       ');

--支持不同保单生存金转入万能账户险种
select * from ldcode1 where codetype='transferCont';
--lcpol
select contno from lcpol where prtno='5000118351009475';
select appflag,contno,(select codename from ldcode where codetype='bonusgetmode' and code=a.bonusgetmode) 红利领取方式,(select codename from ldcode where codetype='getlocation' and code=a.getform) 生存金领取方式,riskcode,kindcode,insuredsex,insuredappage,paytodate,cvalidate,enddate,payintv,payendyear,payendyearflag,insuyear,insuyearflag,prem,amnt from lcpol a
where contno='2025070200005096';
--lccont
select appflag,contno,salechnl,selltype,salecom,salechannels,appntsex,appntbirthday,signdate,firstpaydate,cvalidate,customgetpoldate,payintv,paymode,printcount,prem,amnt,sumprem,prtno from lccont a
where contno='2024110400000686';
--lcprem
select contno,dutycode,payplancode,payintv,standprem,prem,sumprem,rate,paytimes,paystartdate,payenddate,paytodate from lcprem a
where contno='2024110400000686';
--lcduty
select contno,dutycode,standprem,payintv,payyears,insuyear,insuyearflag,prem,sumprem,firstpaydate,paytodate,payenddate,payendyear,payendyearflag,cvalidate,enddate from lcduty a
where contno='2024110400000686';
--lcget
select contno,(SELECT riskcode FROM lcpol WHERE contno=a.contno) riskcode,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       (select codename from ldcode where codetype = 'annuitygetmode' and code = (select distinct annuitygetmode from lcduty where contno=a.contno)) 年金领取方式,
       gettodate,
       getstartdate,
       getenddate,LiveGetType,polno,summoney
  from lcget a
 where contno = '2025111800000706';

select a.* from lcget a where contno = '2025090900000986';
select a.* from LMDutyGetClm a where getdutycode='IG0526';

--
select a.* from lcappnt a where contno='2025111000000816';
select a.* from lcappnt a where appntno='1060097018';
select idstdate,idexpdate,a.* from lcappnt a where contno='2025081900001486';
select a.* from lcappnt a where appntname like '%个险投保三九%' order by appntno;
--lcinsured
select idstdate,idexpdate,contno,occupationcode,(select codename from ldcode where codetype='occupationtype' and code=a.occupationtype) 职业类别,insuredno,idtype,idno,relationtoappnt from lcinsured a
where contno='2025061400002896';
select a.* from lcinsured a where contno='2025111700000886';
select * from lcinsured a where insuredno='1001736137' and exists (select 1 from lcpol where contno=a.contno and appflag='1');
select idstdate,idexpdate,a.* from lcinsured a where insuredno='1003236963';
select a.* from lcinsured a where name like '%稳赢恒盈被保%';
--lcaddress
select a.* from lcaddress a where customerno='1004560716';
--短信
select mobile,a.* from lcaddress a where customerno in (select appntno from lcappnt where contno='2024111800000286');
select a.* from sms_dispatch_list a where otherno='2025112000000926';
select a.* from sms_dispatch_list a where SENDTARGET='18255669989' order by makedate desc,maketime desc;
--打印批处理  电子：000310  纸质：000468
select a.* from ldtask a where taskdescribe like '%单证一体化%';
--重复打印删除此表数据
select a.* from lccontprint a where contno='2024050800000266';
--生存金批处理  催付：000029  核销：000030  利息：000102
select a.* from ldtask a where taskdescribe like '%生存金%';
--红利批处理  催付核销：000124  利息：000126
select a.* from ldtask a where taskdescribe like '%红利%';
--贷款结转批处理  000082
select a.* from ldtask a where taskdescribe like '%贷款结转%';
--失效批处理 000194
select a.* from ldtask a where taskdescribe = '失效批处理';
--个险万能月结批处理  000050
select a.* from ldtask a where taskdescribe like '%万能月结批处理%';
--满期批处理
select a.* from ldtask a where taskdescribe like '%满期%';
--大童影像批处理
select a.* from ldtask a where taskdescribe like '%大童影像%';
--账户轨迹
select moneytype,money,paydate,dutycode,getdutycode from lcinsureacctrace a where contno='2024052700000296' order by paydate desc;
--犹豫期天数配置  HESITATEEND=条款中的犹豫期天数+1
select HESITATEEND from LMEdorWT a where riskcode='1111002';
--核心险种规则（新单录入、问题件修改、新单复核）
select a.* from lmriskcheckrule a where riskcode='1033043' and checklocal='FHWB' order by CHECKLOCAL,checksort,REMARK;
select a.* from lmriskcheckrule a where remark like '%交费方式和交费期间不一致%';
select a.* from lmriskcheckrule a where CALCODE in ('FC3366','FC3367','FC3368','FC3369','FC3370','FC3371');
--碎片化险种规则
select a.* from ldcalcheck a where fcheckriskcode='1136003';
select a.* from ldcalcheck a where FCHECKCODE like 'FDSD2809%';
select a.* from ldcalcheck a where FCHECKCODE in ('FDSD2767','FRSR0809','FDSD2768','FRSR0810');
--update ldcalcheck set fcheckriskcode='000000' where fcheckriskcode='000001'
--问题件一键回复完毕
select ISSUECONT,a.* from lcissuepol a where ContNo = '5000111000018606';
/*
update lcissuepol set REPLYMAN='001',REPLYRESULT='1',state='2',replydate=date'2024-03-07',REPLYTIME='09:00:30' where ContNo = '5000118340306021'
*/

--
select a.* from ljspay a where otherno='2025111000000816';
/*
update ljspay set payform='Y' where otherno='2025111300000576'
*/
select a.* from ljspayperson a where contno='2025102700000286';

--
select a.* from loprtmanager a where otherno='2025072400000696' order by makedate,maketime;

select a.* from ljapay a where incomeno='2024102200000186';
select a.* from ljapayperson a where contno='2025070700000316' order by paycount;
--
select a.* from ljsget a where otherno='2025111800000256' order by getdate desc;
select a.* from ljsgetdraw a where contno='2025111800000256' order by getdate;
select (select 3*amnt from lcpol where contno=a.contno) 满期金,(select 0.085*amnt from lcpol where contno=a.contno) 月领养老金,a.* from ljsgetdraw a where contno='2024060400001486' order by getdate desc;

select sendflag,PRTNOTESTATE,a.* from ljaget a where otherno='2025110500000486' order by shoulddate;
select a.* from ljagetdraw a where contno in ('2025111200000296','','','') order by getdate;
select count(*)/12 from ljagetdraw a where contno='2025081300001426' and getdate between date'2025-08-10' and date'2035-07-10';
select a.* from LJAGetEndorse a where/* contno='2024061300004486' and*/ FEEOPERATIONTYPE='LG';

/*
update ljaget a set startgetdate=(select getdate from ljagetdraw where GETNOTICENO=a.GETNOTICENO),shoulddate=(select getdate from ljagetdraw where GETNOTICENO=a.GETNOTICENO),makedate=(select getdate from ljagetdraw where GETNOTICENO=a.GETNOTICENO),modifydate=(select getdate from ljagetdraw where GETNOTICENO=a.GETNOTICENO)
where otherno='2025111700000886' and othernotype='2';--生存金

update ljaget a set shoulddate=(select getdate from LJABonusGet where GETNOTICENO=a.GETNOTICENO),makedate=(select getdate from LJABonusGet where GETNOTICENO=a.GETNOTICENO),modifydate=(select getdate from LJABonusGet where GETNOTICENO=a.GETNOTICENO)
where otherno='2025111700000886' and othernotype='7';--红利

update ljagetdraw set makedate=getdate,modifydate=getdate where contno='2025111700000886'
*/

select a.* from lobonuspol a where contno='2025102600000276' order by FISCALYEAR;
select FEEFINATYPE,GETMONEY,a.* from LJABonusGet a where otherno='2025091700000116' order by makedate,maketime;
/*
update LJABonusGet a set GETDATE=(select SGETDATE from lobonuspol where contno=a.otherno and FISCALYEAR=a.BONUSYEAR),ENTERACCDATE=(select SGETDATE from lobonuspol where contno=a.otherno and FISCALYEAR=a.BONUSYEAR),CONFDATE=(select SGETDATE from lobonuspol where contno=a.otherno and FISCALYEAR=a.BONUSYEAR),MAKEDATE=(select SGETDATE from lobonuspol where contno=a.otherno and FISCALYEAR=a.BONUSYEAR),MODIFYDATE=(select SGETDATE from lobonuspol where contno=a.otherno and FISCALYEAR=a.BONUSYEAR)
where otherno='2025061287407318';
update lobonuspol b set BONUSMAKEDATE=SGETDATE,MAKEDATE=SGETDATE,MODIFYDATE=SGETDATE where contno='2025061287407318';
*/

select a.* from lcinsureacc a where contno='2025072300000316';
select a.* from lcinsureacctrace a where contno='2025110600000306' order by paydate,MODIFYDATE,MODIFYTIME;
select a.* from lcinsureacctrace a where contno='2025111700000886' order by otherno,paydate,makedate,MAKETIME,MONEYTYPE;
select a.* from LCINSUREACCCLASS a where contno='2025072300000316' order by ACCFOUNDDATE,otherno,makedate,MAKETIME;
select a.* from lpinsureacctrace a where contno='2025072300000316' order by paydate,makedate,MAKETIME;
select a.* from lljagetdraw a where contno='2025072300000316' order by getdate,makedate,MAKETIME;
select a.* from LJAGETCLAIM a where contno='2025041500001606' order by getdate,makedate,MAKETIME;
/*
update lcinsureacctrace set makedate=paydate,modifydate=paydate where contno='2025111700000886' and moneytype != 'CXJJ';
update lcinsureacctrace set makedate=paydate+1,modifydate=paydate+1 where contno='2025111700000886' and moneytype = 'CXJJ'
*/
select a.* from LCINSUREACCFEE a where contno='2025072300000316';
select a.* from lcinsureaccfeetrace a where contno='2025081100000266' order by paydate,makedate,MAKETIME;
select a.* from LCINSUREACCCLASSFEE a where contno='2025072300000316';
/*
update lcinsureaccfeetrace set makedate=paydate,modifydate=paydate where contno='2025111700000886'
*/

--
select a.* from LOPRTMANAGER a where OTHERNO='2025031000001496';

--万能月结利息计算方式
select round((power(1+0.03,1/12)-1)*12/365,8)/*将年利率转化为月利率*/*(date'2025-09-25'-date'2025-09-01')*(19315.06-9500-50+0.03) from dual;
--保单当前年度经过的天数
SELECT CASE
         WHEN to_char(sysdate, 'MM-DD') > to_char(cvalidate, 'MM-DD') then
          TO_DATE(TO_CHAR(sysdate, 'YYYY-MM-DD'), 'YYYY-MM-DD') - TO_DATE(TO_CHAR(sysdate, 'YYYY') || TO_CHAR(cvalidate, '-MM-DD'),'YYYY-MM-DD')
         else
          TO_DATE(TO_CHAR(sysdate, 'YYYY-MM-DD'), 'YYYY-MM-DD') - TO_DATE(TO_CHAR(sysdate, 'YYYY') - 1 || TO_CHAR(cvalidate, '-MM-DD'),'YYYY-MM-DD')
       end as days
  from lcpol a
  where contno = '2024012200000226';

--复效
select 6000 * (date '2029-10-01' - date '2025-08-13') * 0.04 / 365 +
       6000 * (date '2029-10-01' - date '2026-08-13') * 0.04 / 365 +
       6000 * (date '2029-10-01' - date '2027-08-13') * 0.04 / 365 +
       6000 * (date '2029-10-01' - date '2028-08-13') * 0.04 / 365
  from dual;

--退保
--t≤PPP，月领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.035,
             (((date '2025-01-01' - date '2024-08-10') - 365) / 365)) +
       greatest(0 - 0, 0)
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2024081200004026'
   and b.dt = 1;

--t≤PPP，月领欠缴保费
select a.prem / 1000 * b.endcv -
       (select sum(getmoney)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2025-08-10' and date '2025-10-01')
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200004026'
   and b.dt = 1;

--t>PPP，月领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney),0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2026-08-10' and date '2027-08-10')
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200004026'
   and b.dt = 2;

--t>PPP，月领未欠缴保费
select (a.prem / 1000 * b.endcv * (date '2027-10-01' - date '2027-08-10') / 366) +
       (a.prem / 1000 * b.begcv *
       (366 - (date '2027-10-01' - date '2027-08-10')) / 366) +
       greatest((a.amnt * 1.8 * 3 -
                (select nvl(sum(getmoney), 0)
                    from ljagetdraw
                   where contno = a.contno
                     and getdate between date '2027-08-10' and date
                   '2027-10-01')),
                0)
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200004026'
   and b.dt = 4;

--t≤PPP，年领未欠缴保费
select a.prem / 1000 * b.endcv *
       power(1 + 0.035,
             (((date '2024-10-01' - date '2024-08-10') - 365) / 365))
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno='2024081200004026'
   and b.dt = 1;

--t≤PPP，年领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2025-08-10' and date '2025-10-01')
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200004026'
   and b.dt = 1;

--t>PPP，年领欠缴保费
select a.prem / 1000 * b.endcv -
       (select nvl(sum(getmoney), 0)
          from ljagetdraw
         where contno = a.contno
           and getdate between date '2026-08-10' and date '2028-10-01')
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200004026'
   and b.dt = 2;

--t>PPP，年领未欠缴保费
select (a.prem / 1000 * b.endcv * (date '2029-10-01' - date '2029-08-10') / 365) +
       (a.prem / 1000 * b.begcv *
       (365 - (date '2029-10-01' - date '2029-08-10')) / 365)
  from lcpol a, cv_1033026 b
 where a.insuredsex = b.gender
   and a.insuredappage = b.age
   and a.payendyear = b.pt
   and a.contno = '2024081200004026'
   and b.dt = 6;