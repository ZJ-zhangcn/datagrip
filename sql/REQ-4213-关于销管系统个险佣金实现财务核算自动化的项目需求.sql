select A1                    佣金所属年月,
       x27 + x34 + x37 + x38 实发金额,
       A2                    代理人编码,
       x1                    审批通过日期,
       x2                    初年度佣金,
       x3                    续年度佣金,
       x4                    优质续保奖,
       x5                    月度业绩奖,
       x6                    年度业绩奖,
       x7                    增员奖,
       x8                    预备组出单人力津贴,
       x9                    直辖组出单人力津贴,
       x10                   直辖部有效人力津贴,
       x11                   直辖区域有效人力津贴,
       x12                   职务津贴,
       x13                   组育成津贴,
       x14                   组育成奖,
       x15                   直辖组管理奖,
       x16                   所辖部管理奖,
       x17                   所辖区域管理奖,
       x18                   直辖组季度奖,
       x19                   直辖部季度奖,
       x20                   直辖区域季度奖,
       x21                   基本法加扣款,
       x22                   长期服务奖,
       x23                   保险保障合并计税项,
       x24                   方案加扣款竞赛奖励,
       x25                   方案加扣款竞赛计税合并计税项,
       x26                   其他加扣款,
       x27                   税前合计,
       x28                   增值税,
       x29                   城建税,
       x30                   教育费附加,
       x31                   地方教育费附加,
       x32                   其他增值税及附加,
       x33                   个人所得税,
       x34                   以上税后项目合计,
       x35                   税后扣款保险保障合并计税项,
       x36                   税后扣款竞赛计税合并计税项,
       x37                   以上税后扣款合计,
       x38                   上月结转累计
from (select a.indexcalno                                                                  A1,
             a.agentcode                                                                   A2,
             a.MODIFYDATE                                                                  x1,
             nvl(a.F04, 0)                                                                 x2,
             nvl(a.F05, 0)                                                                 x3,
             nvl(a.F37, 0)                                                                 x4,
             nvl(a.k01, 0)                                                                 x5,
             nvl(a.k02, 0)                                                                 x6,
             nvl(a.F09, 0)                                                                 x7,
             nvl(a.k03, 0)                                                                 x8,
             nvl(a.k04, 0)                                                                 x9,
             nvl(a.k09, 0)                                                                 x10,
             nvl(a.k12, 0)                                                                 x11,
             nvl(a.F11, 0)                                                                 x12,
             nvl(a.k07, 0)                                                                 x13,
             nvl(a.k08, 0)                                                                 x14,
             nvl(a.k05, 0)                                                                 x15,
             nvl(a.k10, 0)                                                                 x16,
             nvl(a.k13, 0)                                                                 x17,
             nvl(a.k06, 0)                                                                 x18,
             nvl(a.k11, 0)                                                                 x19,
             nvl(a.k14, 0)                                                                 x20,
             nvl(a.F44, 0)                                                                 x21,
             nvl(a.F33, 0)                                                                 x22,
             nvl(a.F42, 0)                                                                 x23,
             nvl(a.F16, 0)                                                                 x24,
             nvl(a.F17, 0)                                                                 x25,
             '0'                                                                           x26,
             nvl(a.F40, 0) + nvl(a.F44, 0) + nvl(a.F17, 0) + nvl(a.F16, 0) + nvl(a.F42, 0) x27,
             nvl((select (addedtax + citytax + EducationSurtax +
                          LocalEducationSurtax + OtherLocalTaxation)
                  from SalaryCommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x28,
             nvl((select citytax
                  from SalaryCommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x29,
             nvl((select EducationSurtax
                  from SalaryCommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x30,
             nvl((select LocalEducationSurtax
                  from SalaryCommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x31,
             '0'                                                                           x32,
             nvl((select PersonalTax
                  from SalaryCommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x33,
             (nvl((select (addedtax + citytax + EducationSurtax + LocalEducationSurtax + OtherLocalTaxation)
                   from SalaryCommission
                   where agentcode = a.agentcode
                     and wageyear = a.indexcalno
                     and branchtype = '1'
                     and (managecom like '86' || '%')), 0)
                 + nvl((select citytax
                        from SalaryCommission
                        where agentcode = a.agentcode
                          and wageyear = a.indexcalno
                          and branchtype = '1'
                          and (managecom like '86' || '%')), 0)
                 + nvl((select EducationSurtax
                        from SalaryCommission
                        where agentcode = a.agentcode
                          and wageyear = a.indexcalno
                          and branchtype = '1'
                          and (managecom like '86' || '%')), 0)
                 + nvl((select LocalEducationSurtax
                        from SalaryCommission
                        where agentcode = a.agentcode
                          and wageyear = a.indexcalno
                          and branchtype = '1'
                          and (managecom like '86' || '%')), 0)
                 + 0
                 + nvl((select PersonalTax
                        from SalaryCommission
                        where agentcode = a.agentcode
                          and wageyear = a.indexcalno
                          and branchtype = '1'
                          and (managecom like '86' || '%')), 0)
                 )                                                                         x34,
             nvl(-1 * a.F42, 0)                                                            x35,
             nvl(-1 * a.F17, 0)                                                            x36,
             (nvl(-1 * a.F42, 0) + nvl(-1 * a.F17, 0))                                     x37,
             nvl(a.k16, 0)                                                                 x38
      from lawage a
      where a.branchtype = '1'
         and state = '5') b
where x27 + x34 + x37 + x38 < 0
  and X1 = date'2021-08-16'
--and A2 = '0101100451';
/*

update lawage
set k01='185625',
F37='3780',
    k02='285625',
    f09='3790',
    k03='3800',
    k04='3820',
    k09='3830',
    k12='3840',
    f11='3850',
    k07='3880',
    k08='3890',
    k05='3900',
    k10='3910',
    k13='3920',
    k06='3930',
    k11='3940',
    k14='3950',
    f44='3960',
    f33='3970',
    f42='3980',
    f16='3990',
    f17='4000',
    k16='4050'
where indexcalno = '202408'
  and AGENTCODE = '0101100451';


update lawage
set k01='0',
F37='0',
    k02='0',
    f09='0',
    k03='0',
    k04='0',
    k09='0',
    k12='0',
    f11='0',
    k07='0',
    k08='0',
    k05='0',
    k10='0',
    k13='0',
    k06='0',
    k11='0',
    k14='0',
    f44='0',
    f33='0',
    f42='0',
    f16='0',
    f17='0',
    k16='0'
where indexcalno = '202408'
  and AGENTCODE = '0101100451';

UPDATE lawage
SET F04=-F04,
F37 = -F37,
    k01 = -k01,
    k02 = -k02,
    f09 = -f09,
    k03 = -k03,
    k04 = -k04,
    k09 = -k09,
    k12 = -k12,
    f11 = -f11,
    k07 = -k07,
    k08 = -k08,
    k05 = -k05,
    k10 = -k10,
    k13 = -k13,
    k06 = -k06,
    k11 = -k11,
    k14 = -k14,
    f44 = -f44,
    f33 = -f33,
    f42 = -f42,
    f16 = -f16,
    f17 = -f17,
    f40 = -f40,
    k16 = -k16
WHERE indexcalno = '202106' and branchtype = '1'
         and state = '5'
  AND AGENTCODE = '0101100451';
*/

select /*(addedtax + citytax + EducationSurtax +
        LocalEducationSurtax + OtherLocalTaxation)*/*
from SalaryCommission
where agentcode = '0101100451'
  and wageyear = '202408'
  and branchtype = '1'
  and (managecom like '86' || '%');

/*
update SalaryCommission
set addedtax= -addedtax,
    citytax= -citytax,
    EducationSurtax= -EducationSurtax,
    LocalEducationSurtax= -LocalEducationSurtax,
    OtherLocalTaxation= -OtherLocalTaxation,
    PERSONALTAX= -PERSONALTAX
where agentcode = '0101100451'
  and wageyear = '202408'
  and branchtype = '1'
  and (managecom like '86' || '%');

update SalaryCommission
set addedtax= -addedtax,
    citytax= '4020',
    EducationSurtax= '4030',
    LocalEducationSurtax= '4040',
    OtherLocalTaxation= -OtherLocalTaxation,
    PERSONALTAX= '65802'
where agentcode = '0101100451'
  and wageyear = '202408'
  and branchtype = '1'
  and (managecom like '86' || '%');

update SalaryCommission
set addedtax= '0',
    citytax= '0',
    EducationSurtax= '0',
    LocalEducationSurtax= '0',
    OtherLocalTaxation= '0',
    PERSONALTAX= '0'
where agentcode = '0101100451'
  and wageyear = '202408'
  and branchtype = '1'
  and (managecom like '86' || '%');
*/

select a.*
from lawage a
where MODIFYDATE = date'2028-01-01';

update lawage
set STATE='4'
where MODIFYDATE = date'2028-01-01';


INSERT INTO LISDATA.LAWAGE (INDEXCALNO, AGENTCODE, AGENTGROUP, MANAGECOM, GETDATE, SUMMONEY, LASTMONEY, CURRMONEY, F01,
                            F02, F03, F04, F05, F06, F07, F08, F09, F10, F11, F12, F13, F14, F15, F16, F17, F18, F19,
                            F20, F21, F22, F23, F24, F25, F26, F27, F28, F29, F30, K01, K02, K03, K04, K05, K06, K07,
                            K08, K09, K10, K11, K12, K13, K14, K15, K16, K17, K18, K19, K20, CONFIRMDATE, STATE,
                            PAYMODE, OPERATOR, OPERATOR2, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, BRANCHTYPE,
                            SHOULDMONEY, BRANCHATTR, AGENTGRADE, W01, W02, W03, W04, W05, W06, W07, W08, W09, W10, K21,
                            BRANCHTYPE2, F31, F32, F33, F34, F35, F36, F37, F38, F39, F40, F41, F42, F43, F44, F45, F46,
                            F47, F48, F49, F50, PAYSUCDATE, SERIALNO)
VALUES ('202408', '0101100010', '000000005190', '86010101', DATE '2030-03-11', null, null, 8500.00, 0.00, null, null,
        2500.00, 0.00, null, null, 0.00, 0.00, null, 6000.00, 0.00, 0.00, null, null, 0.00, 0.00, null, null, null,
        null, null, 0.00, 0.00, 0.00, null, 0.00, 0.00, null, null, 577.50, 0.00, 0.00, 0.00, 113625.00, 0.00, 0.00,
        0.00, 3000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8500.00, null, null, 500.00, null, null, DATE '2030-03-11', '5',
        null, '001', '001', DATE '2030-03-11', '00:14:34', DATE '2028-01-01', '20:28:06', '1', null, '8601041002',
        'D01', 0.00, 0.00, null, null, null, null, null, null, null, null, null, '01', 0.00, 0.00, 0.00, 0.00, 0.00,
        0.00, 0.00, 0.00, 0.00, 126202.50, 0.00, 0.00, 0.00, 0.00, null, null, null, null, null, null,
        DATE '2025-09-02', 'SJ0_860000002025090200932120');
INSERT INTO LISDATA.LAWAGE (INDEXCALNO, AGENTCODE, AGENTGROUP, MANAGECOM, GETDATE, SUMMONEY, LASTMONEY, CURRMONEY, F01,
                            F02, F03, F04, F05, F06, F07, F08, F09, F10, F11, F12, F13, F14, F15, F16, F17, F18, F19,
                            F20, F21, F22, F23, F24, F25, F26, F27, F28, F29, F30, K01, K02, K03, K04, K05, K06, K07,
                            K08, K09, K10, K11, K12, K13, K14, K15, K16, K17, K18, K19, K20, CONFIRMDATE, STATE,
                            PAYMODE, OPERATOR, OPERATOR2, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, BRANCHTYPE,
                            SHOULDMONEY, BRANCHATTR, AGENTGRADE, W01, W02, W03, W04, W05, W06, W07, W08, W09, W10, K21,
                            BRANCHTYPE2, F31, F32, F33, F34, F35, F36, F37, F38, F39, F40, F41, F42, F43, F44, F45, F46,
                            F47, F48, F49, F50, PAYSUCDATE, SERIALNO)
VALUES ('202407', '0101100032', '000000005971', '86010101', DATE '2025-10-10', null, null, 1100.00, 0.00, null, null,
        1100.00, 0.00, null, null, 0.00, 0.00, null, 0.00, 0.00, 0.00, null, null, 0.00, 0.00, null, null, null, null,
        null, 0.00, 0.00, 0.00, null, 0.00, 0.00, null, null, 127.05, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00,
        0.00, 0.00, 0.00, 0.00, 0.00, 1100.00, null, null, 0.00, null, null, DATE '2025-10-10', '5', null, '001', '001',
        DATE '2025-10-10', '00:30:29', DATE '2028-01-01', '16:34:49', '1', null, '8601010100073001001', 'B01', 0.00,
        0.00, null, null, null, null, null, null, null, null, null, '01', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00,
        0.00, 0.00, 1227.05, 0.00, 0.00, 0.00, 0.00, null, null, null, null, null, null, DATE '2025-06-15',
        'SJ0_860000002025061300932120');

select a.F40, a.F44, a.F17, a.F16, a.F42, a.k16
from lawage a
where MODIFYDATE = date'2028-01-01';


/*
update lawage
set F40='442925',
    F44='3960',
    F17='4000',
    F16='3990',
    F42='3980',
    k16='4050'
where MODIFYDATE = date'2028-01-01';

update lawage
set F40='0',
    F44='0',
    F17='0',
    F16='0',
    F42='0',
    k16='0'
where MODIFYDATE = date'2028-01-01';
*/

select nvl(a1, 0) 趸交首期,
       nvl(b1, 0) 期交首期,
       nvl(c1, 0) 期交续期,
       riskcode   险种,
       contno     保单号,
       modifydate 审批通过日期,
       INDEXCALNO,
       AGENTCODE
from (select case
                 when b.payintv in ('-1', '0')
                     and b.paycount = '1' then nvl(b.fyc, 0) end a1,
             case
                 when b.payintv not in ('-1', '0')
                     and b.paycount = '1' then nvl(b.fyc, 0) end b1,
             case
                 when b.payintv not in ('-1', '0')
                     and b.paycount > '1' then nvl(b.fyc, 0) end c1,
             b.RISKCODE                                          riskcode,
             b.contno                                            contno,
             a.MODIFYDATE                                        modifydate,
             a.INDEXCALNO                                        INDEXCALNO,
             a.AGENTCODE                                         AGENTCODE
      from lawage a,
           lacommision b
      where a.INDEXCALNO = b.WAGENO
        and a.AGENTCODE = b.AGENTCODE
        and a.branchtype = '1'
        and a.state = '5') A
where /*b1 <> '0'
  and */is_universalinsurance(riskcode) = 'Y';

select a.*
from lawage a where modifydate=date'2021-08-16';


select fyc, b.MODIFYDATE, b.agentcode, a.contno, a.POLNO
from lawage b,
     lacommision a
where b.indexcalno = a.wageno
  and b.agentcode = a.agentcode
--   and b.MODIFYDATE = date'2021-08-16'
--   and b.indexcalno = '202106'
--   and (b.indexcalno = '202106' or b.INDEXCALNO = '202407')
--   and b.agentcode = '0101100023'
--   and a.paycount = '1'--首期
--   and a.paycount > '1'--续期
--   and a.payintv in ('-1', '0')--趸交
--   and a.payintv not in ('-1', '0')--期交
  and a.CONTNO = '2024073000000986'
  and fyc <> '0';

select *
from lacommision a
where CONTNO = '2021060100001886';

select a.* from LISDATA.LAWAGE a where INDEXCALNO='202106' and STATE='5' and BRANCHTYPE='1';

/*
update lacommision set fyc='1500',payintv='0',PAYCOUNT='1' where CONTNO = '2021060100001886';
*/

select contno, polno, payintv, payendyear, a.*
from lcpol a
where contno = '2019061900004126';

select a.*
from lacommision a
where (wageno = '202408' or wageno = '202407');
update lacommision
set fyc= -fyc
where (wageno = '202408' or wageno = '202407')


/*
select a.*
from lcpol a
where contno = '2024073000000986';
*/
