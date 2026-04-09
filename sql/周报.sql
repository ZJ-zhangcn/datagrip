--每周五状态核对
select *
from req
where onlinedate between date'2025-08-11' and date'2025-08-15';

--本周测试需求
select (select codename
        from ldcode
        where codetype = 'reqprogress'
          and code = a.state)  需求状态,
       (select codename
        from ldcode
        where codetype = 'reqmodule'
          and code = a.demo)   模块,
       a.no                    需求号,
       a.name                  需求名,
       (case
            when c.csrstartdate is null then '未测试'
            when c.csrenddate is not null then '测试完成'
            else '测试中' end) 状态,
       c.csopstartdate         计划开始,
       c.csopenddate           计划结束,
       c.csrstartdate          实际开始,
       c.csrenddate            实际结束,
       (case
            when b.state is null then
                '未评估'
            when b.state in ('1', '2') then
                '未确认'
            else
                to_char(b.cs1, 'fm9990.90')
           end)                确认,
       case
           when b.state is null or b.state = '1' then
               '未评估'
           else
               to_char(b.cs, 'fm9990.90')
           end                 评估,
       c.csrate                进度,
       c.xkf                   开发,
       c.xcs                   测试,
       a.it                    IT
from req a
         left join reqwork b
                   on a.serialno = b.serialno
         left join reqplan c
                   on a.serialno = c.serialno
where c.csrenddate > date '2026-02-28'                                         --上周五
   or (c.csrenddate is null and c.cspenddate <= date'2026-03-06' and
       a.state in ('01', '02', '03', '04', '05', '06', '07', '08'))--本周五
   or (c.cspenddate > date'2026-02-28' and c.cspstartdate <= date '2026-03-06')--上周五,本周五
order by 状态, c.csopstartdate;


select xkf, a.*
from reqplan a
where no = 'REQ-4082';


--下周测试需求
select (select codename
        from ldcode
        where codetype = 'reqprogress'
          and code = a.state)  需求状态,
       (select codename
        from ldcode
        where codetype = 'reqmodule'
          and code = a.demo)   模块,
       a.no                    需求号,
       a.name                  需求名,
       (case
            when c.csrstartdate is null then '未测试'
            when c.csrenddate is not null then '测试完成'
            else '测试中' end) 状态,
       c.csopstartdate         计划开始,
       c.csopenddate           计划结束,
       c.csrstartdate          实际开始,
       c.csrenddate            实际结束,
       (case
            when b.state is null then
                '未评估'
            when b.state in ('1', '2') then
                '未确认'
            else
                to_char(b.cs1, 'fm9990.90')
           end)                确认,
       case
           when b.state is null or b.state = '1' then
               '未评估'
           else
               to_char(b.cs, 'fm9990.90')
           end                 评估,
       c.csrate                进度,
       c.kf                    开发,
       c.xcs                   测试,
       a.it                    IT
from req a
         left join reqwork b
                   on a.serialno = b.serialno
         left join reqplan c
                   on a.serialno = c.serialno
where c.csrenddate is null
  and a.State in ('01', '02', '03', '04', '05', '06')
  and (c.csrstartdate is not null or c.csopstartdate <= date '2026-03-13') --下周五
order by c.csrstartdate, c.csopstartdate;


select a.*
from req a
where no = 'REQ-3919';
select a.*
from reqwork a
where no = 'REQ-3919';
select a.*
from reqplan a
where no = 'REQ-3919';


--
select a.demo          模块,
       a.state         状态,
       a.no            需求号,
       a.name          需求名称,
       a.report        报告人,
       a.createdate    创建日期,
       a.it            IT负责人,
       a.csopstartdate 计划开始日期,
       a.csopenddate   计划结束日期,
       a.csrstartdate  实际开始日期,
       a.csrenddate    实际结束日期
from reqinfoop a
where a.csopenddate between date '2024-05-01' and date '2024-05-31';

--上线需求
select count(*)
from req a
where ONLINEDATE between date '2024-05-01' and date '2024-05-31';

select demo, state
from reqinfoop a
where a.csopenddate between date'2024-05-01' and date '2024-05-31'
group by demo, state;


select DISTINCT *
from reqinfoop
where (XQPENDDATE > date '2025-1-1' AND XQPSTARTDATE < date '2026-1-1' AND BA = '张锦')