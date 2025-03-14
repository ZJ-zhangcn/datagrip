--利息
----利率配置0.025，扣除初始费用之后账户价值为58298.53元，结息情况如下：
------例10月1日结息：
Select round((power(1+0.03,1/12)-1)*12/365,8)/*将年利率0.03转化为日利率*/*(date'2030-03-11'-date'2030-03-01')*11236.69/*账户价值*/ from dual;


SELECT 0.00005430*(date'2025-12-01'-date'2025-11-01')*97585.86/*账户价值*/ from dual;--158.96736594
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2025-11-02'-date'2025-11-01')*(183300.25-100000-5000+4.37)/*账户价值*/+round((power(1+0.03,1/12)-1)*12/365,8)*(date'2025-12-01'-date'2025-11-02')*(183300.25) from dual;--158.96736594
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2025-12-01'-date'2025-11-01')*(97804.16) FROM dual--237.898838784
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2025-12-01'-date'2025-11-02')*(0.46) from dual;--0
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2025-12-01'-date'2025-11-02')*(-10000.0) from dual;---23.51


SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2025-11-01'-date'2025-10-01')*(195255.18) from dual;--1.18
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2025-12-01'-date'2025-11-01')*(100000.0) from dual;--235.13
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2025-12-01'-date'2025-11-01')*(-5000) from dual;---11.76
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2025-12-01'-date'2025-11-01')*(-4.37) from dual;---0.01

SELECT 237.898838784+0.0010816072-23.5132+1.2162+243.24-12.162-0.010629588 FROM dual

SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2026-01-01'-date'2025-12-01')*(9805.15) from dual;--24.645048422
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2026-01-01'-date'2025-12-12')*(10000) from dual;--16.216
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2026-01-01'-date'2025-12-12')*(-0.37) from dual;---0.000599992
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2026-01-01'-date'2025-12-12')*(-500) from dual;---0.8108
SELECT round((power(1+0.03,1/12)-1)*12/365,8)*(date'2026-01-01'-date'2025-12-12')*(50) from dual;--0.08108
SELECT 24.645048422+16.216-0.000599992-0.8108+0.08108 FROM dual
--风险保费=死亡风险保额/1000*到达年龄时的风险保费费率/365*月结当月总天数
/*
死亡风险保额：有效保额（被保险人因疾病和意外等身故时，我们支付的身故保险金额）-保单账户价值
到达年龄：投保年龄+保单年度数-1
*/

select appflag,(select codename from ldcode where codetype='bonusgetmode' and code=a.bonusgetmode) 红利领取方式,(select codename from ldcode where codetype='getlocation' and code=a.getform) 生存金领取方式,(select riskname from lmriskapp where riskcode=a.riskcode) riskname,contno,prtno,riskcode,signdate,cvalidate,enddate,paytodate,payenddate,payintv,amnt,prem,payendyear,insuyear,a.* from lcpol a
where contno in ('','','','','','2024102200000186') order by a.contno

select a.* from lobonusfactor a where riskcode='1103006'

SELECT ROUND((SUM(MONEY)+482.02)*(1.4-1)/1000*1.4/365*(DATE'2026-02-01'-DATE'2026-01-01'), 2) FROM LCINSUREACCTRACE WHERE CONTNO='2024102900000566' AND paydate<=DATE'2025-12-01'

SELECT SUM(MONEY) FROM LCINSUREACCTRACE WHERE CONTNO='2024102200000186' AND paydate<=DATE'2025-10-01'
SELECT * FROM LCINSUREACCTRACE WHERE CONTNO='2024102800000286' AND paydate=DATE'2025-12-01'

SELECT ROUND((195255.18+490.77)*0.6/1000*1.2/365*(date'2025-12-01'-date'2025-11-01'),2) FROM dual
SELECT ROUND(88019.01*0.4/1000*1.4/365*(date'2026-01-01'-date'2025-12-01'),2) FROM dual

SELECT 193314.96+0.06-2000 FROM dual

SELECT ROUND(9500*0.6/1000*1.2/365*(date'2026-01-01'-date'2025-12-12'),2) FROM dual