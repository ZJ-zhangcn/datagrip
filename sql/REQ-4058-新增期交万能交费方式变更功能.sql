select a.* from lmriskapp a where riskname like '%盛世恒赢%';
select a.* from lmriskapp a where riskname like '%稳赢鑫生%';
select a.* from lmriskapp a where riskcode='1303002';

select a.* from ldcode a where codetype like '%kindcode%';

select urgepayflag,a.* from lmriskpay a where riskcode='1303012';

select a.* from ldtask a where taskdescribe like '%万能%';

select appflag,a.* from lcpol a where contno='2024032200000826';
select cvalidate,appflag,managecom,salecom,a.* from lccont a where contno='2023120700000826';
select a.* from lccontstate a where contno='2024031800000596';

--万能交费方式  paytype:1-公司扣费 2-自主交费
select a.* from xqpaychangeinfo a where contno='2023090100000206';

select a.* from xqpaychangeinfo a where paytype='1' and contno in (select contno from lcpol where contno=a.contno and paytodate < payenddate and riskcode='1303012');
select a.* from lcpol a where riskcode='1303012' and appflag='1' and not exists (select 1 from xqpaychangeinfo where contno=a.contno) and paytodate != payenddate;

--短信
select a.* from sms_dispatch_list a where SENDTARGET='18541665582';
--续期短信
select a.* from lcmeglog a where otherno='2023090100000206';
--serivceid短信编码
select * from lisdata.lcmegrelation WHERE sendcode='XQ00024';
--修改万能交费方式上传资料路径
select a.* from xqpaychangeimporterror a where contno='2023120700000826';
select a.* from xqpaychangeimporterror a where SERIALNO='980Pa0000000022';
--万能交费方式修改轨迹
select a.* from xqpaychangetrace a where contno='2023120700000826';
select a.* from xqpaychangetrace a where SERIALNO='980Pa0000000022';

--万能交费方式置值批处理取数
select *
  from lccont a
 where a.conttype = '1'
   and a.appflag = '1'
   --and contno = '2024031800000596'
   --and a.cvalidate < date '2024-03-19'
   and exists (select 1
          from lcpol
         where contno = a.contno
           and kindcode = 'U'
           and payintv <> '0')
   and not exists (select 1
          from xqpaychangeinfo
         where contno = a.contno
           and paytype is not null) order by cvalidate desc;

--
select c.managecom || '-' ||
       (select name
          from ldcom
         where '1710749971000' = '1710749971000'
           and ComCode = c.managecom) managecom,
       C.CONTNO 保单号,
       (SELECT D.CODENAME
          FROM LDCODE D
         WHERE D.CODETYPE = 'salecom'
           AND D.CODE = C.SALECOM) 业绩归属渠道,
       (select to_char(wm_concat((select riskname
                                   from lmriskapp
                                  where riskcode = lcpol.riskcode)))
          from lcpol
         where contno = c.contno) 险种名称,
       (select codename
          from ldcode
         where codetype = 'uriskpayflag'
           and code = a.paytype) 当前万能交费方式
  from lccont c, xqpaychangeinfo a
 where a.contno = c.contno
   and exists
 (select 1
          from lcpol p
         where p.contno = c.contno
           and p.payintv <> '0')
   and conttype = '1'
   and c.salecom in (select salecom from lmuserview where usercode = '001')
   and c.managecom like '86%'
   and c.contno = '2024031800000596'
 order by c.managecom, c.salecom, c.contno;