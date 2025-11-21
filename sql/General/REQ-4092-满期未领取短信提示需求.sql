/*
批处理名称：满期金长期未领取提示功能
批处理类：MQUnclaimedSMSTask
参数：ContNo

含满期金的保单，批处理执行日期-保单满期日大于等于30，且未领取满期金，则生成该保单满期金未领取提示短信。
未领取满期金包括几下几种情况：
	a、满期金未产生
	b、满期金已产生，领取方式为自动转账，未到账
	c、满期金已产生，领取方式为累积生息，未申请生存给付
	d、满期金已产生，领取方式为累积生息，申请生存给付未到账

短信编码：Ma1034
短信模板：尊敬的【投/被保人姓名】[先生/女士]，您好!您购买的【险种名称】保单号【保单号】已满期终止，请及时办理满期领取，若您已申请请关注近期支付到账情况。有问题可咨询我公司客服热线4009118118，祝您阖家幸福！
*/

select enddate,(select codename from ldcode where codetype='getlocation' and code=a.getform) 生存金领取方式,a.* from lcpol a where contno='2023053100003956'

select appflag,enddate,a.* from lcpol a where contno='2023053100003956'

select a.* from lccontstate a where contno='2023053100003956'

select a.* from SMS_DISPATCH_LIST a where otherno='2024041100000186'

select contno,
       dutycode,
       getdutycode,
       (select getdutyname from lmdutygetalive where getdutycode = a.getdutycode and getdutykind = a.getdutykind union select distinct getdutyname from lmdutygetclm where getdutycode = a.getdutycode) getdutyname,
       --(select codename from ldcode where codetype = 'bqannuitygetmode' and code = (select annuitygetmode from lcduty where contno=a.contno)) 生存金领取方式,
       gettodate,
       getstartdate,
       getenddate
  from lcget a
 where contno = '2024041100000186'

select a.* from ljsgetdraw a where contno='2024041100000186'
select a.* from ljaget a where otherno='2024032900000526'
select a.* from ljagetdraw a where contno='2024041100000186'
select moneytype,a.* from lcinsureacctrace a where contno='2024041100000186' order by paydate desc,a.moneytype;
select a.* from loprtmanager a where otherno='2024041100000186'

select a.* from lmriskapp a where riskname like '%盛世安鑫%'

select a.* from lcaddress a where mobile='17503290008'

select a.* from ljaget a where otherno='2024011900000456';
select a.* from ljagetdraw a where contno='2024011900000456';