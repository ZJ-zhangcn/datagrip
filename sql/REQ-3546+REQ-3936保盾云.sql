--H：健康险  S：重疾险  R：年金险
select a.* from ldcode a where codetype like '%kindcode%';
select kindcode,a.* from lmriskapp a where riskcode='1056018';
select riskcode,appflag,a.* from lcpol a where contno='5001050200000043';
--5000112600004665

select salechnl,selltype,salechannels,a.* from lccont a where contno='5001050200000043';
select 737.41*10*power((1+0.0435),(119-366)/366) from dual;

select a.* from lcget a where contno='5000118340202013' and rownum<2;
select a.* from LCPictureTransBDY a where a.bdyserialno='8f6655ce-5021-451d-a363-6894ab56260a';
select a.* from LCPictureTransBDY a where Contno = '5000118340620017' order by makedate desc,maketime desc;
select a.* from LCPictureTransBDY a where insuredno='1060093613';
select a.* from LCPictureTransBDY a where SPAREFLAG1='M3000' order by POLAPPLYDATE desc;
select a.* from lcinsured a where insuredno='1001734974';
select a.* from LCMedicalCluesBDY a where Contno = '5000118340620017';
insert into LCMedicalCluesBDY (SERIALNO, CONTNO, IDNO, CUSTOMERNO, RISKSCORE, MEDICALDATAEXIST, UNDERWRITING, CHARGETYPE, MEDICALVERSION, ICDTYPE, OCCURRENCETIME, RISK1, RISK2, RISK3, RISKLABLE, MANAGECOM, QUERYTIME, OPERATOR, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, ERRORREASON, BDYSERIALNO)
values ('00000000000000000006', '5000118240523017', '15212320060110005X', '1001734972', '147.43', '1', null, '1', 'V1', 'A1,A2,A3', '2020年3月-2020年6月', '解放军第253医院-99%', '中国人民解放军第463医院-91%', '沈阳医学院第二附属医院-13%', 'C', '86010101', '2024-05-15 10:23:50', 'AUTO', to_date('03-09-2024', 'dd-mm-yyyy'), '01:00:40', to_date('03-09-2024', 'dd-mm-yyyy'), '01:00:40', '传染类和寄生虫类疾病-轻度,传染类和寄生虫类疾病-中度,传染类和寄生虫类疾病-重度', '6d08602b-7a9b-4cae-a8eb-090f62059a46');
select b.managecom, b.AppntIDNo, b.InsuredIDNo,a.contno,a.InsuredNo,a.AppntNo from LCPictureTransBDY a,lccont b where a.contno = b.contno and a.bdySERIALNO = '6d08602b-7a9b-4cae-a8eb-090f62059a46' order by a.modifydate,a.modifytime desc;
select a.* from lcmedicalcluesbdy a where Contno = '5000118240523017';
select * from LCBaoDYConfigure where BusinessType in ('1', '2') and riskcode='1056018';
select salechannels,a.* from lccont a where contno='5001050200000041';
select * from ldcode where codetype = 'bfyswitch';
select a.* from lcget a where contno='5000118340620017';
select a.* from ldcode1 a where codetype='freeduty' and code='ID0303';
insert into ldcode1 (CODETYPE, CODE, CODE1, CODENAME, CODEALIAS, COMCODE, OTHERSIGN)
values ('freeduty', 'ID0303', '1', '豁免对象', '豁免责任配置', null, null);
select COMCODE from ldcode where codetype = 'bfyswitch' and code = '0';