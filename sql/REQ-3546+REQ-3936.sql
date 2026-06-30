-- id: req-3546+req-3936
-- 标题: 保盾云

--h：健康险  s：重疾险  r：年金险
select a.* from ldcode a where codetype like '%kindcode%';

select kindcode,a.* from lmriskapp a where riskcode='1056018';

select riskcode,appflag,a.* from lcpol a where contno='5001050200000043';

--5000112600004665

select salechnl,selltype,salechannels,a.* from lccont a where contno='5001050200000043';

select 737.41*10*power((1+0.0435),(119-366)/366) from dual;

select a.* from lcget a where contno='5000118340202013' and rownum<2;

select a.* from lcpicturetransbdy a where a.bdyserialno='8f6655ce-5021-451d-a363-6894ab56260a';

select a.* from lcpicturetransbdy a where contno = '5000118340620017' order by makedate desc,maketime desc;

select a.* from lcpicturetransbdy a where insuredno='1060093613';

select a.* from lcpicturetransbdy a where spareflag1='M3000' order by polapplydate desc;

select a.* from lcinsured a where insuredno='1001734974';

select a.* from lcmedicalcluesbdy a where contno = '5000118340620017';

/*
insert into lcmedicalcluesbdy (serialno, contno, idno, customerno, riskscore, medicaldataexist, underwriting, chargetype, medicalversion, icdtype, occurrencetime, risk1, risk2, risk3, risklable, managecom, querytime, operator, makedate, maketime, modifydate, modifytime, errorreason, bdyserialno)
values ('00000000000000000006', '5000118240523017', '15212320060110005X', '1001734972', '147.43', '1', null, '1', 'V1', 'A1,A2,A3', '2020年3月-2020年6月', '解放军第253医院-99%', '中国人民解放军第463医院-91%', '沈阳医学院第二附属医院-13%', 'C', '86010101', '2024-05-15 10:23:50', 'AUTO', to_date('03-09-2024', 'dd-mm-yyyy'), '01:00:40', to_date('03-09-2024', 'dd-mm-yyyy'), '01:00:40', '传染类和寄生虫类疾病-轻度,传染类和寄生虫类疾病-中度,传染类和寄生虫类疾病-重度', '6d08602b-7a9b-4cae-a8eb-090f62059a46');
*/
select b.managecom, b.appntidno, b.insuredidno,a.contno,a.insuredno,a.appntno from lcpicturetransbdy a,lccont b where a.contno = b.contno and a.bdyserialno = '6d08602b-7a9b-4cae-a8eb-090f62059a46' order by a.modifydate,a.modifytime desc;

select a.* from lcmedicalcluesbdy a where contno = '5000118240523017';

select * from lcbaodyconfigure where businesstype in ('1', '2') and riskcode='1056018';

select salechannels,a.* from lccont a where contno='5001050200000041';

select * from ldcode where codetype = 'bfyswitch';

select a.* from lcget a where contno='5000118340620017';

select a.* from ldcode1 a where codetype='freeduty' and code='ID0303';

/*
insert into ldcode1 (codetype, code, code1, codename, codealias, comcode, othersign)
values ('freeduty', 'ID0303', '1', '豁免对象', '豁免责任配置', null, null);
*/
select comcode from ldcode where codetype = 'bfyswitch' and code = '0';