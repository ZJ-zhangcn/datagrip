-- id: req-3936
-- 标题: 保盾云接口升级及医联平台优化需求

/*
businesstype ： 1-承保流程，2-理赔
既往医疗风险提示接口：
    alerttype ： 1-风险等级  2-风险标签
    riskmapflag ：'1'
辅助两核调查接口：
    riskmapflag： '2'
理赔真实性验证接口：
    riskmapflag = '3'
tag 为空是没有返回数据
*/

select alerttype, riskmapflag, a.*
  from lcriskmapinfo a
 where policyno = '5000111000018570';

select riskcode,a.* from lcpol a where contno='5000118240725037';

select (select codename
          from ldcode
         where codetype = 'URLTransBDY'
           and comcode = 'M3000') url,
       (select codename
          from ldcode
         where codetype = 'pictureTransBDY'
           and code = 'appSecret') appsecret,
       (select codename
          from ldcode
         where codetype = 'TransBDYkey'
           and code = 'key') key,
       lc.prtno,
       lc.insuredno,
       lc.insuredname,
       lc.insuredsex,
       lc.insuredbirthday,
       lc.insuredidno,
       (select b.mobile
          from lcinsured a, lcaddress b
         where a.contno = lc.contno
           and a.insuredno = lc.insuredno
           and a.insuredno = b.customerno
           and a.addressno = b.addressno) mobile,
       (select code from ldcode where codetype = 'insureProvince') insureprovince
  from lccont lc
 where lc.prtno = '5000118240102022';

select a.* from lacomtoagent a where agentcom='JK00000053';

select a.* from ldcode a where codetype = 'prompt';

select cenddate from lcgrpcont where grpcontno='5000101440108011';

select a.* from ldcode a where codetype like '%kindcode%' and code in ('L','S','A','H');

select a.* from lmriskapp a where kindcode='H' and riskname not like '%团体%' and riskname not like '%附加%';

select kindcode,a.* from lmriskapp a where riskcode=(select riskcode from lcpol where prtno='5000118240102022');

select a.* from es_doc_main a where doccode='5000118240102022' and (subtype='50002166' or subtype='36131151');

select a.* from es_doc_main a where subtype='50002166' order by docid desc;

/*
insert into es_doc_main (docid, doccode, busstype, subtype, numpages, docflag, docremark, scanoperator, managecom, inputstate, operator, inputstartdate, inputstarttime, inputenddate, inputendtime, makedate, maketime, modifydate, modifytime, version, scanno, printcode, pkgcode, subtypesuncan, scanflag)
values (19823240, '5000118240102022', 'TB', '50002166', 1, '1', null, '001', '860101', null, null, null, null, null, null, to_date('03-01-2024', 'dd-mm-yyyy'), '00:00:00', to_date('03-01-2024', 'dd-mm-yyyy'), '00:00:00', '2', 'TB2022860100001X', '5000118240102022', 573, 'GXTB', 'HXLR');
*/
select 1 from es_doc_main a, es_doc_relation b where a.docid = b.docid and a.subtype in('50002166','36131151') and bussno='5000118240102022';

select 1 from es_doc_main a, es_doc_relation b where a.docid = b.docid and a.subtype in('50002166','36131151') and bussno='5000118240102022';

select a.* from es_doc_relation a where subtype='50002166' order by docid desc;

select a.* from es_doc_relation a where doccode='5000118240102022';