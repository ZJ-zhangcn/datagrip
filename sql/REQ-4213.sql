-- id: req-4213
-- 标题: 关于销管系统个险佣金实现财务核算自动化的项目需求

select a1                    佣金所属年月,
       x27 + x34 + x37 + x38 实发金额,
       a2                    代理人编码,
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
from (select a.indexcalno                                                                  a1,
             a.agentcode                                                                   a2,
             a.modifydate                                                                  x1,
             nvl(a.f04, 0)                                                                 x2,
             nvl(a.f05, 0)                                                                 x3,
             nvl(a.f37, 0)                                                                 x4,
             nvl(a.k01, 0)                                                                 x5,
             nvl(a.k02, 0)                                                                 x6,
             nvl(a.f09, 0)                                                                 x7,
             nvl(a.k03, 0)                                                                 x8,
             nvl(a.k04, 0)                                                                 x9,
             nvl(a.k09, 0)                                                                 x10,
             nvl(a.k12, 0)                                                                 x11,
             nvl(a.f11, 0)                                                                 x12,
             nvl(a.k07, 0)                                                                 x13,
             nvl(a.k08, 0)                                                                 x14,
             nvl(a.k05, 0)                                                                 x15,
             nvl(a.k10, 0)                                                                 x16,
             nvl(a.k13, 0)                                                                 x17,
             nvl(a.k06, 0)                                                                 x18,
             nvl(a.k11, 0)                                                                 x19,
             nvl(a.k14, 0)                                                                 x20,
             nvl(a.f44, 0)                                                                 x21,
             nvl(a.f33, 0)                                                                 x22,
             nvl(a.f42, 0)                                                                 x23,
             nvl(a.f16, 0)                                                                 x24,
             nvl(a.f17, 0)                                                                 x25,
             '0'                                                                           x26,
             nvl(a.f40, 0) + nvl(a.f44, 0) + nvl(a.f17, 0) + nvl(a.f16, 0) + nvl(a.f42, 0) x27,
             nvl((select (addedtax + citytax + educationsurtax +
                          localeducationsurtax + otherlocaltaxation)
                  from salarycommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x28,
             nvl((select citytax
                  from salarycommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x29,
             nvl((select educationsurtax
                  from salarycommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x30,
             nvl((select localeducationsurtax
                  from salarycommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x31,
             '0'                                                                           x32,
             nvl((select personaltax
                  from salarycommission
                  where agentcode = a.agentcode
                    and wageyear = a.indexcalno
                    and branchtype = '1'
                    and (managecom like '86' || '%')),
                 0)                                                                        x33,
             (nvl((select (addedtax + citytax + educationsurtax + localeducationsurtax + otherlocaltaxation)
                   from salarycommission
                   where agentcode = a.agentcode
                     and wageyear = a.indexcalno
                     and branchtype = '1'
                     and (managecom like '86' || '%')), 0)
                 + nvl((select citytax
                        from salarycommission
                        where agentcode = a.agentcode
                          and wageyear = a.indexcalno
                          and branchtype = '1'
                          and (managecom like '86' || '%')), 0)
                 + nvl((select educationsurtax
                        from salarycommission
                        where agentcode = a.agentcode
                          and wageyear = a.indexcalno
                          and branchtype = '1'
                          and (managecom like '86' || '%')), 0)
                 + nvl((select localeducationsurtax
                        from salarycommission
                        where agentcode = a.agentcode
                          and wageyear = a.indexcalno
                          and branchtype = '1'
                          and (managecom like '86' || '%')), 0)
                 + 0
                 + nvl((select personaltax
                        from salarycommission
                        where agentcode = a.agentcode
                          and wageyear = a.indexcalno
                          and branchtype = '1'
                          and (managecom like '86' || '%')), 0)
                 )                                                                         x34,
             nvl(-1 * a.f42, 0)                                                            x35,
             nvl(-1 * a.f17, 0)                                                            x36,
             (nvl(-1 * a.f42, 0) + nvl(-1 * a.f17, 0))                                     x37,
             nvl(a.k16, 0)                                                                 x38
      from lawage a
      where a.branchtype = '1'
         and state = '5') b
where x27 + x34 + x37 + x38 < 0
  and x1 = date'2021-08-16'
--and a2 = '0101100451';
/*

update lawage
set k01='185625',
f37='3780',
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
  and agentcode = '0101100451';


update lawage
set k01='0',
f37='0',
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
  and agentcode = '0101100451';

update lawage
set f04=-f04,
f37 = -f37,
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
where indexcalno = '202106' and branchtype = '1'
         and state = '5'
  and agentcode = '0101100451';
*/

select /*(addedtax + citytax + educationsurtax +
        localeducationsurtax + otherlocaltaxation)*/*
from salarycommission
where agentcode = '0101100451'
  and wageyear = '202408'
  and branchtype = '1'
  and (managecom like '86' || '%');

/*
update salarycommission
set addedtax= -addedtax,
    citytax= -citytax,
    educationsurtax= -educationsurtax,
    localeducationsurtax= -localeducationsurtax,
    otherlocaltaxation= -otherlocaltaxation,
    personaltax= -personaltax
where agentcode = '0101100451'
  and wageyear = '202408'
  and branchtype = '1'
  and (managecom like '86' || '%');

update salarycommission
set addedtax= -addedtax,
    citytax= '4020',
    educationsurtax= '4030',
    localeducationsurtax= '4040',
    otherlocaltaxation= -otherlocaltaxation,
    personaltax= '65802'
where agentcode = '0101100451'
  and wageyear = '202408'
  and branchtype = '1'
  and (managecom like '86' || '%');

update salarycommission
set addedtax= '0',
    citytax= '0',
    educationsurtax= '0',
    localeducationsurtax= '0',
    otherlocaltaxation= '0',
    personaltax= '0'
where agentcode = '0101100451'
  and wageyear = '202408'
  and branchtype = '1'
  and (managecom like '86' || '%');
*/

select a.*
from lawage a
where modifydate = date'2028-01-01';

/*
update lawage
set state='4'
where modifydate = date'2028-01-01';


insert into lisdata.lawage (indexcalno, agentcode, agentgroup, managecom, getdate, summoney, lastmoney, currmoney, f01,
                            f02, f03, f04, f05, f06, f07, f08, f09, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19,
                            f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, k01, k02, k03, k04, k05, k06, k07,
                            k08, k09, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20, confirmdate, state,
                            paymode, operator, operator2, makedate, maketime, modifydate, modifytime, branchtype,
                            shouldmoney, branchattr, agentgrade, w01, w02, w03, w04, w05, w06, w07, w08, w09, w10, k21,
                            branchtype2, f31, f32, f33, f34, f35, f36, f37, f38, f39, f40, f41, f42, f43, f44, f45, f46,
                            f47, f48, f49, f50, paysucdate, serialno)
values ('202408', '0101100010', '000000005190', '86010101', date '2030-03-11', null, null, 8500.00, 0.00, null, null,
        2500.00, 0.00, null, null, 0.00, 0.00, null, 6000.00, 0.00, 0.00, null, null, 0.00, 0.00, null, null, null,
        null, null, 0.00, 0.00, 0.00, null, 0.00, 0.00, null, null, 577.50, 0.00, 0.00, 0.00, 113625.00, 0.00, 0.00,
        0.00, 3000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8500.00, null, null, 500.00, null, null, date '2030-03-11', '5',
        null, '001', '001', date '2030-03-11', '00:14:34', date '2028-01-01', '20:28:06', '1', null, '8601041002',
        'D01', 0.00, 0.00, null, null, null, null, null, null, null, null, null, '01', 0.00, 0.00, 0.00, 0.00, 0.00,
        0.00, 0.00, 0.00, 0.00, 126202.50, 0.00, 0.00, 0.00, 0.00, null, null, null, null, null, null,
        date '2025-09-02', 'SJ0_860000002025090200932120');

insert into lisdata.lawage (indexcalno, agentcode, agentgroup, managecom, getdate, summoney, lastmoney, currmoney, f01,
                            f02, f03, f04, f05, f06, f07, f08, f09, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19,
                            f20, f21, f22, f23, f24, f25, f26, f27, f28, f29, f30, k01, k02, k03, k04, k05, k06, k07,
                            k08, k09, k10, k11, k12, k13, k14, k15, k16, k17, k18, k19, k20, confirmdate, state,
                            paymode, operator, operator2, makedate, maketime, modifydate, modifytime, branchtype,
                            shouldmoney, branchattr, agentgrade, w01, w02, w03, w04, w05, w06, w07, w08, w09, w10, k21,
                            branchtype2, f31, f32, f33, f34, f35, f36, f37, f38, f39, f40, f41, f42, f43, f44, f45, f46,
                            f47, f48, f49, f50, paysucdate, serialno)
values ('202407', '0101100032', '000000005971', '86010101', date '2025-10-10', null, null, 1100.00, 0.00, null, null,
        1100.00, 0.00, null, null, 0.00, 0.00, null, 0.00, 0.00, 0.00, null, null, 0.00, 0.00, null, null, null, null,
        null, 0.00, 0.00, 0.00, null, 0.00, 0.00, null, null, 127.05, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00,
        0.00, 0.00, 0.00, 0.00, 0.00, 1100.00, null, null, 0.00, null, null, date '2025-10-10', '5', null, '001', '001',
        date '2025-10-10', '00:30:29', date '2028-01-01', '16:34:49', '1', null, '8601010100073001001', 'B01', 0.00,
        0.00, null, null, null, null, null, null, null, null, null, '01', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00,
        0.00, 0.00, 1227.05, 0.00, 0.00, 0.00, 0.00, null, null, null, null, null, null, date '2025-06-15',
        'SJ0_860000002025061300932120');
*/

select a.f40, a.f44, a.f17, a.f16, a.f42, a.k16
from lawage a
where modifydate = date'2028-01-01';


/*
update lawage
set f40='442925',
    f44='3960',
    f17='4000',
    f16='3990',
    f42='3980',
    k16='4050'
where modifydate = date'2028-01-01';

update lawage
set f40='0',
    f44='0',
    f17='0',
    f16='0',
    f42='0',
    k16='0'
where modifydate = date'2028-01-01';
*/

select nvl(a1, 0) 趸交首期,
       nvl(b1, 0) 期交首期,
       nvl(c1, 0) 期交续期,
       riskcode   险种,
       contno     保单号,
       modifydate 审批通过日期,
       indexcalno,
       agentcode
from (select case
                 when b.payintv in ('-1', '0')
                     and b.paycount = '1' then nvl(b.fyc, 0) end a1,
             case
                 when b.payintv not in ('-1', '0')
                     and b.paycount = '1' then nvl(b.fyc, 0) end b1,
             case
                 when b.payintv not in ('-1', '0')
                     and b.paycount > '1' then nvl(b.fyc, 0) end c1,
             b.riskcode                                          riskcode,
             b.contno                                            contno,
             a.modifydate                                        modifydate,
             a.indexcalno                                        indexcalno,
             a.agentcode                                         agentcode
      from lawage a,
           lacommision b
      where a.indexcalno = b.wageno
        and a.agentcode = b.agentcode
        and a.branchtype = '1'
        and a.state = '5') a
where /*b1 <> '0'
  and */is_universalinsurance(riskcode) = 'Y';

select a.*
from lawage a where modifydate=date'2021-08-16';


select fyc, b.modifydate, b.agentcode, a.contno, a.polno
from lawage b,
     lacommision a
where b.indexcalno = a.wageno
  and b.agentcode = a.agentcode
--   and b.modifydate = date'2021-08-16'
--   and b.indexcalno = '202106'
--   and (b.indexcalno = '202106' or b.indexcalno = '202407')
--   and b.agentcode = '0101100023'
--   and a.paycount = '1'--首期
--   and a.paycount > '1'--续期
--   and a.payintv in ('-1', '0')--趸交
--   and a.payintv not in ('-1', '0')--期交
  and a.contno = '2024073000000986'
  and fyc <> '0';

select *
from lacommision a
where contno = '2021060100001886';

select a.* from lisdata.lawage a where indexcalno='202106' and state='5' and branchtype='1';

/*
update lacommision set fyc='1500',payintv='0',paycount='1' where contno = '2021060100001886';
*/

select contno, polno, payintv, payendyear, a.*
from lcpol a
where contno = '2019061900004126';

select a.*
from lacommision a
where (wageno = '202408' or wageno = '202407');

/*
update lacommision
set fyc= -fyc
where (wageno = '202408' or wageno = '202407')
*/


/*
select a.*
from lcpol a
where contno = '2024073000000986';
*/
