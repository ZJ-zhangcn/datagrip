--纳税人信息表（客户层）
SELECT a.*
FROM LCTaxPayer a
WHERE CustomerNo in (SELECT AppntNo FROM LCCont WHERE ContNo = '2026091000000606')
   or CustomerNo in (SELECT INSUREDNO FROM LCCont WHERE ContNo = '2026091000000606')
order by CUSTOMERNO;
--纳税人信息表（保单层）
SELECT a.*
FROM LCContTaxPayer a
WHERE CONTNO = '2026091000000606';
--纳税人地址表
SELECT CustomerNo, Type, Language, Province, City, Address
FROM LCTaxAddress
WHERE CustomerNo in (SELECT AppntNo FROM LCCont WHERE ContNo = '2026091000000606')
   or CustomerNo in (SELECT INSUREDNO FROM LCCont WHERE ContNo = '2026091000000606')
order by CUSTOMERNO;
--纳税人居民国信息表
SELECT CustomerNo, TaxAddress, TaxNo, NoTaxReasonCode, NoTaxReasonRemark
FROM LCDepTaxPayer
WHERE CustomerNo in (SELECT AppntNo FROM LCCont WHERE ContNo = '2026091000000606')
   or CustomerNo in (SELECT INSUREDNO FROM LCCont WHERE ContNo = '2026091000000606')
order by CUSTOMERNO;

