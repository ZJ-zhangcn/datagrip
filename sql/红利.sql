-- 概念：
-- 分红险：保险公司在每个会计年度结束后，将上一会计年度该类分红保险的可分配盈余，按一定的比例、
-- 以现金红利或增值红利的方式，分配给客户的一种人寿保险
-- 有效的红利保单每天都会跑这个批处理，系统会进一步判断，满一周年才会分红，正常都是在周年日第二天分红。一年分红一次;
-- 第二保单年度要续期后才能催付，否则不能催付，上海人寿，保单周年日才能催付
-- 上海人寿：某保单年度红利=保费/1000*年度红利分配比例（K）×该保单本保单年度红利因子（Afactor）
select b.prem / 1000 * c.bonusrate * a.bonusfactor
  from lobonusfactor a, lcpol b, BonusRate c
 where a.riskcode = b.riskcode
   and b.riskcode = c.riskcode
   and a.insuredsex = b.insuredsex
   and a.payendyear = b.payendyear
   and a.insuyear = b.insuyear
   and a.insuredappage = b.insuredappage
   and a.riskcode = '1103007'
   and a.polyear between 1 and 6
   and a.bonusgrade = 'H'
   and b.paytodate + a.polyear - 1 between c.cvalidate and c.enddate
   and b.contno = '2024032900000166'
 order by polyear;
-- 红利催付核销→分红通知书打印→红利累积生息
-- 满期终止后，可做红利催付核销-累积生息-红利领取，若最后一期红利未结息，红利领取的时候需要结息
SELECT  round([利率]/[计息天数],8 ) * [计息天数] *[本金] FROM dual;---红利利息计算公式
SELECT  round(0.03/365,8 ) * 365*569.59 FROM dual;
SELECT round(0.03 / 730, 8) * 730 * 149.04 +
       round(0.03 / 365, 8) * 365 * 320.55
  from dual;
-- 相关表结构
select * from lisdata.ldcode where codetype='bonusgetmode';
---红利领取方式定义
select code from ldcode where codetype = 'bqbonusgetmode' and comcode = '1103007';
select * from LMRiskParamsDef where paramstype='bonusgetmode' and riskcode='1103005';
select * from lmriskapp where bonusflag='1' and risktype3='2';
-- 支持分红的产品(1  传统险2  分红3  投连4  万能5  其他)I--个人险、Y--银代险
select * from Lmriskbonus where riskcode='1103004';
-- 1103004
select * from Lobonusrate;
----红利利率定义表(上海人寿)
select * from BonusRate t where t.riskcode='1103007'; --年度红利分配比例（K）
select * from lobonusfactor t where riskcode = '1103007' and t.insuredsex='0' and t.insuyear='6' and t.payendyear='3' and t.insuredappage='24'; ---红利因子
 select * from lobonusfactor t where riskcode = '1103002' and t.insuredsex='0' and t.insuyear='6' and t.payendyear='3' and t.insuredappage='27';---红利因子(测试手动配置)
 select t.insuredsex,t.insuyear,t.payendyear,t.* from lcpol t where t.contno='2023112900000586';
select t.insuredbirthday,t.cvalidate,t.* from lccont t where contno='2023112900000586';
-- 维护红利因子	1.红利利息可以随便填；2.被保人年龄要填投保时的年龄；3.年份填要维护的年龄因子；
-- 4.缴多久的保费；5.duration填1表示一个保单第一个红利利息，如果第二次跑红利批处理，就需要改为2（如累积生息）

select * from Ldbankrate;
---累计生息利率
select * from lcpol where bonusgetmode='4';
---红利领取方式
select * from Bonus_ENGP;---分红费率（建信）
select * from lcinsureacc where contno='2025071200000786';
select * from lcinsureaccclass where contno='2025071200000786';
select * from lcinsureacctrace  where contno='2025071200000786';
select * from lisdata.ldcode where codetype like '%finfeetype%';

0.03  1102000000.00
---红利的计算	红利=本金+利息
	-- 红利本金=(保额/1000)*红利因子    利息=（存款天数/365）*本金
	-- 计算天数：select date'2016-7-30'-date'2016-5-30' from dual;    eg:(218/365*0.0225+146/365*0.03)*400=0.0135
	-- 注意：利率是分为两部分的，以1月1日为界；查询红利要依据保额和保费
-- 跑完红利批处理核对数据
select * from LOBonusPol where contno='2023112900000586'
and FisCalYear ='2016'; ---保单红利表,会计年度，催付后生成(AGetDate,bonusmoney,bonusinterest,bonusflag,bonusgetmode,)
select * from LJABonusGet where otherno='2023112900000586';
---红利给付实付（资金返盘后置上回盘日期confdate）
select * from LDEdorUser d where UserCode = '001' and UserType = '1';---保全员信息
select * from lcinsureacc where acctype = '004';------004代表是红利账户
select * from lcinsureacctrace at where at.contno='2023112900000586';
---保险帐户表记价履历表
select * from ldcode where codetype = 'companysumbonus';
----分红业务红利分配额度
select * from ldcode where codetype = 'appntsumbonus';
----分配给投保人的红利总额

select t.FisCalYear,t.divrate,t.publicdate,t.* from LOBonusPolRate t where riskcode='000000';
---累计生息时的红利利率表
select * from lcinsureacc where acctype = '004';------004代表是红利账户
---（001 -- 集体公共账户002 -- 个人缴费账户003 -- 个人累积生息账户004 -- 个人红利账户）




---王永总结（注：王永的新契约流程是银保通的流程级到打印保单，后面分红的流程是一样的，还有他是进行了两个年度的分红）
  -- 红利领取变更  
  -- 一、累积生息正常流程：实时投保（领取方式选择2累积生息）-新单确认-打印保单-更改时间到周年日第二天-维护红利因子-跑分红批处理（跑成功后到lobonuspol表中，查看分配的红利是否正确）-分红正确之后，（第二年度分红）改时间到周年日前，进行续期抽档-抽完档之后，改时间到周年日的第二天，跑分红批处理
  
  -- 二、累积生息变更现金流程：实时投保（领取方式选择2累积生息）-新单确认-打印保单-更改时间到周年日第二天-维护红利因子-跑分红批处理（跑成功后到lobonuspol表中，查看分配的红利是否正确）-分红正确之后，改时间到周年日前，进行续期抽档-抽完档之后，变更红利领取方式（注：变更也可以在续期抽档之前）--改时间到周年日的第二天，跑分红批处理
  
  -- 三、现金流程和累积生息一致
  
  -- 续期抽档的流程  实时投保--新单确认--签单--续期抽档（单笔抽件，成功后应付表能查到）--查询缴纳保费和确认缴纳保费（成功后，暂收表能查到）--做对账交易（确认缴纳保费）--对账成功后，去核销（续收管理-正常交易，成功后，实收表里边就能查到）
	-- 相关查询的SQL语句：
	select * from lis.ljspay y where y.otherno='290000305680';  --应收表，在抽件后
select * from lis.ljapay y where y.otherno='290000305680';   --实付表，核销后便可查询
select * from lis.ljtempfee f where f.otherno='290000305680';  --确认后，暂收费
	-- 注意：要注意paytodate的值，续期成功后，其值会变成下一年需要缴费的日期
	
  
          
	
 -- 跑分红批处理中遇到的问题：
 	-- 1.分红周年日小于结算日；解决：修改跑分红批处理的时间，将其退后到八月分。如不行，其主要原因是由于红利因子维护的时候，填写有误，需修改
	-- 2.跑完批处理后，虽然显示成功，但是其核心页面却显示未成功，并且状态为启动。解决：重新停止引擎和启动
	-- 3.跑完批处理后，虽然显示成功，但是后台日志显示为进入核心；解决：重新停止引擎和启动
	
	

	
	-- 核心进行红利变更：	1.实时投保-2.新单确认-3.打印保单-4.核心进行保全处理，做完无扫描录入，能够看到领取方式变更后，清退了多少钱大银保变更：	1.实时投保-2.新单确认-3.打印保单-4.修改保单重要信息     变更后要核心变更后，清退的钱一致

-- 如果要回滚红利数据，删除这两个表即可
select * from LJABonusGet where otherno='2024071900000256';
select * from lobonuspol where contno='2024071900000256';

-----核心提取要分红的筛选条件
select *
  from lis.lcpol p
 where appflag = '1'
   and ManageCom like '86%'
   and exists (select riskcode
          from lmriskapp a
         where a.bonusflag = '1'
           and risktype3 = '2'
           and riskcode = p.riskcode)----分红险
   and not exists (select 1
          from LPEdorItem
         where ContNo = p.ContNo
           and edortype = 'PU'
           and edorstate = '0')---没做减额缴清
   and not exists (select 1
          from lccontstate
         where contno = p.ContNo
           and StateType = 'RPU'
           and State = '1'
           and enddate is null)----不能是减额缴清状态
   and not exists (select 1
          from lccontstate b
         where polno = p.polno
           and b.statetype = 'Available'
           and b.state = '1'
           and enddate is null
           and startdate <
               ((select max(bonusmakedate)
                   from lis.lobonuspol
                  where contno = p.ContNo) + interval '1' year))----当前分红年度保单有效
   and not exists(select 1
          from lcconthangupstate
         where contno = p.contno
           and posflag = '1')-----保单未挂起（保全、理赔）
   and ((to_date('" + sCountDate +"') - cvalidate) / 365 -
       (select count(*) from lobonuspol where polno = p.polno) >= 1);----当前年度尚未分红;
