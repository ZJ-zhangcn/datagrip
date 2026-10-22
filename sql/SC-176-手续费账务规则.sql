SELECT state, a.*
FROM FMCalculatePrem a
WHERE contno in ('2030010100000376', '');

SELECT a.*
FROM ldcode a
WHERE codetype = 'SXFCostCenter';

SELECT (select codename from ldcode where codetype = 'SXFCostCenter' and code = a.branchtype) 渠道,
       case
           when state = '6' then '已审核'
           when state = '7' then '加扣款已审核'
           when state = '9' then '已结算'
           when state = '10' then '加扣款已结算'
           when state = '0' then '空'
           when state = '2' then '加扣款'
           when state = '3' then '待审核'
           when state = '4' then '加扣款待审核'
           when state = '12' then '审核不通过'
           when state = '14' then '待结算'
           else '其他状态' end                                                                状态,
       auditdate                                                                              结算审核日期,
       transtype,
       a.*
FROM FMCalculatePrem a
WHERE contno = '2024012200000596';

SELECT a.*
FROM FMCalculatePrem a
WHERE contno = '2019052100000696';

/*
update FMCalculatePrem
set state='2',
    auditdate=null
where contno = '2020052900000366';
*/

SELECT (select codename from ldcode where codetype = 'SXFCostCenter' and code = a.branchtype) 渠道,
       case
           when state = '6' then '已审核'
           when state = '7' then '加扣款已审核'
           when state = '9' then '已结算'
           when state = '10' then '加扣款已结算'
           when state = '0' then '空'
           when state = '2' then '加扣款'
           when state = '3' then '待审核'
           when state = '4' then '加扣款待审核'
           when state = '12' then '审核不通过'
           when state = '14' then '待结算'
           else '其他状态' end                                                                状态,
       auditdate                                                                              结算审核日期,
       a.*
FROM FMCalculatePrem a
WHERE grpcontno = '2022073000000916';
