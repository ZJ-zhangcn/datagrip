/*
businessType ： 1-承保流程，2-理赔
既往医疗风险提示接口：
    alertType ： 1-风险等级  2-风险标签
    RiskMapFlag ：'1'
辅助两核调查接口：
    RiskMapFlag： '2'
理赔真实性验证接口：
    RiskMapFlag = '3' 
tag 为空是没有返回数据
*/

SELECT alertType, RiskMapFlag, a.*
  FROM lcRiskMapInfo a
 where PolicyNo = '5000111000018570';
select riskcode,a.* from lcpol a where contno='5000118240725037';

select (select CODENAME
          from ldcode
         where CODETYPE = 'URLTransBDY'
           and COMCODE = 'M3000') url,
       (select CODENAME
          from ldcode
         where CODETYPE = 'pictureTransBDY'
           and code = 'appSecret') appSecret,
       (select codeName
          from ldcode
         where CODETYPE = 'TransBDYkey'
           and code = 'key') key,
       lc.prtno,
       lc.insuredNo,
       lc.insuredname,
       lc.insuredsex,
       lc.insuredbirthday,
       lc.insuredidno,
       (select b.mobile
          from lcinsured a, lcaddress b
         where a.contno = lc.contno
           and a.insuredno = lc.insuredNo
           and a.insuredno = b.customerno
           and a.addressno = b.addressno) mobile,
       (select CODE from ldcode where CODETYPE = 'insureProvince') insureProvince
  from lccont lc
 where lc.prtno = '5000118240102022';

select a.* from lacomtoagent a where agentcom='JK00000053';

select a.* from ldcode a where codetype = 'prompt';

select CEndDate from lcgrpcont where grpcontno='5000101440108011';

select a.* from ldcode a where codetype like '%kindcode%' and code in ('L','S','A','H');

select a.* from lmriskapp a where kindcode='H' and riskname not like '%团体%' and riskname not like '%附加%';

select kindcode,a.* from lmriskapp a where riskcode=(select riskcode from lcpol where prtno='5000118240102022');

select a.* from es_doc_main a where doccode='5000118240102022' and (subtype='50002166' or subtype='36131151');

select a.* from es_doc_main a where subtype='50002166' order by docid desc;

insert into es_doc_main (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR, MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE, INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE, PKGCODE, SUBTYPESUNCAN, SCANFLAG)
values (19823240, '5000118240102022', 'TB', '50002166', 1, '1', null, '001', '860101', null, null, null, null, null, null, to_date('03-01-2024', 'dd-mm-yyyy'), '00:00:00', to_date('03-01-2024', 'dd-mm-yyyy'), '00:00:00', '2', 'TB2022860100001X', '5000118240102022', 573, 'GXTB', 'HXLR');
SELECT 1 from es_doc_main a, es_doc_relation b where a.docid = b.docid and a.subtype in('50002166','36131151') and bussno='5000118240102022';
SELECT 1 from es_doc_main a, es_doc_relation b where a.docid = b.docid and a.subtype in('50002166','36131151') and bussno='5000118240102022';
select a.* from es_doc_relation a where subtype='50002166' order by docid desc;

select a.* from es_doc_relation a where doccode='5000118240102022';