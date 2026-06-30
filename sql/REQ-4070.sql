-- id: req-4070
-- 标题: 核心系统日结调整的需求

select inbankcode,inbankaccno,a.* from lyrefundlog a where otherno='2024110100000486';

select a.* from ljaget a where otherno='2024110100000486';

select * from ldcode where codetype = 'bank';

select a.* from ldtask a where taskdescribe like '%退票%';

select a.actugetno,
       a.otherno,
       b.payinfocode,
       b.payinfo,
       a.paymode,
       b.reqseqid
  from ljaget a, ats_transactions b
 where a.actugetno = b.sourcenotecode
   and a.otherno='5000118241104186'
   and a.banksuccflag = '1'
   and a.actugetno = b.sourcenotecode
   and b.transstate = '6'
   and b.reqseqid = (select max(serialno)
                       from lyreturnfrombankb c
                      where a.otherno = c.polno
                        and a.actugetno = c.paycode)
   and exists (select 1
          from lyreturnfrombankb t
         where a.actugetno = t.paycode
           and a.otherno = t.polno
           and t.banksuccflag = '0000'
           and t.serialno = b.reqseqid)
   and not exists (select 1
          from lyrefundlog c
         where c.standbyflag2 = b.reqseqid
           and c.actugetno = a.actugetno);