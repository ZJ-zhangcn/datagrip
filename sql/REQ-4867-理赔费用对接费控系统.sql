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
where ClmNo = '3631815101010936';

-- 调查费用基础费用表
select a.*
from llinqbasicfee a
where clmno = '3631815101010936'
  and INQNO = '20260610001';

--调查费用基础费用轨迹表
select a.*
from llinqbasicfeetrace a
where clmno = '3631815101010936'
  and INQNO = '20260610001';

--调查费用拆分表
select a.*
from LLInqBasicFeeDT a
where ClmNo = '3631815101010936';

--费控对接调查费用表
select a.*
from LLInqBasicFeeDJ a
where ClmNo = '3631815101010936';

INSERT INTO LISDATA.ES_DOC_MAIN (DOCID, DOCCODE, BUSSTYPE, SUBTYPE, NUMPAGES, DOCFLAG, DOCREMARK, SCANOPERATOR,
                                 MANAGECOM, INPUTSTATE, OPERATOR, INPUTSTARTDATE, INPUTSTARTTIME, INPUTENDDATE,
                                 INPUTENDTIME, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, VERSION, SCANNO, PRINTCODE,
                                 PKGCODE, SUBTYPESUNCAN, SCANFLAG)
VALUES (19852026, '3631815101010936', 'LP', '36366151', 1, '1', null, '001', '86010101', null, null, null, null, null,
        null, DATE '2025-12-09', '17:10:38', DATE '2025-12-09', '17:10:38', '1', 'LP2025860100001X', '3631815101010936',
        281, 'LP', null);
