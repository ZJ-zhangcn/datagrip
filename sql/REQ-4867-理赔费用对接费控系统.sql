/*
5000118251009368
5000118251009375
5000118251009382
101  8
*/
select contno, a.*
from lcpol a
where prtno in ('5000118251009368', '5000118251009375', '5000118251009382')
order by prtno;

select /*inqstate, */a.*
from llinqapply a
where ClmNo = '3631815101095847';

-- 调查费用基础费用表
select a.*
from llinqbasicfee a
where clmno = '3631815101095847'
  and INQNO = '20260210001';

--调查费用基础费用轨迹表
select a.*
from llinqbasicfeetrace a
where clmno = '3631815101095847'
  and INQNO = '20260210001';

--调查费用拆分表
select a.*
from LLInqBasicFeeDT a
where ClmNo = '3631815101095847';

--费控对接调查费用表
select a.*
from LLInqBasicFeeDJ a
where ClmNo = '3631815101095847';

select LEAVINGMONEY,appflag,a.bonusgetmode,(select codename from ldcode where codetype='bonusgetmode' and code=a.bonusgetmode) 红利领取方式,a.getform,(select codename from ldcode where codetype='getlocation' and code=a.getform) 生存金领取方式,riskcode,(select riskname from lmriskapp where riskcode=a.riskcode) riskname,contno,prtno,polno,signdate,cvalidate,payintv,paytodate,payenddate,enddate,amnt,prem,payendyear,insuyear,INSUYEARFLAG,a.* from lcpol a
where INSUREDNO = '1001736221';


Select count(*)
from es_doc_main a,
     es_doc_relation b
where '1768454490000' = '1768454490000'
  and a.docid = b.docid
  and a.busstype = 'LP'
  and a.subtype = b.subtype
  and a.subtype = '36366151'
  and b.doccode = '3631815101095847';

select a.*
from LIS.ES_DOC_MAIN a
where DOCCODE = '3631815101095847';

INSERT INTO ES_DOC_MAIN (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR,
                         MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE,
                         INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE,
                         PKGCODE, SUBTYPESUNCAN, SCANFLAG)
VALUES (19852026, '3631815101095847', 'LP', '36366151', 1, '1', null, '001', '86010101', null, null, null, null, null,
        null, DATE '2025-12-09', '17:10:38', DATE '2025-12-09', '17:10:38', '1', 'LP2025860100001X', '3631815101095847',
        281, 'LP', null);

select a.*
from es_doc_relation a
where SUBTYPE = '36366151';

INSERT INTO LIS.ES_DOC_RELATION (DOCID, BUSSNOTYPE, BUSSNO, DOCCODE, BUSSTYPE, SUBTYPE, RELAFLAG)
VALUES (19852026, '21', '3631815101095847', '3631815101095847', 'LP', '36366151', '0');
