-- id: req-4641
-- 标题: 福多多+增利宝2025——核心系统需求

select a.* from lcinsureacc a where contno='2025022800000366'

select a.* from lis.lcinsureacctrace a where contno='2025022800000366' order by paydate,makedate,maketime;

select a.* from lcinsureaccclass a where contno='2025022800000366'

select a.* from lcinsureaccfee a where contno='2025022800000366'

select a.* from lcinsureaccfeetrace a where contno='2025022800000366' order by paydate,makedate,maketime;

select a.* from lcinsureaccclassfee a where contno='2025022800000366'


--利息
select round((power(1+0.03,1/12)-1)*12/365,8)/*将年利率0.025转化为日利率*/*((date'2025-05-01'-date'2025-04-01')+0)*97251.67/*账户价值*/ from dual;

--风险保费
select round((100000*1.6-(sum(money)+237.72))/1000*0.5/365*(date'2025-08-01'-date'2025-07-01'), 2) from lcinsureacctrace where contno='2025022800000366' and paydate<date'2025-07-01'

--现价
select sum(money) from lcinsureacctrace a where contno='2025022800000366'--166688.89

select round((power(1+0.03,1/12)-1)*12/365,8)*((date'2032-03-15'-date'2032-03-01')+1)*sum(money) from lcinsureacctrace a where contno='2025022800000366'--202.727028018

select 0.62*(date'2032-04-01'-date'2032-03-15')/31 from dual--0.34

select round(166688.89+202.727028018+0.34,2) from dual;