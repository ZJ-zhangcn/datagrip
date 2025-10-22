--lccont
select a.salechnl,a.selltype,a.salechannels,a.signdate,a.approvecode,a.prem,a.amnt,a.* from lccont a where prtno='5000112600019093';
--费率表
select 300*5.01+300*0.2*3.1 from dual;
--lcpol
select enddate,a.contno,a.prtno,a.riskcode,a.contplancode,a.amnt,a.prem,a.payyears 交费期间,a.payintv,a.insuyear,a.insuyearflag,insuredappage,a.* from lcpol a
where prtno='5000112600019093';
--地址表
select distinct mobile,email from lcaddress a where customerno=(select appntno from lcappnt where prtno='5000112600005072');

--短信
select a.* from sms_dispatch_list a where sendtarget='17512130001' order by serialno;
--保单打印批处理
select a.* from ldtask a where taskdescribe like '%一体化%';

--退保支持险种
select code1 from ldcode1 where codetype = 'wechatctlimit';

--现金价值
select dt,(begcv*10),a.* from cv_1056018 a where age='40' and PT='1000' and gender='1' order by a.dt;

select a.* from ljspay a where otherno='5001060200018159';

select avg(insuredappage),sum(amnt) from lcpol a where insuredno='1060091592' and riskcode in ('1051002','1056008','1056016','1056019','1056018');

select a.* from lmriskapp a where riskcode='1013004';
select a.* from lmriskapp a where riskperiod='M' order by riskver desc;

select a.* from ldcode a where codetype like '%riskperiod%';

select a.* from lcpol a where riskcode='1066011';

select a.* from lcidCardCheckInfo a where contno='5000112600018171';